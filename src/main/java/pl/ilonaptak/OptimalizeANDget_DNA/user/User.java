package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = User.TABLE_NAME)
public class User {
    static final String TABLE_NAME = "users";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @NotEmpty
    String userName;

//    @Email
    @NotEmpty
    @Column(nullable = false, unique = true, length = 40)
    String email;

    @NotEmpty
    @Size(min = 6)
    String password;

    @Size(max = 120)
    String workplace;

    @Size(max = 50)
    String position;

    LocalDate firstLoginOn;
    String role;


//    @OneToMany
//    List<Experiment> experiment;

    public User(String login, String password, Collection<? extends GrantedAuthority> authorities) {
        this.userName = login;
        this.password = password;
    }

    @PrePersist
    public void prePersist() {
        firstLoginOn = LocalDate.now();
    }



}
