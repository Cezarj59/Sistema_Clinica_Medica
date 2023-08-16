package model.pessoa;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.usuarios.Usuario;

@Entity
@Table(name = "pacientes")
public class Paciente extends Pessoa {

	@ManyToOne
	@JoinColumn(name = "id_user")
	private Usuario usuario;

	@Column(length = 50)
	private String genero;

	@Column(precision = 5, scale = 2)
	private BigDecimal peso;

	@Column(precision = 4, scale = 2)
	private BigDecimal altura;

	public Paciente() {
		super();
	}

	public Paciente(Long id, String nome, LocalDate nascimento, String cpf, String tel, String email, Usuario usuario,
			String genero, BigDecimal peso, BigDecimal altura) {
		super(id, nome, nascimento, cpf, tel, email);
		this.usuario = usuario;
		this.genero = genero;
		this.peso = peso;
		this.altura = altura;
	}

	public Paciente(String nome, LocalDate nascimento, String cpf, String tel, String email, Usuario usuario,
			String genero, BigDecimal peso, BigDecimal altura) {
		super(nome, nascimento, cpf, tel, email);
		this.usuario = usuario;
		this.genero = genero;
		this.peso = peso;
		this.altura = altura;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public BigDecimal getPeso() {
		return peso;
	}

	public void setPeso(BigDecimal peso) {
		this.peso = peso;
	}

	public BigDecimal getAltura() {
		return altura;
	}

	public void setAltura(BigDecimal altura) {
		this.altura = altura;
	}

}
