<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Lista de produtos">

	<div class="container">
		<h1>Lista de produtos</h1>
		<div>${message}</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Preços</th>
				<th>Páginas</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>
					<td>${produto.descricao}</td>
					<td>${produto.precos }</td>
					<td>${produto.paginas}</td>
				</tr>
			</c:forEach>			
		</table>
	</div>
</tags:pageTemplate>