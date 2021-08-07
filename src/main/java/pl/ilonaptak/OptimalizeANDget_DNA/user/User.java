package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.*;
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

    @NotBlank
    String username;

    @Email
    @NotEmpty
    @Column(nullable = false, unique = true, length = 40)
    String email;

    @NotEmpty
    @Size(min = 6)
    String password;

//    @NotNull(message = "nie pasują")
//    @Size(min=6)
//    @Transient
//    String confirmPass;

    @Size(max = 120)
    String workplace;

    @Size(max = 50)
    String position;

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

//    public void setPassword(String password) {
//        this.password = password;
//        checkPassword();
//    }
//
//    public void setConfirmPass(String confirmPass) {
//        this.confirmPass = confirmPass;
//        checkPassword();
//    }
//
//    private void checkPassword() {
//        if(this.password == null || this.confirmPass == null) {
//            return;
//        } else if (!this.password.equals(confirmPass)) {
//            this.confirmPass = null;
//        }
//    }

//
//    @AssertTrue(message = "hasła muszą być takie same")
//    public boolean isValid() {
//        return this.password.equals(this.confirmPass);
//    }

}
