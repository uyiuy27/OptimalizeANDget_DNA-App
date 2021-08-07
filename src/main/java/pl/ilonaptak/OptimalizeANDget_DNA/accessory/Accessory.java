package pl.ilonaptak.OptimalizeANDget_DNA.accessory;

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
@Table(name = Accessory.TABLE_NAME)
public class Accessory {
    static final String TABLE_NAME = "accessories";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    String name;

    int quantity;

    public Accessory clone() {
        return new Accessory(null, null, name, quantity);
    }


}
