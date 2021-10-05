package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.*;
import pl.ilonaptak.OptimalizeANDget_DNA.user.dto.UserEditDto;
import pl.ilonaptak.OptimalizeANDget_DNA.user.dto.UserEditPasswordDto;
import pl.ilonaptak.OptimalizeANDget_DNA.user.entity.User;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final ExperimentService experimentService;

    /**
     * Endpoint wyświetlający szczegóły konta dla obecnie zalogowanego Usera
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/account/{id}")
    public String showUserDetails(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (userService.existsById(id)) {
            if (user.getId() == id) {
                model.addAttribute("userExperiments", experimentService.findAllByUserId(id));
                model.addAttribute("user", userService.findUserDtoById(id));
                model.addAttribute("id", id);
                if (user.getRole().equals("ROLE_ADMIN")) {
                    model.addAttribute("admin", user.getRole());
                }
                return "user/details";
            }

        }
        return "redirect:/logout";
    }

    /**
     * Endpoint wyświetlający profil Usera
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
// TODO: zmienić odpowiednio na ogólnie widoczny profil
    @GetMapping("/profile/{id}")
    public String showUserProfile(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (userService.existsById(id)) {
                model.addAttribute("userExperiments", experimentService.findAllByUserId(id));
                model.addAttribute("user", userService.findUserDtoById(id));
                model.addAttribute("id", id);
                if (user.getRole().equals("ROLE_ADMIN")) {
                    model.addAttribute("admin", user.getRole());
                }
                return "user/profile";
            }
        return "redirect:/";
    }

    /**
     * endpoint aktualizujący dane Usera
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
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
        if (bindingResult.hasErrors()) {
            return "user/update";
        }
        if (cuUser.getId() == id) {
            userService.update(user);
            return "redirect:/user/account/" + id;
        } else {
            return "redirect:/logout";
        }
    }

    /**
     * Endpoint aktualizujący hasło usera
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
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
    public String updateUser(@PathVariable int id, UserEditPasswordDto user, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser, HttpServletRequest request, Model model) {
        String password = request.getParameter("passwordConfirm");
        User cuUser = currentUser.getUser();
        if (cuUser.getId() == id) {
            if (bindingResult.hasErrors() && !password.equals(user.getPassword())) {
                request.setAttribute("errorPassword", "Podane hasła są różne");
                model.addAttribute("userPass", new UserEditPasswordDto());
                model.addAttribute("id", id);
                return "user/updatepass";
            } else if (bindingResult.hasErrors()) {
                model.addAttribute("userPass", new UserEditPasswordDto());
                model.addAttribute("id", id);
                return "user/updatepass";
            } else if (!password.equals(user.getPassword())) {
                model.addAttribute("id", id);
                model.addAttribute("userPass", new UserEditPasswordDto());
                request.setAttribute("errorPassword", "Podane hasła są różne");
                return "user/updatepass";
            } else {
                userService.updatePassword(user, id);
                return "redirect:/user/account/" + id;
            }
        } else {
            return "redirect:/logout";
        }
    }

    /**
     * Endpoint potwierdzający chęć usunięcia konta
     * @param id
     * @param currentUser - obecnie zalogowany user
     * @param model
     * @return
     */
    @GetMapping("/confirm/{id}")
    public String confirmDelete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User cuUser = currentUser.getUser();
        if (cuUser.getId() == id || cuUser.getRole().equals("ROLE_ADMIN")) {
            if (cuUser.getRole().equals("ROLE_ADMIN")) {
                model.addAttribute("admin", cuUser.getRole());
            }
            model.addAttribute("user", cuUser);
            model.addAttribute("id", id);
            return "user/confirm";
        } else {
            return "redirect:/logout";
        }
    }

    /**
     * Endpoint usuwający usera
     * @param id
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getId() == id && !user.getRole().equals("ROLE_ADMIN")) {
            experimentService.deleteAllByUserId(id);
            userService.delete(id);
            return "redirect:/logout";
        } else if (user.getRole().equals("ROLE_ADMIN")) {
            if (userService.findAllByRole("ROLE_ADMIN").size() > 1 || !userService.findById(id).getRole().equals("ROLE_ADMIN")) {
                experimentService.deleteAllByUserId(id);
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
