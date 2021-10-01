package pl.ilonaptak.OptimalizeANDget_DNA.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class HelloController {
    private final UserService userService;
    private final ExperimentService experimentService;

    /**
     * Endpoint odsyłający na stronę główną aplikacji
     * @return
     */
    @RequestMapping("/home")
    public String hello() {
        return "home/home";
    }

    /**
     * Endpoint strona główna aplikacji
     * @param model
     * @param currentUser
     * @return
     */
    @GetMapping("/")
    public String allPublicExperiments(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("experiments", experimentService.findAllByVisibility("public"));
        if (currentUser != null) {
            User user = currentUser.getUser();
            model.addAttribute("user", user);
            System.out.println(user.getRole());
            if(user.getRole().equals("ROLE_ADMIN")) {
                model.addAttribute("admin", user.getRole());
            }
        }
        return "home/home";
    }

    /**
     * Endpoint odsyłający do strony z informacjami o aplikacji
     * @return
     */
    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "about";
    }

    /**
     * Endpoint rejestracji użytkownika
     * @param model
     * @return
     */
    @GetMapping("/register")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "home/form";
    }

    @PostMapping("/register")
    public String add(@Valid User user, BindingResult bindingResult, HttpServletRequest request, @AuthenticationPrincipal CurrentUser currentUser) {
        List<User> emailValidation = userService.findAllByEmail(user.getEmail());
        if(!emailValidation.isEmpty()) {
            request.setAttribute("alreadyExist", "Podany adres email już istnieje");
            return "home/form";
        }

        User usernameValidation = userService.findByUserName(user.getUsername());
        String password = request.getParameter("passwordRepeat");

        if(usernameValidation != null) {
            request.setAttribute("alreadyExist", "Użytkownik o tym loginie już istnieje");
            return "home/form";
        }

        if (bindingResult.hasErrors() && !password.equals(user.getPassword())) {
            request.setAttribute("errorPassword", "Podane hasła są różne");
            return "home/form";
        } else if (bindingResult.hasErrors()) {
            return "home/form";
        } else if (!password.equals(user.getPassword())) {
            request.setAttribute("errorPassword", "Podane hasła są różne");
            return "home/form";
        }
        userService.save(user);
        return "redirect:/";
    }

}
