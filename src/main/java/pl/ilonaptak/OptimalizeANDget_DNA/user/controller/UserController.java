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
    public String showUserDetails(@PathVariable int id, Model model) {
        model.addAttribute("userExperiments", experimentService.findAllByUserId(id));
        model.addAttribute("user", userService.findUserDtoById(id));
        return "user/details";
    }

    @GetMapping("/hinew")
    @ResponseBody
    public String login() {
        return "hello";
    }

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getId() == id) {
            model.addAttribute("user", userService.findUserDtoById(id));
            return "user/update"; // nie ma jeszcze widoku
        } else {
            return "redirect:/logout";
        }
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable int id, User user, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser) {
        User cuUser = currentUser.getUser();
        if (user.getId() == id) {
            userService.update(user);
            return "redirect:/account/{id}";
        } else {
            return "redirect:/logout";
        }
    }

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
