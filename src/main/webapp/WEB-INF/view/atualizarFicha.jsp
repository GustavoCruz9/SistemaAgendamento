<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/styleAtualizarFicha.css"/>'> 
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <title>Perpétua Beleza e Estética - Atualizar Ficha</title>
  </head>
  <body>
    <nav class="sidebar close">
      <header>
        <div class="imagem-texto">
          <i class="bx bx-menu sandwich"></i>

          <div class="texto header-texto">
            <span class="salao">Perpétua Beleza e Estética</span>
          </div>
        </div>
      </header>

      <div class="menu-bar">
        <div class="menu">
          <ul class="menu-links">
            <li class="nav-link">
              <a href="consultarAgendamentoFuncionario">
                <i class='bx bxs-calendar icon'></i>
                <span class="texto nav-texto">Meus Agendamentos</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="consultarCliente">
                <i class='bx bx-smile icon'></i>
                <span class="texto nav-texto">Clientes</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cancelarHorario">
                <i class='bx bx-time-five icon'></i>
                <span class="texto nav-texto">Meu horário</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastrarServicoProprietaria">
                <i class='bx bx-cut icon'></i>
                <span class="texto nav-texto">Cadastrar Serviços</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastroFuncionarioProprietaria">
                <i class='bx bxs-user-plus icon'></i>
                <span class="texto nav-texto">Funcionarios</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastroProdutoProprietaria">
                <i class='bx bxs-package icon'></i>
                <span class="texto nav-texto">Produtos</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="meusDadosFuncionario">
                <i class='bx bx-user-circle icon'></i>
                <span class="texto nav-texto">Meus Dados</span>
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div class="baixo">
        <li class="">
          <a href="#">
            <i class="bx bx-log-out icon"></i>
            <span class="texto nav-texto">Logout</span>
          </a>
        </li>
      </div>
    </nav>

    <div id="error-container"></div>
    <div id="success-container"></div>

    <section class="content">
      <c:if test="${not empty mensagemSucesso}">
			<script src="./resources/js/atualizarFicha.js"></script>
			<script>
				displaySuccessMessage("${mensagemSucesso}");
			</script>
		</c:if>

		<c:if test="${not empty mensagemErro}">
			<script src="./resources/js/atualizarFicha.js"></script>
			<script>
				displayErrorMessage("${mensagemErro}");
			</script>
		</c:if> 
    <form action="atualizarFicha" method="post">
      <input type="hidden" id="fichaId" name="fichaId" value="${ficha.id}" />
      <div class="search-bar">
        <h2>Atualizar Ficha</h2>

        <div class="nome-data">
          <p>${ficha.cliente.nome }</p>
          <Strong>${ficha.agendamento.data }</Strong>
        </div>
      </div>

      <div id="modal" class="modal">
        <form action="atualizarFicha" method="post">
          <div class="modal-content">
            <div class="label-textarea">
              <h2>Serviços realizados:</h2>
              <div class="list-servicos">
              <c:if test="${not empty ficha }">
             	<c:forEach var="a" items="${ficha.agendamento.servicos }">
	                <div class="servico">
	                  <h4>${a.titulo } | ${ficha.agendamento.horaInicio } - ${ficha.agendamento.horaFim }</h4>
	                </div>
	            </c:forEach>    
               </c:if>
              </div>
            </div>
            <div class="label-textarea">
              <strong>Observações:</strong>
              <textarea name="observacoes" id="observacoes" style="resize: none;">${ficha.observacoes.trim()}</textarea>
            </div>
            <input type="submit"  class="atualizar-btn" name="botao" id="botao" value="Atualizar">
          </div>
        </form>
      </div>   

    </form>
    
    </section>

    <script src="./resources/js/atualizarFicha.js"></script>
  </body>
</html>