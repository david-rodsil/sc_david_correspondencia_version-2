<!DOCTYPE html>
<html class="grey lighten-2">

<head>
    <title>Sistema de Correspondencia - ${msg("forgotPage.pageTitle")}</title>

    <link rel="icon" href="${url.context}/res/favicon.ico" type="image/png">

    <link rel="stylesheet" type="text/css" href="${url.context}/css/materialize.min.css" >
    <link rel="stylesheet" type="text/css" href="${url.context}/css/main.css" >
    <link rel='stylesheet' type='text/css' href="//fonts.googleapis.com/css?family=Raleway:200,600" />

</head>

<body>
  <main>
        <div class="container_login">
            <div class="theme-overlay login hidden">
                <span class="card-title" style="display: block;text-align: center; font-size: x-large;font-weight: 900; color: #6A0F49;">${msg("forgotPage.title")}</span>
                <div style="height: 1px; overflow: hidden;background-color: #FFC3DD; margin-bottom: 8px;"></div>
                <p style="text-align: center;">Podemos enviarte los detalles de como recuperarla.</p>
                <p style="text-align: center;">Por favor ingresa tu dirección de correo electrónico o el <br>nombre de usuario que utilizas para ingresar a tu cuenta.</p>
                <form id="form-forgot">
                  <div id="form-label" class="input-field col s12">
                    <input id="email" type="text" name="email" style="width: 100%;" required="">
                    <label for="email">${msg("forgotPage.label")}</label>
                  </div>
                  <div style="display:flex; margin-top:8%; justify-content: space-between;">
                    <div class="card-action">
                      <a href="/share" class="waves-effect btn grey lighten-5 grey-text text-darken-4" type="submit" name="action">${msg("forgotPage.cancelButton")}</a>
                    </div>
                    <button id="form-btn" class="btn waves-effect waves-light" type="submit" name="action" style="background-color: #6A0F49 !important;">${msg("forgotPage.submitButton")}</button>
                  </div>
                </form>

                <div id="loading" class="progress blue lighten-1" style="width:100%; display:none; margin-top:5%;">
                    <div class="indeterminate lighten-4" style="width:50%;"></div>
                </div>
                <div>
                  <p class="flow-text" id="form-result" style="font-size: small; color: #6A0F49; font-weight: bold; margin-top: 5%; text-align: center;"></p>
                  <p id="error" style="font-size: x-small; margin-top: 5%; text-align: center; color: #6A0F49; font-weight: bold;"></p>
                </div>
              </div>
            
        </div>
    </main>


    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${url.context}/js/materialize.min.js"></script>
    <script>
    function getErrorMessage(xhr, error) {
        try {
            var response = JSON.parse(xhr.responseText);
            return response.message;
        } catch(e) {
            return error;
        }
    }

    $(document).ready(function(){

        $('#form-forgot').submit(function( event ) {
            event.preventDefault();
            emptyDiv('#form-result');
            emptyDiv('#error');
            $('#loading').show();
            $('#form-btn').attr('disabled','disabled');
            $('#form-btn').removeClass('blue');
            $('#form-btn').addClass('disabled');
            var emailValue = $('#email').val();
            $.ajax({
                type: "POST",
                url: "/share/proxy/alfresco-noauth/androgogic/login/forgot-password",
                data: JSON.stringify({ email: emailValue }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(result) {
                    $('#loading').hide();
                    $('#form-btn').removeAttr('disabled');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#form-result').text('Instrucciones enviadas. Por favor revisa tu bandeja de entrada.');
                },
                error: function(xhr, status, error) {
                    $('#loading').hide();
                    $('#form-btn').removeAttr('disabled');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#error').text(getErrorMessage(xhr, error));
                }
            });
        });

        function emptyDiv(divElement){
            $( divElement ).empty();
        }

    });
    </script>

</body>

</html>
