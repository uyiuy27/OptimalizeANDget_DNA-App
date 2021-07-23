package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

import lombok.Data;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Data
@Entity
@Table(name = Accessory.TABLE_NAME)
public class Accessory {
    static final String TABLE_NAME = "accessories";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    String name;

    int quantity;




}
