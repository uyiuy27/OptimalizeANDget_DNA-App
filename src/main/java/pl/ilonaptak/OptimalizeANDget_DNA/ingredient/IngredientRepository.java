package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
interface IngredientRepository extends JpaRepository<Ingredient, Integer> {

    List<Ingredient> findAllByExperimentId(Integer id);
    void deleteAllByExperimentId(Integer id);

}
