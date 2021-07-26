package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;

import javax.validation.Valid;

@Controller
@RequestMapping("/ingredient")
@RequiredArgsConstructor
public class IngredientController {


    private final IngredientService ingredientService;
    private final ExperimentService experimentService;

    @GetMapping("/add/{id}")
    public String add(Model model, @PathVariable int id) {
//        TODO : dodać to dla usera w widoku jego eksperymentów
        model.addAttribute("experimentId", id);
        model.addAttribute("accessory", new Ingredient());
        return "ingredient/form";
    }

    @PostMapping("/add")
    public String add(@Valid Ingredient ingredient, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "ingredient/form";
        }
        try {
            int experimentId = (int) model.getAttribute("experimentId");
            ingredient.setExperiment(experimentService.findById(experimentId));
            ingredientService.save(ingredient);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:ingredient/all"; // TODO zmienić lądowanie dla akcji
    }


    @GetMapping("/all/{id}")
    public String findAllForExperiment(Model model, @PathVariable Integer id) {
        model.addAttribute("ingredients", ingredientService.findAllByExperimentId(id));
        return "ingredient/all";
    }


    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("ingredient", ingredientService.getById(id));
        return "ingredient/form";
    }


    @PostMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable int id, @Valid Ingredient ingredient, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "ingredient/form";
        }
        ingredientService.save(ingredient);
        return "redirect:user/experiment/all";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        ingredientService.deleteById(id);
        return "deleted";
    }


}

