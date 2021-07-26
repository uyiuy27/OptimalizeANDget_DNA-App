package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;

import javax.validation.Valid;

@Controller
@RequestMapping("/experiment")
@RequiredArgsConstructor
public class ExperimentController {

    private final ExperimentService experimentService;



    @GetMapping("/add")
    public String add(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("currentUserId", currentUser.getUser().getId());
        model.addAttribute("experiment", new Experiment());
        return "home/form";
    }

    @PostMapping("/add")
    public String add(@Valid Experiment experiment, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "experiment/form";
        }
        experimentService.save(experiment);
        return "redirect:user/experiment/all";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("experiment", experimentService.findById(id));
        return "/experiment/form";
    }


    @PostMapping("/update/{id}")
    @ResponseBody
    public String updateUser(@PathVariable int id, @Valid Experiment experiment, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
//            model.addAttribute("experiment", experimentService.findById(id)); // sprawdzić czy to się przyda
            return "experiment/form";
        }
        experimentService.save(experiment);
        return "redirect:user/experiment/all";
    }


    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable int id) {
        experimentService.delete(id);
        return "deleted";
    }



}
