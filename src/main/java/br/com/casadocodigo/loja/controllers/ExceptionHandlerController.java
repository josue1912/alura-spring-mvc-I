package br.com.casadocodigo.loja.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(Exception.class)
	public ModelAndView trataExcecao(Exception exception){
		exception.printStackTrace();
		ModelAndView modelAndView = new ModelAndView("erro");
		modelAndView.addObject("exception", exception);
		return modelAndView;
	}
}
