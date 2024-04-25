<!DOCTYPE html>
<html class="grey lighten-2">

<head>
    <title>Sistema de Correspondencia - ${msg("resetPage.pageTitle")}</title>

    <link rel="icon" href="${url.context}/res/favicon.ico" type="image/png">

    <link rel="stylesheet" type="text/css" href="${url.context}/css/materialize.min.css" >
    <link rel="stylesheet" type="text/css" href="${url.context}/css/main.css" >
    <link rel='stylesheet' type='text/css' href="//fonts.googleapis.com/css?family=Raleway:200,600" />

</head>

<body>

<main>
    <div class="container_login">
      <div class="theme-overlay login hidden">
          <span class="card-title" style="display: block; text-align: center; font-size: x-large; font-weight: 900; color: #6A0F49;">${msg("resetPage.title")}</span>
          <div class="divider" style="height: 1px;overflow: hidden;background-color: #FFC3DD;margin-bottom: 8px;"></div>
          <p style="ext-align: center;">${msg("resetPage.text")}</p>
          <form id="form-reset">
              
                  <div class="input-field col s12">
                      <select id="user" class="blue-text">
                      </select>
                      <label>${msg("resetPage.usernameLabel")}</label>
                  </div>
              
              
                  <div class="input-field">
                      <input id="password" type="password" name="password" style="width:100%" required>
                      <label for="password">${msg("resetPage.newpassLabel")}</label>
                  </div>
              
                  <div class="input-field">
                      <input id="confirm-password" type="password" name="confirm-password" style="width:100%" required>
                      <label for="confirm-password">${msg("resetPage.newpassConfirmLabel")}</label>
                  </div>
                  <div style="display:flex; margin-top:10%; justify-content: space-between;">
                    <div class="card-action">
                        <a href="${url.context}" class="waves-effect btn grey lighten-5 grey-text text-darken-4" type="submit" name="action">${msg("resetPage.backtologinButton")}</a>
                    </div>
                    <button id="form-btn" class="btn waves-effect waves-light disabled" disabled type="submit" name="action">${msg("resetPage.submitButton")}</button>
                  </div>
              
              
          </form>
          <div id="loading" class="progress blue lighten-1" style="display:none; margin-top:5%">
              <div class="indeterminate blue lighten-4"></div>
          </div>
          <p class="flow-text" id="form-result" style="font-size: smaller; margin-top: 5%; text-align: center; color: #6a0f49; font-weight: bold;"></p>
          <p id="error" class="orange-text text-darken-4" style="margin-top:5%; text-align:center; font-weight:bolder;"></p>
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

        var key = getUrlParameter('key');
        var activitiId = getUrlParameter('activiti');
        var email = getUrlParameter('email');
        var user = getUrlParameter('user');
        $.ajax({
            type: "POST",
            url: "/share/proxy/alfresco-noauth/androgogic/login/list-users",
            data: JSON.stringify({ email: email, user: user, activiti: activitiId, key: key }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                if(result.users.length == 1){
                    $.each(result.users, function() {
                        $.each(this, function(name, value) {
                            $('#user').append('<option value="'+ value + '" selected>' + value + '</option>');
                        });
                    });
                }else{
                    $('#user').append('<option value="" disabled selected>${msg("resetPage.selectUsername")}</option>');
                    $.each(result.users, function() {
                        $.each(this, function(name, value) {
                            $('#user').append('<option value="'+ value + '">' + value + '</option>');
                        });
                    });
                }
                $('select').material_select();
            },
            error: function(xhr, status, error) {
                $('#user').append('<option value="" disabled selected>${msg("resetPage.noValidUsername")}</option>');
                $('#user').attr('disabled','disabled');
                $('#user').addClass('disabled');
                $('#password').attr('disabled','disabled');
                $('#confirm-password').attr('disabled','disabled');
                $('select').material_select();
                $('#error').text(getErrorMessage(xhr, error));
            }
        });

        $('.modal-trigger').leanModal({
            dismissible: true,
            opacity: .5,
            in_duration: 300,
            out_duration: 200,
            complete: function() { emptyDiv('#form-result'); }
        });

        $('#form-reset').submit(function( event ) {
            event.preventDefault();
            emptyDiv('#form-result');
            emptyDiv('#error');
            $('#loading').show();
            $('#user option').removeAttr('disabled');
            $('#form-btn').attr('disabled','disabled');
            $('#form-btn').removeClass('blue');
            $('#form-btn').addClass('disabled');
            var user = $('#user').val();
            var pwd = $('#password').val();
            $.ajax({
                type: "POST",
                url: "/share/proxy/alfresco-noauth/androgogic/login/reset-password",
                data: JSON.stringify({ username: user, password: pwd, activiti: activitiId, key: key }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(result) {
                    $('#loading').hide();
                    $('#user option').attr('disabled','disabled');
                    $('#form-result').text('${msg("resetPage.passwordUpdated")}');
                },
                error: function(xhr, status, error) {
                    $('#loading').hide();
                    $('#user option').attr('disabled','disabled');
                    $('#form-btn').removeAttr('disabled');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#error').text(getErrorMessage(xhr, error));
                }
            });
        });

        function checkPass(){
            var pwd = document.getElementById('password');
            var pwd2 = document.getElementById('confirm-password');
            if(!$('#user').is(':disabled')){
                if(pwd.value == pwd2.value){
                    emptyDiv('#error');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#form-btn').removeAttr('disabled');
                }else{
                    $('#form-btn').attr('disabled','disabled');
                    $('#form-btn').removeClass('blue');
                    $('#form-btn').addClass('disabled');
                    $('#error').text('${msg("resetPage.passwordMismatch")}');
                }
            }
        }

        $('#confirm-password').keyup(function() {
            checkPass();
            return false;
        });

        function emptyDiv(divElement){
            $( divElement ).empty();
        }

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

    });
</script>

</body>

</html>
