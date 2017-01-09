<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set value="<security:authentication property='principal.username'/>" var="usuarioLogado" />

<header id="layout-header">
	<div class="clearfix container">
		<a href="${contextPath }" id="logo"></a>
		<div id="header-content">
			<nav id="main-nav">
				<ul class="clearfix">
					<li><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow"><s:message code="menu.carrinho" arguments="${carrinhoCompras.quantidade}" /></a></li>
					<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow"><s:message code="menu.sobre" /></a></li>
					<li><a href="#">${usuarioLogado}</a></li>
					<li><a href="?locale=pt"><s:message code="menu.PT" /></a></li>
					<li><a href="?locale=en_US"><s:message code="menu.EN" /></a></li>
					<li><a href="${s:mvcUrl('LC#logout').build()}" rel="nofollow"><s:message code="menu.sair" /></a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>

<nav class="categories-nav">
	<ul class="container">
		<li class="category"><a href="${contextPath}"><s:message code="navegacao.categoria.home" /></a></li>
		<li class="category"><a href="/collections/livros-de-agile"><s:message code="navegacao.categoria.agile" /></a></li>
        <li class="category"><a href="/collections/livros-de-front-end"><s:message code="navegacao.categoria.front_end" /></a></li>
        <li class="category"><a href="/collections/livros-de-games"><s:message code="navegacao.categoria.games" /></a></li>
        <li class="category"><a href="/collections/livros-de-java"><s:message code="navegacao.categoria.java" /></a></li>
        <li class="category"><a href="/collections/livros-de-mobile"><s:message code="navegacao.categoria.mobile" /></a></li>
        <li class="category"><a href="/collections/livros-desenvolvimento-web"><s:message code="navegacao.categoria.web" /></a></li>
        <li class="category"><a href="${contextPath}produtos"><s:message code="navegacao.categoria.produtos" /></a></li>
	</ul>
</nav>