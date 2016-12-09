<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Usu&aacute;rio</title>
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
		integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous">
	</script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
	<style type="text/css">
		.textoBranco {
			color: white;
		}
		
		.ui-dialog-titlebar {
			background-color: #668cff;
			background-image: none;
			color: #fff;
		}
	</style>
	
	<script type="text/javascript">
		function salvar() {
			var dadosEnvio = {};
			
			dadosEnvio.nome = $("#nome").val();
			
			if($("#masculino").is(":checked")){
				dadosEnvio.sexo="M";
			}else{
				dadosEnvio.sexo="F";
			}
			
			dadosEnvio.generos = "";
			$("input[type=checkbox][name='genero[]']:checked").each(function(){
				dadosEnvio.generos += $(this).val() + ";";
			});
			
			dadosEnvio.vezes = $('#vezes :selected').val();
		
		 	$.ajax({
		  		type: "post",
		  		url: "cadastro/addUsuario",
		  		cache: false,    
		  		data: dadosEnvio,
		  		success: function(response){
		  			clean();
		  			$( "#content" ).load("cadastro #content");   
		   			alert(response);
		  		},
		  		error: function(e){  
		  			clean(); 
  					alert(e);
		  		}
		 	});
		}
		function clean() {
			$("#nome").val("");
   			$("input:checked").removeAttr("checked");
   			$("input[type=checkbox][name='genero[]']:checked").removeAttr("checked");	
   			$("#masculino").prop('checked', true);
   			$("#vezes").val("1");
		}
	</script>
</head>

<body>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-8 col-sm-offset-2">
	            <div class="page-header text-left">
	                <h2>Cadastro de Usu&aacute;rio</h2>
	            </div>
				<br/>
	            <form class="form-horizontal" id="formCadastroUsuario" action="#">
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">Nome</label>
	                    <div class="col-sm-4">
	                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" />
	                    </div>
	                </div>
	                
	                <div class="form-group">
						<label class="col-sm-3 control-label">Sexo</label>
						<div class="col-sm-6">
							<div class="radio text-left">
								<label><input type="radio" id="masculino" name="sexo" value="masculino" checked />Masculino</label>
								<label><input type="radio" id="feminino" name="sexo" value="feminino" />Feminino</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">G&ecirc;neros de filme favoritos</label>
						<div class="col-sm-6">
							<div class="checkbox">
		    					<label><input type="checkbox" name="genero[]" value="acao" >A&ccedil;&atilde;o</label><br/>
		    					<label><input type="checkbox" name="genero[]" value="ficcao" >Fic&ccedil;&atilde;o</label><br/>
		    					<label><input type="checkbox" name="genero[]" value="terror" >Terror</label><br/>
		    					<label><input type="checkbox" name="genero[]" value="romance" >Romance</label><br/>
		    					<label><input type="checkbox" name="genero[]" value="drama" >Drama</label>
		  					</div>
						</div>
					</div>
  					
  					<div class="form-group">
						<label class="col-sm-3 control-label">Quantas vezes vai ao cinema por ano?</label>
						<div class="col-sm-6">
							<div class="radio text-left">
								<select name="vezes" id="vezes" >
			  						<option value="1">1 a 3</option>
			  						<option value="2">4 a 6</option>
			  						<option value="3">7 ou mais</option>
								</select>
							</div>
						</div>
					</div>
					
					<div class="form-group">
	                    <div class="col-sm-12 text-center">
	                        <button type="button" class="btn btn-success" name="signup" onclick="salvar()">Gravar</button>
	                    </div>
	                </div>
	            </form>
	            <br/><br/><br/><br/>
	            <div id="content">
	            <table class="table table-striped">
	            	<thead>
						<tr>
							<th>Nome</th>
							<th>Sexo</th>		
							<th>G&acirc;nero</th>
							<th>Vezes</th>     
						</tr>
					</thead>
					<tbody>
  
						<c:forEach var="listValue" items="${listaUsuarios}">
							<tr>
								<td>${listValue.nome}</td>
								<td>${listValue.sexo == 'M' ? 'Masculino' : 'Feminino'}</td>
								<td>${listValue.generos}</td>
								<c:choose>
									<c:when test="${listValue.vezes=='1'}">
										<td>1 a 3</td>
									</c:when> 
									<c:when test="${listValue.vezes=='2'}">
										<td>4 a 6</td>
									</c:when> 
									<c:when test="${listValue.vezes=='3'}">
										<td>7 ou mais</td>
									</c:when> 
								</c:choose>
								<td></td>	
							</tr>
						</c:forEach> 
					</tbody>
				</table>
				</div>
				<br/><br/><br/><br/>
	        </div>
	    </div>
	</div>
</body>
</html>