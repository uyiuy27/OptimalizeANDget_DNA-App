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

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable int id, Model model) {
        model.addAttribute("user", userService.findUserDtoById(id));
        return "user/update"; // nie ma jeszcze widoku
    }

    @PostMapping("/update/{id}")
    @ResponseBody
    public String updateUser(@PathVariable int id, User user) {
        userService.update(user);
        return "hello"; // tymczasowo tu wszyscy lecą
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
