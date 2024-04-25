<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<style type="text/css">
	@media (max-width: 600px) {
		img {
			max-width: 100%;
		}
		table[id=preheader] {
			display: none;
		}
		table[id=main], table[id=footer] {
			width: 100% !important;
		}
	}
	</style>
</head>
<body bgcolor="#eeeeee" style="margin: 0; padding: 0;">
	<table id="main" cellpadding="0" cellspacing="0" border="0" width="600" align="center" bgcolor="#ffffff" style="border:1px solid #DDD; margin-top: 30px;">
		<tr>
			<td>
				<font face="Arial" size="3" color="#333333">
					<table cellpadding="30" cellspacing="0" border="0" width="100%">
						<tr style="background-color: #f5f5f5 !important;">
							<td>
								<img alt="header logo" src="${shareUrl}/res/themes/default/images/logo.png">
							</td>
						</tr>
						<tr>
							<td>
								<font face="Arial" size="3" color="#999">
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										&nbsp;
									</p>

									<#if users?has_content>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Nous avons reçu une demande de réinitialisation de mot de passe pour le compte associé à l'adresse <b>${email}</b>.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Plusieurs comptes correspondant à cette adresse email ont été trouvés :
										<ul>
											<#list users as user>
											<li>${user}</li>
											</#list>
										</ul>
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Pour sélectionner le compte souhaité et réinitialiser votre mot de passe, cliquez sur le bouton ci-dessous.
									</p>
									<#else>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Nous avons reçu une demande de réinitialisation de mot de passe du compte <b>${username}</b>.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Pour procéder à la réinitialisation, cliquez sur le bouton ci-dessous.
									</p>
									</#if>

									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Si vous n'avez pas demandé la réinitialisation votre mot de passe, veuillez ignorer cet email.
									</p>
									<p style="margin-top: 5px; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Le lien de réinitialisation expirera dans 24 heures.
									</p>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										&nbsp;
									</p>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										Cordialement.
									</p>
									<p style="margin-top: 0; margin-bottom: 0; font-size: 16px; line-height: 24px;">
										&nbsp;
									</p>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<tr>
														<td align="center" style="-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px;" bgcolor="#2196F3">
															<a href="${shareUrl}/page/reset-password?key=${key}&activiti=${activitiId}&<#if users?has_content>email=${email}<#else>user=${username}</#if>" target="_blank" style="font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; padding: 12px 18px; display: inline-block;">
																<#if users?has_content>
																Sélectionner mon compte et réinitialiser le mot de passe
																<#else>
																Réinitialiser mon mot de passe
																</#if>
															</a>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</font>
							</td>
						</tr>
					</table>
				</font>
			</td>
		</tr>
	</table>
	<table id="footer" cellpadding="20" cellspacing="0" border="0" align="center" width="600" bgcolor="#ffffff" style="border-bottom:1px solid #DDD; border-left:1px solid #DDD; border-right:1px solid #DDD;">
		<tr>
			<td style="test-align: center;">
				<font face="Arial" size="2" color="#999">
					Cet email a été adressé à ${email} car l'utilisateur associé à cette adresse email a demandé la réinitialisation de son mot de passe Alfresco.
				</font>
			</td>
		</tr>
	</table>
</body>
</html>
