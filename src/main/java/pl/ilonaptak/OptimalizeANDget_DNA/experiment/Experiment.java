package pl.ilonaptak.OptimalizeANDget_DNA.experiment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pl.ilonaptak.OptimalizeANDget_DNA.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = Experiment.TABLE_NAME)
public class Experiment {

    static final String TABLE_NAME = "experiments";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne
    User user;

    @NotEmpty
    String name;

    @NotEmpty
    @Size(max = 500)
    String description;

    LocalDateTime createdOn;

//    boolean done;

    String plannedDuration;

//    String realDuration;

    String difficulty;

    @NotNull
    String visibility;

    String author;

    String resource;

    String addedBy;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }

    public Experiment clone() {
        return new Experiment(null, user, name, description, createdOn, plannedDuration, difficulty, visibility, author, resource, addedBy);
    }


}
