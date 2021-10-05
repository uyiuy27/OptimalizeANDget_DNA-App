package pl.ilonaptak.OptimalizeANDget_DNA.user;

import pl.ilonaptak.OptimalizeANDget_DNA.user.dto.UserEditDto;
import pl.ilonaptak.OptimalizeANDget_DNA.user.dto.UserEditPasswordDto;
import pl.ilonaptak.OptimalizeANDget_DNA.user.entity.User;

public class UserDtoConverter {

    public static User convertUserDtoToUser(UserEditDto in, User out) {
        out.setId(in.getId());
        out.setUsername(in.getUsername());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
        return out;
    }

    public static UserEditDto convertUserToUserDto(User in, UserEditDto out) {
        out.setId(in.getId());
        out.setUsername(in.getUsername());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
        out.setRole(in.getRole());
        return out;
    }

    public static User convertUserDtoPasswordToUserPassword(UserEditPasswordDto in, User out) {
        out.setPassword(in.getPassword());
        return out;
    }

    public static UserEditPasswordDto convertUserPasswordToUserPasswordDto(User in, UserEditPasswordDto out) {
        out.setPassword(in.getPassword());
        return out;
    }



}
