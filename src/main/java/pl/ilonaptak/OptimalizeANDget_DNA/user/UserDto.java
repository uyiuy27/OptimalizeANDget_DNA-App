package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
class UserDto {

    int id;
    String login;
    String email;
    String workplace;
    String position;



}
