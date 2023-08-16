package model.pessoa;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.persistence.*;

@MappedSuperclass
public abstract class Pessoa {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(length = 150, nullable = false)
	private String nome;

	private LocalDate nascimento;

	@Column(length = 11, unique = true, nullable = false)
	private String cpf;

	@Column(length = 11, nullable = false)
	private String tel;

	@Column(length = 150, unique = true, nullable = false)
	private String email;

	public Pessoa() {
		super();
	}

	public Pessoa(String nome, LocalDate nascimento, String cpf, String tel, String email) {
		super();
		this.nome = nome;
		this.nascimento = nascimento;
		this.cpf = cpf;
		this.tel = tel;
		this.email = email;
	}

	public Pessoa(Long id, String nome, LocalDate nascimento, String cpf, String tel, String email) {
		super();
		this.id = id;
		this.nome = nome;
		this.nascimento = nascimento;
		this.cpf = cpf;
		this.tel = tel;
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public LocalDate getNascimento() {
		return nascimento;
	}
	public String getNascimentoFormatado() {
        // Certifique-se de que 'data' é um objeto LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return nascimento.format(formatter);
    }
	public void setNascimento(LocalDate nascimento) {
		this.nascimento = nascimento;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
