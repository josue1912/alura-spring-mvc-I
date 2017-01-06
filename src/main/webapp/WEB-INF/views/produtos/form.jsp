<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Lista de produtos">
	<div class="container">
		<h1>Cadastro de Produto</h1>
		<form:form action="${s:mvcUrl('ProdutoGravar').build()}" method="post" commandName="produto" enctype="multipart/form-data">
			<div class="form-group">
				<label>Título</label>
				<form:input path="titulo" cssClass="form-control"/>
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
				<label>Descrição</label>
				<form:textarea path="descricao" cssClass="form-control"/>
				<form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label>Páginas</label>
				<form:input path="paginas" cssClass="form-control" />
				<form:errors path="paginas" />
			</div>
			<div class="form-group">
				<label>Data lançamento</label>
				<form:input path="dataLancamento" cssClass="form-control" />
				<form:errors path="dataLancamento" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>${tipoPreco}</label>
					<form:input path="precos[${status.index}].valor" cssClass="form-control" />
					<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
				</div>
			</c:forEach>
			<div class="form-group">
				<label>Sumário</label>
				<input type="file" name="sumario" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</tags:pageTemplate>