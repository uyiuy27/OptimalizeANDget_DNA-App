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
@Table(name = Article.TABLE_NAME)
public class Article {

    static final String TABLE_NAME = "articles";

    @Id
    @GeneratedValue
    int id;

    @Size(max=50)
    String articleName;

    @Size(max=20)
    String fileName;

}
