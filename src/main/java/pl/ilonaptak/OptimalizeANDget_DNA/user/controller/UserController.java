package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserEditDto;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;


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
        if (user.getId() == id) {
            userService.update(user);
            return "redirect:/user/account/" + id;
        } else {
            return "redirect:/logout";
        }
    }
// TODO: jeżeli id istnieje to potwierdzamy czy to ten user i jeśli nie to wylogowujemy jak update
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getId() == id) {
            userService.delete(id);
        }
        return "redirect:/logout";
    }


}
