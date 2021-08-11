package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.servlet.http.HttpServletRequest;

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
            model.addAttribute("user", user);
            return "admin/users";
        }
        return "redirect:/logout";
    }

    @GetMapping("/admins/all")
    public String allAdmins(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("admins",userService.findAllDtoByRole("ROLE_ADMIN"));
            model.addAttribute("user", user);
            return "admin/admins";
        }
        return "redirect:/logout";

    }

    @GetMapping("/all")
    public String all(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (user.getRole().equals("ROLE_ADMIN")) {
            model.addAttribute("allUsers",userService.findAllDto());
            model.addAttribute("user", user);
            return "admin/all";
        }
        return "redirect:/logout";
    }

    @GetMapping("/change/{id}")
    public String changeRole(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser, HttpServletRequest request) {
        User user = currentUser.getUser();
        if (!user.getRole().equals("ROLE_ADMIN")) {
            return "redirect:/logout";
        }
        if (user.getId() != id && userService.existsById(id)) {
            User userToChange = userService.findById(id);
            String role = "";
            if (userToChange.getRole().equals("ROLE_USER")) {
                role = "ROLE_ADMIN";
            } else {
                role = "ROLE_USER";
            }
            userService.saveRole(userToChange, role);
        }
//        String referer = request.getHeader("Referer");
//        return "redirect:"+referer;
        return "redirect:/admin/all";
    }

}
