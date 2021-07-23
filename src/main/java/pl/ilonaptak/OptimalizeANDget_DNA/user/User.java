package pl.ilonaptak.OptimalizeANDget_DNA.user;

import pl.ilonaptak.OptimalizeANDget_DNA.experiment.Experiment;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.List;


@Entity
@Table(name = User.TABLE_NAME)
public class User {
    static final String TABLE_NAME = "users";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @NotNull
    String login;

    @Email
    @NotEmpty
    @Column(nullable = false, unique = true, length = 40)
    String email;

    @NotEmpty
    @Size(min = 6)
    String password;

    @NotEmpty
    String role;

    @Size(max = 120)
    String workplace;

    @Size(max = 50)
    String position;

    @NotNull
    LocalDate firstLoginOn;

//    @OneToMany
//    List<Experiment> experiment;



    @PrePersist
    public void prePersist() {
        firstLoginOn = LocalDate.now();
    }




}
