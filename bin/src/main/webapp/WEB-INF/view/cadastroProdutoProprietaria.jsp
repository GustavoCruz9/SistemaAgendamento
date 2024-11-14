<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/styleCadastroProdutoProprietaria.css"/>'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <nav class="sidebar close">
        <header>
            <div class="imagem-texto">

                <i class='bx bx-menu sandwich'></i>

                <div class="texto header-texto">
                    <span class="salao">Perpétua Beleza e Estética</span>
                </div>
            </div>
        </header>

        <div class="menu-bar">
            <div class="menu">
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-home-alt icon'></i>
                            <span class="texto nav-texto">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bar-chart-alt-2 icon'></i>
                            <span class="texto nav-texto">Revenue</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bell icon'></i>
                            <span class="texto nav-texto">Norifications</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-pie-chart-alt icon'></i>
                            <span class="texto nav-texto">Analytics</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-heart icon'></i>
                            <span class="texto nav-texto">Likes</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-wallet icon'></i>
                            <span class="texto nav-texto">Wallets</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>

        <div class="baixo">
            <li class="">
                <a href="#">
                    <i class='bx bx-log-out icon'></i>
                    <span class="texto nav-texto">Logout</span>
                </a>
            </li>
        </div>
    </nav>
	
	
	
	<div id="error-container"></div>
	<div id="success-container"></div>
    <section class="content">
    
		
    	<c:if test="${not empty mensagemSucesso}">
			<script src="./resources/js/sidebar.js"></script> 
	    	<script>
	        	displaySuccessMessage("${mensagemSucesso}");
	    	</script>
		</c:if>
	
		<c:if test="${not empty mensagemErro}">
			<script src="./resources/js/sidebar.js"></script> 
	    	<script>
	        	displayErrorMessage("${mensagemErro}");
	    	</script>
		</c:if>
		
        <div class="header">
            <h1>Produtos</h1>
        </div>

        <div class="form-container">
            <form action="produto" method="post" onsubmit="return validaCampos()" class="form">
                <div class="input-buscar">
                    <div class="label-input">
                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" placeholder="Insira o nome do produto" value="${produto.nome }">
                    </div>
                </div>
                
                
                <label for="status">Selecione o status:</label>
                <select id="status" name="status">
                    <option value="Disponivel" ${produto.status == 'Disponivel' ? 'selected' : ''}>Disponível</option>
                    <option value="Indisponivel" ${produto.status == 'Indisponivel' ? 'selected' : ''}>Indisponível</option>
                </select>
				
				<input type="hidden" id="id" name="id" value="${produto.id}" />
                <div class="button-group">
                    <input type="submit" class="btn" id="botao" name="botao" value="Cadastrar">
                    <input type="submit" class="btn" id="botao" name="botao" value="Atualizar">
                </div>
            </form>
        </div>

        <div class="tabela-container">
        <c:if test="${not empty produtos }">
	            <table>
	                <thead>
	                    <tr>
	                        <th>Nome</th>
	                        <th>Status</th>
	                        <th>Editar</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="p" items="${produtos }">
	                    <tr>
	                        <td><c:out value="${p.nome }"/></td>
	                        <td><c:out value="${p.status }"/></td>
	                        <form action="produto" method="post">
	                        	<input type="hidden" id="id" name="id" value="${p.id}" />
		                        <td>
		                            <button type="submit" class="btn" id="botao" name="botao" value="Editar">
		                                <i class='bx bxs-edit'></i>
		                            </button>
	                       	 	</td>
	                       </form> 	
	                    </tr>
	                   </c:forEach>
	                </tbody>
	            </table>
            </c:if>
        </div>
    </section>

    <script src="./resources/js/sidebar.js"></script>
</body>

</html>