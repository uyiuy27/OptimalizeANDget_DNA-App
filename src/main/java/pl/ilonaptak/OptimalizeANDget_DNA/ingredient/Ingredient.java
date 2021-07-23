package pl.ilonaptak.OptimalizeANDget_DNA.ingredient;


import lombok.Data;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Data
@Entity
@Table(name = Ingredient.TABLE_NAME)
public class Ingredient {

    static final String TABLE_NAME = "ingredients";

    @Id
    @GeneratedValue
    int id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    String name;

    String concentration; // stężenie

    String quantity; // ilość

    double cost;

    boolean dangerous;





}
