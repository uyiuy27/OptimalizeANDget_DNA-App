package pl.ilonaptak.OptimalizeANDget_DNA.user.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "/user/form";

    }

    @PostMapping("/add")
    public String add(@Valid User user, BindingResult bindingResult) {
        System.out.println("test");
        if (bindingResult.hasErrors()) {
            return "user/form";
        }
        userService.save(user);
        return "redirect:/user/hinew";
    }

    @GetMapping("/details/{id}")
    public String showUserDetails (@PathVariable int id, Model model) {
        model.addAttribute("details", userService.findById(id));
        return "user/details";
        // wchodzimy na profil usera, może tu przejrzeć swoje eksperymenty, zmienić dane konta, usunąć konto itp.
    }

    @GetMapping("/hinew")
    @ResponseBody
    public String login() {
        return "hello";
    }




}
