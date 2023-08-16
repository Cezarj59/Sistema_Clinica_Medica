package util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class DataUtils {
	
	
	
	// Método para validar a data e retornar um LocalDate ou null em caso de erro
	public static LocalDate validarData(String dataString) {
		try {
			// Defina o formato esperado da data (de acordo com o formato da entrada)
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

			// Faça a conversão da data para LocalDate
			return LocalDate.parse(dataString, formatter);
		} catch (DateTimeParseException e) {
			// Se a data estiver formatada incorretamente, retorne null
			return null;
		}
	}

	/*
	 * Método para mostrar as datas para agendamento, de acordo com o dia do exame
	 * ex: se o exame for Segunda feira, só mostra as segundas feiras para
	 * agendamento.
	 */
	public static List<String> getDatasDisponiveisExames(int selectedDayOfWeek) {
		// Lista que armazenará as datas disponíveis
		List<String> availableDates = new ArrayList<>();

		// Obtém a data atual
		LocalDate currentDate = LocalDate.now();

		// Obtém o dia da semana atual
		DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();

		// Calcula quantos dias precisam ser adicionados para chegar ao dia da semana
		// selecionado
		int daysToAdd = selectedDayOfWeek - currentDayOfWeek.getValue();

		// Se o resultado for negativo, ajusta para a próxima semana
		if (daysToAdd < 0) {
			daysToAdd += 7;
		}

		// Avança a data para o próximo dia da semana selecionado
		currentDate = currentDate.plusDays(daysToAdd);

		// Adicione as próximas datas disponíveis (por exemplo, as próximas 8 semanas)
		for (int i = 0; i < 8; i++) {
			// Adiciona a data atual à lista de datas disponíveis
			availableDates.add(currentDate.toString());

			// Avança para a próxima semana
			currentDate = currentDate.plusWeeks(1);
		}

		// Retorna a lista de datas disponíveis
		return availableDates;
	}

}
