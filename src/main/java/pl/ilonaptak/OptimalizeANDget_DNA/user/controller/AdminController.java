package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;

// to z wykładów
    @GetMapping
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        return "Hello" + user.getUsername();
    }

    @GetMapping("/users/all")
    public String allUsers(Model model) {
        model.addAttribute("users",userService.findAllByRole("ROLE_USER"));
        return "admin/users";
    }

    @GetMapping("/admins/all")
    public String allAdmins(Model model) {
        model.addAttribute("admins",userService.findAllByRole("ROLE_ADMIN"));
        return "admin/admins";
    }

    @GetMapping("/all")
    public String all(Model model) {
        model.addAttribute("allUsers",userService.findAll());
        return "admin/all";
    }



}
