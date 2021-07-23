package pl.ilonaptak.OptimalizeANDget_DNA.reaction;

import lombok.Data;
import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.time.Duration;

@Data
@Entity
@Table(name = Reaction.TABLE_NAME)
public class Reaction {
    // po kolei co się dzieje podczas eksperymentu - przebieg doświadczenia

    static final String TABLE_NAME = "reactions";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    Experiment experiment;

    @NotEmpty
    String description;

    Duration time;






}
