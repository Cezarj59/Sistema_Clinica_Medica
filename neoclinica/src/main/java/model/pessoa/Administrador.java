package model.pessoa;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "administradores")
public class Administrador extends Pessoa {

	@Column(length = 50, unique = true, nullable = false)
	private String username;

	@Column(length = 50, nullable = false)
	private String senha;

	public Administrador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Administrador(Long id, String nome, LocalDate nascimento, String cpf, String tel, String email,
			String username, String senha) {
		super(id, nome, nascimento, cpf, tel, email);
		this.username = username;
		this.senha = senha;
	}

	public Administrador(String nome, LocalDate nascimento, String cpf, String tel, String email, String username,
			String senha) {
		super(nome, nascimento, cpf, tel, email);
		this.username = username;
		this.senha = senha;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
