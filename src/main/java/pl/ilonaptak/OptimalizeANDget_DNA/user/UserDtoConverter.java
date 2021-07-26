package pl.ilonaptak.OptimalizeANDget_DNA.user;

public class UserDtoConverter {

    public static User convertUserDtoToUser(UserEditDto in, User out) {
        // przepisać z userDto do User i zwrócić out
        out.setUserName(in.getUserName());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
        return out;
    }

    public static UserEditDto convertUserToUserDto(User in, UserEditDto out) {
        // przepisać z user do userDto
        out.setUserName(in.getUserName());
        out.setEmail(in.getEmail());
        out.setPosition(in.getPosition());
        out.setWorkplace(in.getWorkplace());
        return out;
    }

}
