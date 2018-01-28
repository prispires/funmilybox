<div class="newsletter">
	<div class="newsletter-container w-container">
		<div class="newsletter-header">
			<div class="linha-container">
				<div class="bola-cheia"></div>
				<div class="largura-planos linha"></div>
				<div class="bola-vazia"></div>
			</div>
			<h3 class="h3 h3-testemunhais">Receba novidades</h3>
			<div class="linha-container">
				<div class="bola-vazia"></div>
				<div class="largura-planos linha"></div>
				<div class="bola-cheia"></div>
			</div>
		</div>
		<div class="newsletter-form-element w-form">

			<div id="resposta_positiva_newletter" style=" display:none;color: #0EA048;font-size: 16px;padding: 5px;border: 1px solid #0EA048;border-radius: 5px;margin: 0 0 10px 0;background: #BDFFD3;text-align: center;font-weight: 600;">
				E-mail cadastrado com sucesso.
			</div>

			<form role="form" class="form-newsletter" id="form-newsletter">

				<input class="newsletter-form-field w-input" data-name="nome_rodape" id="nome_rodape" maxlength="256" name="nome_rodape" placeholder="Digite seu Nome" required="required" type="text">

				<input class="newsletter-form-field w-input" data-name="email_rodape" name="email_rodape" id="email_rodape" maxlength="256" name="email_rodape" placeholder="Digite seu email" required="required" type="email">

				<div class="newsletter-button-wrapper">
					<input class="newsletter-button w-button" data-wait="Aguarde..." type="submit" value="ENVIAR" onClick="valida_newsletter()">
				</div>

			</form>


		</div>
	</div>
</div>
<div class="footer">
	<div class="footer-container w-container">
		<div class="footer-blocks-container">
			<div class="footer-block">
				<h5 class="footer-heading">SOBRE</h5>

				<%if RS_Layout1("cnpj") <> "" then%>
					<div class="cnpj">CNPJ: <%=RS_Layout1("cnpj")%></div>
				<%end if%>

				<%if RS_Layout1("email_site") <> "" then%>
					<a class="footer-email-block w-inline-block" href="#">
						<img class="envelope-icon" src="/config/templateclube/images/mail.svg">
						<div><%=RS_Layout1("email_site")%></div>
					</a>
				<%end if%>

				<%if RS_Layout1("fone_site") <> "" then%>
					<div class="whatsapp-text">Fone - <%=RS_Layout1("fone_site")%></div>
				<%end if%>

			</div>
			<div class="footer-block">
				<h5 class="footer-heading">LINKS</h5>

				<%
				Set RS_paginas = Server.CreateObject("ADODB.Recordset")
				RS_paginas.CursorLocation = 3
				RS_paginas.CursorType = 0
				RS_paginas.LockType =  3
				RS_paginas.Open "SELECT * FROM Paginas WHERE disponivel = 'on' ORDER BY codigo_chave DESC", Conexao

				If NOT RS_paginas.Eof Then
				while not RS_paginas.eof
				%>
				<a class="footer-link" href="institucional.asp?id=<%=RS_paginas("codigo_chave")%>"><%=RS_paginas("titulo")%></a>
				<%
				RS_paginas.movenext
				wend
				end if
				%>

			</div>
			<div class="footer-block">
				<h5 class="footer-heading">FORMAS DE PAGAMENTO</h5>
				<img src="/config/templateclube/images/payments.png">
			</div>
			<div class="footer-block">
				<div class="w-embed w-script">
					<%=RS_Layout1("app_facebook")%>
				</div>
			</div>
		</div>
		<div class="footer-social-wrapper">

			<%if RS_Layout1("facebook_site") <> "" then%>
					<a class="social-link w-inline-block" href="<%=RS_Layout1("facebook_site")%>" target="_blank">
						<img class="social-icon" src="/config/templateclube/images/fb.svg">
					</a>
			<%end if%>

			<%if RS_Layout1("instagram") <> "" then%>
					<a class="social-link w-inline-block" href="<%=RS_Layout1("instagram")%>" target="_blank" >
						<img class="social-icon" src="/config/templateclube/images/inst.svg">
					</a>
			<%end if%>

			<%if RS_Layout1("twitter_site") <> "" then%>
					<a class="social-link w-inline-block" href="<%=RS_Layout1("twitter_site")%>" target="_blank">
						<img class="social-icon" src="/config/templateclube/images/tweet.svg">
					</a>
			<%end if%>

		</div>
	</div>
</div>
<div class="copyright">
	<div class="copyright-text">
		<%=RS_Layout1("copy")%> - <a href="http://www.assinestore.com.br/plataforma-clube-assinaturas.html" target="_blank" style="color:#fff">Clubes de Assinatura AssineStore</a>
	</div>
</div>


	<%

	function sqlInjectionCom()

	palavrasDoMal = array("&lt; script &gt;","&lt;script&gt;","&lt; script&gt;","function()","function","onEvent", "IS%20NULL","NULL","null", "<script>", "<script", "</script>","onmouseover" , "select " , " drop " , "insert" , "delete" ,  "xp_" , "1=1" ,"1=2" , " or " ,"update", "delimiter", "inner", "join" , "create", "truncate" , " from " , "where " , "drop table" , "show tables", "-shutdown","order by", "script", "@@", "/* ... */", "/*", "*/", "alert", "upload")

	for each item in request.QueryString
	for j = lbound(palavrasDoMal) to ubound(palavrasDoMal)
	if instr(lcase(Request.QueryString(item)), lcase(palavrasDoMal(j))) > 0 then
	response.Redirect("/index.asp")
	end if
	next
	next

	for each item in request.form
	for j = lbound(palavrasDoMal) to ubound(palavrasDoMal)
	if instr(lcase(Request.form(item)), lcase(palavrasDoMal(j))) > 0 then
	response.Redirect("/index.asp")
	end if
	next
	next

	for each item in request.Cookies
	for j = lbound(palavrasDoMal) to ubound(palavrasDoMal)
	if instr(lcase(Request.Cookies(item)), lcase(palavrasDoMal(j))) > 0 then
	response.Redirect("/index.asp")
	end if
	next
	next

	end function

	sqlInjectionCom()

	%>
