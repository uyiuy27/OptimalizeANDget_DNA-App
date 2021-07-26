package pl.ilonaptak.OptimalizeANDget_DNA.user;

public class UserDtoConverter {

    public static User convertUserDtoToUser(UserEditDto in, User out) {
        out.setUsername(in.getUsername());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
        return out;
    }

    public static UserEditDto convertUserToUserDto(User in, UserEditDto out) {
        out.setUsername(in.getUsername());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
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
