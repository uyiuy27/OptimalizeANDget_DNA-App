package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class IngredientService {

    private final IngredientRepository ingredientRepository;

    public List<Ingredient> findAll() {
        return ingredientRepository.findAll();
    }

    public Ingredient getById(Integer id) {
        return ingredientRepository.getById(id);
    }

    public List<Ingredient> findAllByExperimentId(Integer id) {
        return ingredientRepository.findAllByExperimentId(id);
    }

    public void save(Ingredient ingredient) {
        ingredientRepository.save(ingredient);
    }

    public void deleteById(Integer id) {
        ingredientRepository.deleteById(id);
    }


}
