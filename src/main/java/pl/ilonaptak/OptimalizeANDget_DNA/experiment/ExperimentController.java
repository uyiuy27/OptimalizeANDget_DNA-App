package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.AccessoryService;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.Ingredient;
import pl.ilonaptak.OptimalizeANDget_DNA.ingredient.IngredientService;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.ReactionService;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;
import pl.ilonaptak.OptimalizeANDget_DNA.user.UserService;

import javax.validation.Valid;

@Controller
@RequestMapping("/experiment")
@RequiredArgsConstructor
public class ExperimentController {

    private final ExperimentService experimentService;
    private final UserService userService;
    private final AccessoryService accessoryService;
    private final IngredientService ingredientService;
    private final ReactionService reactionService;


    @GetMapping("/add")
//    @ResponseBody
    public String add(Model model) {
        model.addAttribute("experiment", new Experiment());
        return "experiment/form";
    }

    @PostMapping("/add")
    public String add(@Valid Experiment experiment, BindingResult bindingResult, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (bindingResult.hasErrors()) {
            return "experiment/form";
        }
        User user = currentUser.getUser();
        int userId = user.getId();
        experiment.setUser(userService.findById(userId));
        experimentService.save(experiment);

        return "redirect:/experiment/all";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("experiment", experimentService.findById(id));
        return "/experiment/form";
    }


    @PostMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable int id, @Valid Experiment experiment, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
//            model.addAttribute("experiment", experimentService.findById(id)); // sprawdzić czy to się przyda
            return "experiment/form";
        }
        experimentService.save(experiment);
        return "redirect:/experiment/all";
    }


    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        experimentService.delete(id);
        return "deleted";
    }

    // szczegóły może zobaczyć tylko autor lub zalogowany user jeżeli jest ustawione jako publiczne
    @GetMapping("/details/{id}")
    public String details(@PathVariable int id, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        if (experimentService.findById(id).getVisibility().equals("public") || experimentService.findById(id).getUser() == user) {
            model.addAttribute("experiment", experimentService.findById(id));
            model.addAttribute("accessories", accessoryService.findAllByExperimentId(id));
            model.addAttribute("accessory", new Accessory());
            model.addAttribute("ingredients", ingredientService.findAllByExperimentId(id));
            model.addAttribute("ingredient", new Ingredient());
            model.addAttribute("reactions", reactionService.findAllByExperimentId(id));
            model.addAttribute("reaction", new Reaction());
//            if(experimentService.findById(id).getUser() == user) {
            model.addAttribute("user", user);
            return "experiment/details";
        }

        return "redirect:/";
    }
}



