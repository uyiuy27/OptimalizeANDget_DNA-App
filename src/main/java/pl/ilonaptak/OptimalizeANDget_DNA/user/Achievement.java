package pl.ilonaptak.OptimalizeANDget_DNA.user;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@Entity
@Table(name = Achievement.TABLE_NAME)
public class Achievement {

    static final String TABLE_NAME = "achievements";

    @Id
    @GeneratedValue
    int id;

    @Size(max=50)
    String achievement;
}
