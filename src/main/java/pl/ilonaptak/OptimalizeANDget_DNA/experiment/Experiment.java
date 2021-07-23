package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.Data;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = Experiment.TABLE_NAME)
public class Experiment {

    static final String TABLE_NAME = "experiments";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    User user;

    @NotEmpty
    String name;

    @NotNull
    LocalDateTime createdOn;

    boolean done;

    String plannedDuration;

    String realDuration;

    String difficultyLevel;

    @NotNull
    String visibility;

    String author;

    String resource;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }





}
