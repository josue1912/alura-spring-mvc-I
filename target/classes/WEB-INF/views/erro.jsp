<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="ERRO!">

	<section id="index-section" class="container middle">
		<h2>Um erro aconteceu!</h2>
	</section>
	
	<!-- 
		Mensagem: ${exception.message}
		<c:forEach items="${exception.stackTrace}" var="stk">
			${stk}
		</c:forEach>
	 -->
	
</tags:pageTemplate>