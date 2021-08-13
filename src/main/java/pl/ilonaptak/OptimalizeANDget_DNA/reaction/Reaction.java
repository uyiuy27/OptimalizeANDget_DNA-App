package pl.ilonaptak.OptimalizeANDget_DNA.reaction;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pl.ilonaptak.OptimalizeANDget_DNA.accessory.Accessory;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.Duration;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = Reaction.TABLE_NAME)
public class Reaction {
    // po kolei co się dzieje podczas eksperymentu - przebieg doświadczenia

    static final String TABLE_NAME = "reactions";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    @Size(max = 250)
    String description;

    String time;

    public Reaction clone() {
        return new Reaction(null, null, description, time);
    }





}
