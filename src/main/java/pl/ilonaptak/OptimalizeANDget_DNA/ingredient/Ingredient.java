package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = Ingredient.TABLE_NAME)
public class Ingredient {

    static final String TABLE_NAME = "ingredients";

    @Id
    @GeneratedValue
    Integer id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    String name;

    String concentration; // stężenie

    String quantity; // ilość

    boolean dangerous;

    public Ingredient clone() {
        return new Ingredient(null, null, name, concentration, quantity, dangerous);
    }


}
