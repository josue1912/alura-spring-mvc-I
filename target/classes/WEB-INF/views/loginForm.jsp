<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login - Casa do código</title>
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
<style type="text/css">
    body{
        padding: 60px 0px;
    }
</style>
</head>
<body>
	<div class="container">
		<h1>Login Casa do Código</h1>
		<form:form servletRelativeAction="/login" method="post">
			<div class="form-group">
				<label>Nome</label>
				<input type="text" name="username" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Senha</label>
				<input type="password" name="password" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form:form>
	</div>
</body>
</html>