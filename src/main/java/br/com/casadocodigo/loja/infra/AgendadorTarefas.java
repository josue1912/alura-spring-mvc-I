package br.com.casadocodigo.loja.infra;

import java.time.LocalDateTime;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class AgendadorTarefas {

	private static final String TIME_ZONE = "America/Sao_Paulo";

	/*
	 *  cron = "A B C D E F"
		A: Segundos (0 – 59).
		B: Minutos (0 – 59).
		C: Horas (0 – 23).
		D: Dia (1 – 31).
		E: Mês (1 – 12).
		F: Dia da semana (0 – 6).
		*/
	
	@Scheduled(cron = "0 */1 20 * * *", zone = TIME_ZONE)
	public void verificaPorHora() {
		System.out.println(LocalDateTime.now());
		// Código que realiza a consulta de fluxo de vendas
	}
}