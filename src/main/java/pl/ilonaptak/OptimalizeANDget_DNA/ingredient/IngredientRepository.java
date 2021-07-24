package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
interface IngredientRepository extends JpaRepository<Ingredient, Integer> {
}
