package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.*;


@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final ExperimentService experimentService;

    @GetMapping("/account/{id}")
    public String showUserDetails(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (userService.existsById(id)) {
            if (user.getId() == id) {
                model.addAttribute("userExperiments", experimentService.findAllByUserId(id));
                model.addAttribute("user", userService.findUserDtoById(id));
                model.addAttribute("id", id);
                return "user/details";
            }
        }
        return "redirect:/logout";
    }

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (userService.existsById(id)) {
            if (user.getId() == id) {
                model.addAttribute("user", userService.findUserDtoById(id));
                model.addAttribute("id", id);
                return "user/update";
            }
        }
        return "redirect:/logout";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable int id, UserEditDto user, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser) {
        User cuUser = currentUser.getUser();
        if (cuUser.getId() == id) {
            userService.update(user);
            return "redirect:/user/account/" + id;
        } else {
            return "redirect:/logout";
        }
    }

    @GetMapping("/updatepass/{id}")
    public String updatePass(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (userService.existsById(id)) {
            if (user.getId() == id) {
                model.addAttribute("userPass", new UserEditPasswordDto());
                model.addAttribute("id", id);
                return "user/updatepass";
            }
        }
        return "redirect:/logout";
    }

    @PostMapping("/updatepass/{id}")
    public String updateUser(@PathVariable int id, UserEditPasswordDto user, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser) {
        User cuUser = currentUser.getUser();
        if (cuUser.getId() == id) {
            userService.updatePassword(user, id);
            return "redirect:/user/account/" + id;
        } else {
            return "redirect:/logout";
        }
    }

    @GetMapping("/confirm/{id}")
    public String confirmDelete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User cuUser = currentUser.getUser();
        if (cuUser.getId() == id || cuUser.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("id", id);
            return "user/confirm";
        } else {
            return "redirect:/logout";
        }
    }

// TODO: jeżeli id istnieje to potwierdzamy czy to ten user i jeśli nie to wylogowujemy jak update
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getId() == id && !user.getRole().equals("ROLE_ADMIN")) {
            userService.delete(id);
            return "redirect:/logout";
        } else if (user.getRole().equals("ROLE_ADMIN")) {
            if (userService.findAllByRole("ROLE_ADMIN").size() > 1 || !userService.findById(id).getRole().equals("ROLE_ADMIN")) {
                userService.delete(id);
                return "redirect:/admin/all";
            } else {
                model.addAttribute("notDelete", "can't delete user");
                return "redirect:/admin/all";
            }
        } else {
            return "redirect:/logout";
        }
    }


}
