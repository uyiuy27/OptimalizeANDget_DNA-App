package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.validation.Valid;


@Controller
@RequiredArgsConstructor
public class HelloController {
    private final UserService userService;
    private final ExperimentService experimentService;

    @RequestMapping("/hello")
    public String hello() {
        return "home/home";
    }

    @GetMapping("/register")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "home/form";

    }

    @PostMapping("/register")
    public String add(@Valid User user, BindingResult bindingResult) {
        System.out.println("test");
        if (bindingResult.hasErrors()) {
            return "home/form";
        }
        userService.save(user);
        return "redirect:/user/hinew";
    }

//    @GetMapping("/")
//    @ResponseBody
//    public String home() {
//        return "home";
//    }

    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "about";
    }

    @GetMapping("/")
    public String allPublicExperiments(Model model) {
        model.addAttribute("experiments", experimentService.findAllByVisibility("public"));
        return "home/home";
    }



}
