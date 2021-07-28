package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;


@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final ExperimentService experimentService;

    @GetMapping("/account/{id}")
    public String showUserDetails (@PathVariable int id, Model model) {
//        TODO ogarnąć żeby dto działało
//        model.addAttribute("user", userService.findUserDtoById(id));
        model.addAttribute("user", userService.findById(id));
        model.addAttribute("userExperiments", experimentService.findAllByUserId(id));
        return "user/details";
        // wchodzimy na profil usera, może tu przejrzeć swoje eksperymenty, zmienić dane konta, usunąć konto itp.
    }

    @GetMapping("/hinew")
    @ResponseBody
    public String login() {
        return "hello";
    }

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if(user.getId() == id) {
            model.addAttribute("user", userService.findUserDtoById(id));
            return "user/update"; // nie ma jeszcze widoku
        } else {
            return "redirect:/logout";
        }
    }

    @PostMapping("/update/{id}")
    @ResponseBody
    public String updateUser(@PathVariable int id, User user, @AuthenticationPrincipal CurrentUser currentUser) {
        User cuUser = currentUser.getUser();
        if(user.getId() == id) {
            userService.update(user);
            return "redirect:/account/{id}";
        } else {
            return "redirect:/logout";
        }
    }

    @RequestMapping("/confirm/{id}")
    public String confirmDelete(@PathVariable int id, Model model) {
        model.addAttribute("id", id);
        // tutaj będzie formularz potwierdzający na email kod
        return "/user/confirm"; // tu też dodać widok
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable int id) {
        userService.delete(id);
        return "deleted";
    }







}
