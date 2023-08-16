package model.medico;

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
@Table(name = "medicos")
public class Medico {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(length = 50, nullable = false)
	private String nome;

	@Column(length = 13, unique = true, nullable = false)
	private String crm;

	@ManyToOne
	@JoinColumn(name = "id_esp")
	private Especialidade especialidade;

	public Medico() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Medico(String nome, String crm, Especialidade especialidade) {
		super();
		this.nome = nome;
		this.crm = crm;
		this.especialidade = especialidade;
	}

	public Medico(Long id, String nome, String crm, Especialidade especialidade) {
		super();
		this.id = id;
		this.nome = nome;
		this.crm = crm;
		this.especialidade = especialidade;
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

	public String getCrm() {
		return crm;
	}

	public void setCrm(String crm) {
		this.crm = crm;
	}

	public Especialidade getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(Especialidade especialidade) {
		this.especialidade = especialidade;
	}

}
