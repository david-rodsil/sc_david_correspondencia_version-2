<!DOCTYPE html>
<html class="grey lighten-2">
<head>
    <title>Sistema de Correspondencia - ${msg("loginPage.pageTitle")}</title>

    <link rel="icon" href="/share/res/favicon.ico" type="image/png">
    <link rel="stylesheet" type="text/css" href="/share/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="/share/css/main.css">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Raleway:200,600">

</head>
<body>
    <main>
        <div class="container_login">
          <div class="theme-overlay login hidden">
            <div class="theme-company-logo"></div>
            <div class="product-name">${msg("app.name")}</div>
            <form id="loginform" accept-charset="UTF-8" method="post" action="/share/page/dologin" class="form-fields login">
              <input type="hidden" name="success" value="/share/page/">
              <input type="hidden" name="failure" value="/share/page/?error=true">
              <div class="input-field">
                  <input id="username" name="username" type="text" required="">
                  <label for="username" class="">${msg("loginPage.usernameLabel")}</label>
              </div>
              <div class="input-field">
                  <input id="password" name="password" type="password" required="">
                  <label for="password" class="">${msg("loginPage.passwordLabel")}</label>
              </div>
              <div class="form-field" style="margin-bottom: 16px;">
                <button type="submit" id="btn-login" name="action" style="width: 100%; background-color: #6A0F49; border-radius: 9px; font-size: 90%; color: white; height: 43px; border-color: transparent; font-family: Open Sans Bold, Arial, sans-serif;">${msg("loginPage.submitButton")}</button>
              </div>
              <div style="display: flex;justify-content: space-between;">
                <a style="font-size: small; padding-right:8px; color: #6a0f49; font-weight: bold;" href="#">No tengo una cuenta</a>
                <a style="font-size: small; padding-left:8px; color: #6a0f49; font-weight: bold;" href="/share/page/forgot-password">${msg("loginPage.forgotButton")}</a>
              </div>
            </form>
          </div>
        <div class="login-copy">© 2024 Centro de Inteligencia en Salud. Todos los derechos reservados.</div>
        </div>

        <div class="card-action">
            <div id="auth-error-modal" class="modal" style="top:10%; border-radius: 5px; padding: 2%;">
                <div class="card-content">
                    <span class="card-title grey-text text-darken-4" style="display: block; text-align: center;">${msg("loginPage.authErrorTitle")}</span>
                    <p class="flow-text" style="text-align: justify;">${msg("loginPage.authErrorText")}</p>
                </div>
                <div class="card-action">
                    <a href="#" class="waves-effect btn-flat grey-text text-darken-4 modal-close" style="float: right;">${msg("loginPage.authErrorClose")}</a>
                </div>
            </div>
        </div>
    </main>
   

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${url.context}/js/materialize.min.js"></script>
    <script>
        $(document).ready(function(){

            function getUrlParameter(sParam) {
                var sPageURL = window.location.search.substring(1);
                var sURLVariables = sPageURL.split('&');
                for (var i = 0; i < sURLVariables.length; i++)
                {
                    var sParameterName = sURLVariables[i].split('=');
                    if (sParameterName[0] == sParam)
                    {
                        return sParameterName[1];
                    }
                }
            };

            var error = getUrlParameter('error');
            if (error == "true") {
                 $('#auth-error-modal').openModal();
            }


        });
    </script>
</body>
</html>
