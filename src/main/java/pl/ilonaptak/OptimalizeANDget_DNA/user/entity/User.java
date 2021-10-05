package pl.ilonaptak.OptimalizeANDget_DNA.user.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name = User.TABLE_NAME)
public class User {
    static final String TABLE_NAME = "users";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @NotBlank
    @Column(unique = true)
    String username;

    @Email
    @NotEmpty
    @Column(nullable = false, unique = true, length = 40)
    String email;

    @NotEmpty
    @Size(min = 6)
    String password;

    /**
     * Miejsce pracy/nauki
     */
    @Size(max = 120)
    String workplace;

    /**
     * Stanowsiko pracy
     */
    @Size(max = 50)
    String position;

    /**
     * Informacje dodatkowe o użytkowniku
     */
    @Size(max = 600)
    String about;

    /**
     * zwa pliku ze zdjęciem, z czasem trzeba ogarnąć żeby było zdjęcie
     */
    String photoName;

    // TODO: ustawić nazwy odpowiednie kolumn przed którymś kolejnym dropem
    @OneToMany
    List<Article> articles;

    @OneToMany
    List<Achievement> achievements;


    LocalDate firstLoginOn;
    String role;


    public User(String login, String password, Collection<? extends GrantedAuthority> authorities) {
        this.username = login;
        this.password = password;
    }

    @PrePersist
    public void prePersist() {
        firstLoginOn = LocalDate.now();
    }

}
