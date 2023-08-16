package model.medicosExames;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.exame.Exame;
import model.medico.Medico;

@Entity
@Table(name = "medicos_exames")
public class MedicosExames {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "id_medico")
	private Medico medico;

	@ManyToOne
	@JoinColumn(name = "id_exame")
	private Exame exame;

	public MedicosExames() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicosExames(Medico medico, Exame exame) {
		super();
		this.medico = medico;
		this.exame = exame;
	}

	public MedicosExames(Long id, Medico medico, Exame exame) {
		super();
		this.id = id;
		this.medico = medico;
		this.exame = exame;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Medico getMedico() {
		return medico;
	}

	public void setMedico(Medico medico) {
		this.medico = medico;
	}

	public Exame getExame() {
		return exame;
	}

	public void setExame(Exame exame) {
		this.exame = exame;
	}

}
