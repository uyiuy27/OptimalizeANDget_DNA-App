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


// TODO: ma się dodawać lista userów ale dto, również według roli wrzucamy listę dto, w widoku dodać opcję zmiany roli, banowania i usuwania userów
    @GetMapping("/users/all")
    public String allUsers(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("users", userService.findAllDtoByRole("ROLE_USER"));
            return "admin/users";
        }
        return "redirect:/logout";
    }

    @GetMapping("/admins/all")
    public String allAdmins(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("admins",userService.findAllDtoByRole("ROLE_ADMIN"));
            return "admin/admins";
        }
        return "redirect:/logout";

    }

    @GetMapping("/all")
    public String all(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("allUsers",userService.findAllDto());
            return "admin/all";
        }
        return "redirect:/logout";
    }

}
