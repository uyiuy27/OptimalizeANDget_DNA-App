package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.ExperimentService;

import javax.validation.Valid;

@Controller
@RequestMapping("/accessory")
@RequiredArgsConstructor
public class AccessoryController {

    private final AccessoryService accessoryService;
    private final ExperimentService experimentService;

    @GetMapping("/add/{id}")
    public String add(Model model, @PathVariable int id) {
//        TODO : dodać to dla usera w widoku jego eksperymentów
        model.addAttribute("experimentId", id);
        model.addAttribute("accessory", new Accessory());
        return "accessory/form";
    }

    @PostMapping("/add")
    public String add(@Valid Accessory accessory, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "accessory/form";
        }
        try {
            int experimentId = (int) model.getAttribute("experimentId");
            accessory.setExperiment(experimentService.findById(experimentId));
            accessoryService.save(accessory);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:accessory/all";
    }



    @GetMapping("/all/{id}")
    public String findAllForExperiment(Model model, @PathVariable Integer id) {
        model.addAttribute("accessories", accessoryService.findAllByExperimentId(id));
        return "accessory/all";
    }


    @GetMapping("/update/{id}")
    public String update(@PathVariable int id, Model model) {
        model.addAttribute("accessory", accessoryService.getById(id));
        return "accessory/form";
    }


    @PostMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable int id, @Valid Accessory accessory, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "accessory/form";
        }
        accessoryService.save(accessory);
        return "redirect:user/experiment/all";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        accessoryService.deleteById(id);
        return "deleted";
    }


}
