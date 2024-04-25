<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />


  <style>
body {
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-size: cover;
  background-repeat: no-repeat;
  font-family: Arial, Helvetica, sans-serif;
  
}

.button:hover {
      background-color: #F4C2D9;
      color: #6A164A;
      transform: scale(1.1);
    }

table{
  margin: auto;
  padding-top: .5%;


}

h1, h3, p {
  padding: 1%;
  text-align: center;

}

  </style>


  <title>Sistema de Correspondencia</title>
</head>

<body
  style="font-family: Arial, sans-serif;   background-image: url(https://test.saludmich.net/logos/CORREO.png); background-size: cover; background-repeat: no-repeat;">

    <table style="width:100%; max-width: 50%;" >
      <tr> 
        <td style="padding: 20px;; border: 1px solid #ddd; background-color: rgba(255, 255, 255, 0.8); text-align: center; box-shadow: #e2e2e2 0px 10px 25px 0px ;">
          <h1 style="font-size: 24px; margin-bottom: 20px;">Instrucciones de recuperación de contraseña.</h1>
            <hr style="background-color: #F4C2D9; color: #F4C2D9; height: 6px; width:50% ;border: none;">

          <font size="3">
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										&nbsp;
									</p>

									<#if users?has_content>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Recibimos una solicitud para restablecer la contraseña de la cuenta asociada con la dirección de correo electrónico <b>${email}</b>.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Encontramos varias cuentas registradas con este correo electrónico:
										<ul style="font-weight: bold;">
											<#list users as user>
											<li>${user}</li>
											</#list>
										</ul>
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Para seleccionar su cuenta y restablecer su contraseña, haga clic en el botón a continuación.
									</p>
									<#else>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Recibimos una solicitud para restablecer la contraseña de la cuenta. <b>${username}</b>.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Para restablecer su contraseña, haga clic en el botón a continuación.
									</p>
									</#if>

									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Si no solicitó que se restablezca su contraseña, normalmente puede ignorar este correo electrónico.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px; font-weight: bold;">
										Este enlace de restablecimiento de contraseña caducará en 24 horas.
									</p>
								</font>
          <p>Haz Click en el siguiente botón para recuperar tu contraseña:</p>
          <button class="button" type="button" style="
              border: none;
              padding: 16px 32px;
              text-align: center;
              display: inline-block;
              font-size: 16px;
              margin: 4px 2px;
              transition-duration: 0.4s;
              background-color: #6A164A;
              cursor: pointer;
              border-radius: 12px;">
          <a style="text-decoration: none; color: white" href="${shareUrl}/page/reset-password?key=${key}&activiti=${activitiId}&<#if users?has_content>email=${email}<#else>user=${username}</#if>" target="_blank"> <#if users?has_content>
																Seleccionar cuenta y restablecer contraseña
																<#else>
																Reestablecer contraseña
																</#if></a></button>
            <hr  style="background-color: #F4C2D9; color: #F4C2D9; height: 6px; width:50% ; border: none;">

          <p>Atentamente,</p>
          <p>Secretaría de Salud de Michoacán</p>

      
        </td>
      </tr>
    </table>
    
    <footer>
      <p style=" font-size: 16px;  color: black; height: 20px;">
        Copyright © 2024 | Centro de Inteligencia en Salud
      </p>
    
    </footer>
</body>

</html>