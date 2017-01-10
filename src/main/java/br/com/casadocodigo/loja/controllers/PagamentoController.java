package br.com.casadocodigo.loja.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.DadosPagamento;
import br.com.casadocodigo.loja.models.Usuario;

@Controller
@RequestMapping("/pagamento")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class PagamentoController {

	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private MailSender sender;

	@RequestMapping(value = "/finalizar", method = RequestMethod.POST)
	public Callable<ModelAndView> finalizar(@AuthenticationPrincipal Usuario usuario, RedirectAttributes model) {
		ModelAndView modelAndView = new ModelAndView("redirect:/produtos");
		return () -> {
			try{
				String urlPagamento = "http://book-payment.herokuapp.com/payment";
				String response = restTemplate.postForObject(urlPagamento, new DadosPagamento(carrinho.getTotal()),String.class);
				System.out.println(response);
				enviaEmailCompraProduto(usuario);
				model.addFlashAttribute("message", response);
			}catch (HttpClientErrorException e) {
				e.printStackTrace();
				model.addFlashAttribute("message", "Valor maior que o permitido");
			}
			return modelAndView;
		};		
	}

	private void enviaEmailCompraProduto(Usuario usuario) {
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("compras@casadocodigo.com.br");
		email.setTo(usuario.getEmail());
		email.setSubject("Compra finalizada com sucesso!");
		email.setText("Compra aprovada com sucesso no valor de R$"+carrinho.getTotal());
		
		//sender.send(email);
		//Comentando para não dar erro nos testes pois não tenho um e-mail válido configurado para o envio
	}
}
