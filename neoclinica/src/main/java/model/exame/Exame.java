package model.exame;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.especialidade.Especialidade;

@Entity
@Table(name = "exames")
public class Exame {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(unique = false, nullable = false)
	private int diaSemana;

	@Column(length = 100, unique = true, nullable = false)
	private String nome;

	@ManyToOne
	@JoinColumn(name = "id_esp")
	private Especialidade especialidade;

	public Exame() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Exame(int diaSemana, String nome, Especialidade especialidade) {
		super();
		this.diaSemana = diaSemana;
		this.nome = nome;
		this.especialidade = especialidade;
	}

	public Exame(Long id, int diaSemana, String nome, Especialidade especialidade) {
		super();
		this.id = id;
		this.diaSemana = diaSemana;
		this.nome = nome;
		this.especialidade = especialidade;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getDiaSemana() {
		return diaSemana;
	}

	public void setDiaSemana(int diaSemana) {
		this.diaSemana = diaSemana;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Especialidade getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(Especialidade especialidade) {
		this.especialidade = especialidade;
	}

}
