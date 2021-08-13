package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;
import pl.ilonaptak.OptimalizeANDget_DNA.reaction.Reaction;
import pl.ilonaptak.OptimalizeANDget_DNA.user.CurrentUser;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.validation.Valid;

@Controller
@RequestMapping("/ingredient")
@RequiredArgsConstructor
public class IngredientController {


    private final IngredientService ingredientService;
    private final ExperimentService experimentService;

    @GetMapping("/add/{id}")
    public String add(Model model, @PathVariable int id) {
        model.addAttribute("experimentId", id);
        model.addAttribute("ingredient", new Ingredient());
        return "experiment/details";
    }

    @PostMapping("/add/{id}")
    public String add(@Valid Ingredient ingredient, BindingResult bindingResult, Model model, @PathVariable int id) {
        if (bindingResult.hasErrors()) {
            if (model.getAttribute("ingredient") == null || model.getAttribute("reaction") == null) {
                model.addAttribute("accessory", new Accessory());
                model.addAttribute("reaction", new Reaction());
            }
            return "redirect:/experiment/details/" + id;
        }
        try {
//            int experimentId = (int) model.getAttribute("experimentId");
            ingredient.setExperiment(experimentService.findById(id));
            ingredientService.save(ingredient);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:/experiment/details/" + id;
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = currentUser.getUser();
        User userExperiment = ingredientService.getById(id).getExperiment().getUser();
        int experimentId = ingredientService.getById(id).getExperiment().getId();
        if (user.getId() == userExperiment.getId()) {
            ingredientService.deleteById(id);
        }
        return "redirect:/experiment/details/"+experimentId;
    }


}

