package model.agendamento;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.medicosExames.MedicosExames;
import model.pessoa.Paciente;

@Entity
@Table(name = "agendamentos")
public class Agendamento {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	private LocalDate data;

	private LocalTime hora;

	@ManyToOne
	@JoinColumn(name = "id_paciente")
	private Paciente paciente;

	@ManyToOne
	@JoinColumn(name = "medicos_exames")
	private MedicosExames medicosExames;

	@Column(name = "status", nullable = false)
    private boolean status = true;

	public Agendamento() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Agendamento(LocalDate data, LocalTime hora, Paciente paciente, MedicosExames medicosExames) {
		super();
		this.data = data;
		this.hora = hora;
		this.paciente = paciente;
		this.medicosExames = medicosExames;
	}


	public Agendamento(Long id, LocalDate data, LocalTime hora, Paciente paciente, MedicosExames medicosExames,
			boolean status) {
		super();
		this.id = id;
		this.data = data;
		this.hora = hora;
		this.paciente = paciente;
		this.medicosExames = medicosExames;
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getData() {
		return data;
	}
	public String getDataFormatada() {
        // Certifique-se de que 'data' é um objeto LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return data.format(formatter);
    }

	public void setData(LocalDate data) {
		this.data = data;
	}

	public LocalTime getHora() {
		return hora;
	}

	public void setHora(LocalTime hora) {
		this.hora = hora;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public MedicosExames getMedicosExames() {
		return medicosExames;
	}

	public void setMedicosExames(MedicosExames medicosExames) {
		this.medicosExames = medicosExames;
	}

	public boolean isStatus() {
		return status;
	}
	public String getStatusFormatado() {
        return status ? "Em Aberto" : "Realizado";
    }
	public void setStatus(boolean status) {
		this.status = status;
	}

}
