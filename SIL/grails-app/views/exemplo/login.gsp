<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="${request.contextPath}/sbadmin2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${request.contextPath}/sbadmin2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${request.contextPath}/sbadmin2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${request.contextPath}/sbadmin2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body background="${request.contextPath}/sbadmin2/images/background.jpg">
	
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default" style="background-color: rgba(255,255,255,0.3);">
                    <div class="panel-heading">
                        <h3 class="panel-title">Por favor, identifique-se</h3>
                    </div>
                    <div class="panel-body">
                        <form id="frmLogin" method="POST" action= "${request.contextPath}/j_spring_security_check">
                        	<div class="alert alert-danger" style="display: none;" id='mensagemLogin'></div>
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Usuário" name="j_username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Senha" name="j_password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="_spring_security_remember_me" type="checkbox" value="Lembrar">Continuar conectado
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-primary btn-block" id="btnEntrar">Entrar</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- class="alert alert-danger" -->
	
	<script type='text/javascript'>
		var onLogin;
		
		$.ajaxSetup({
		   beforeSend: function(xhr, event) {
		      // save the 'success' function for later use
		      onLogin = event.success;
		   },
		   statusCode: {
		      // Set up a global AJAX error handler to handle the 401
		      // unauthorized responses. If a 401 status code comes back,
		      // the user is no longer logged-into the system and can not
		      // use it properly.
		      401: function() {
		         alert('Erro 401!');
		      }
		   }
		});
		
		function autenticar() {
		   $('#mensagemLogin').html('Autenticado...').show();
		
		   var form = $('#frmLogin');
		   var config = {
		      type: 'post',
		      url: form.attr('action'),
		      data: form.serialize(),
		      async: false,
		      dataType: 'JSON',
		      success: function(response) {
		         form[0].reset();
		         $('#mensagemLogin').empty();
		      },
		      error: function (response) {
		         var responseText = response.responseText || '[]';
		         var json = responseText.evalJSON();
		         if (json.error) {
		            $('#mensagemLogin').html("<span class='alert alert-danger'>" + json.error + '</span>');
		         }
		         else {
		            $('#mensagemLogin').html(responseText);
		         }
		      }
		   }
		   $.ajax(config);
		}
		
		$(function() {
		   $('#btnEntrar').click(autenticar);
		});
	</script>
	
    <!-- jQuery -->
    <script src="${request.contextPath}/sbadmin2/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${request.contextPath}/sbadmin2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${request.contextPath}/sbadmin2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${request.contextPath}/sbadmin2/dist/js/sb-admin-2.js"></script>

</body>

</html>
