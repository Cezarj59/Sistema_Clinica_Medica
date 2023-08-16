package model.usuarios;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cadastro_usuarios")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(length = 100, unique = true, nullable = false)
	private String username;

	@Column(length = 100, unique = true, nullable = false)
	private String email;

	@Column(length = 50, nullable = false)
	private String senha;

	public Usuario() {
		// TODO Auto-generated constructor stub
	}

	public Usuario(String username, String email, String senha) {
		super();
		this.username = username;
		this.email = email;
		this.senha = senha;
	}

	public Usuario(Long id, String username, String email, String senha) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.senha = senha;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
