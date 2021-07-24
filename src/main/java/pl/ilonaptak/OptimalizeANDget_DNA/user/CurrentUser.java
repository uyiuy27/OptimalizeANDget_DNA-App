package pl.ilonaptak.OptimalizeANDget_DNA.user;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CurrentUser extends User {

    private final pl.ilonaptak.OptimalizeANDget_DNA.user.User user;


    public CurrentUser(String login, String password, Collection<? extends GrantedAuthority> authorities, pl.ilonaptak.OptimalizeANDget_DNA.user.User user) {
        super(login, password, authorities);
        this.user = user;
    }

    public pl.ilonaptak.OptimalizeANDget_DNA.user.User getUser() {
        return user;
    }
}
