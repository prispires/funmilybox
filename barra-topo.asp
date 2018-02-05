<%
Set RS_logo = Server.CreateObject("ADODB.Recordset")
RS_logo.CursorLocation = 3
RS_logo.CursorType = 0
RS_logo.LockType =  3

RS_logo.Open "SELECT * FROM Roman_flags WHERE tipo = 9 ORDER BY codigo_chave ASC", Conexao


If NOT RS_logo.Eof Then

while not RS_logo.eof

		Set RS_logo_img = Server.CreateObject("ADODB.Recordset")
		RS_logo_img.CursorLocation = 3
		RS_logo_img.CursorType = 0
		RS_logo_img.LockType =  3

		RS_logo_img.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_logo("codigo_chave")  &"'", Conexao

				if not RS_logo_img.eof then
				logoclube = Replace(RS_logo_img("foto"), " ", "")
				else
				logoclube = ""
				end if

RS_logo.movenext
wend
end if
%>
<div class="navbar">
	<div class="menu-mobile-wrapper" data-ix="mobile-menu-hidden">
		<a class="menu-mobile-link" data-ix="close-mobile-menu" href="<%if pagina <> "index" then%>/index.asp<%end if%>#nosso_clube_id">O que é?</a>
		<a class="menu-mobile-link" data-ix="close-mobile-menu" href="<%if pagina <> "index" then%>/index.asp<%end if%>#vantagens_id">O que vem na caixa?</a>
        <a class="menu-mobile-link" data-ix="close-mobile-menu" href="<%if pagina <> "index" then%>/index.asp<%end if%>#planos_id">Planos</a>
        <a class="menu-mobile-link" data-ix="close-mobile-menu" href="<%if pagina <> "index" then%>/index.asp<%end if%>#funciona_id">Como funciona</a>
		<a class="menu-mobile-link" data-ix="close-mobile-menu" id="md_contato">Fale Conosco</a>
	</div>
	<div class="nav-logo-mobile-box">
		<a class="button-link w-inline-block" href="/index.asp"></a>
		<img class="logo-mobile" src="/dashboard/uploads/<%=Replace(logoclube, " ", "")%>" alt="<%=RS_Layout1("nome_site")%>">
	</div>
	<a class="menu-mobile-button-box w-inline-block" data-ix="menu-mobile-open" href="#">
		<div class="mobile-menu-line-1"></div>
		<div class="mobile-menu-line-2"></div>
		<div class="mobile-menu-line-3"></div>
	</a>
	<div class="navbar-block navbar-left">
    <div class="navbar-logo">
			<a class="w-inline-block" href="<%if pagina <> "index" then%>/index.asp<%end if%>#top_id">
				<img class="logo" src="/dashboard/uploads/<%=Replace(logoclube, " ", "")%>" alt="<%=RS_Layout1("nome_site")%>">
			</a>
		</div>
		<a class="navbar-link w-inline-block" href="<%if pagina <> "index" then%>/index.asp<%end if%>#nosso_clube_id">
			<div class="navbar-text-link">O que é?</div>
		</a>
		<a class="navbar-link w-inline-block" href="<%if pagina <> "index" then%>/index.asp<%end if%>#vantagens_id">
			<div class="navbar-text-link">O que vem na caixa?</div>
		</a>
        <a class="navbar-link w-inline-block" href="<%if pagina <> "index" then%>/index.asp<%end if%>#planos_id">
			<div class="navbar-text-link">Planos</div>
		</a>
        <a class="navbar-link w-inline-block" id="md_contatomob">
			<div class="navbar-text-link">Fale Conosco</div>
		</a>
	</div>

	</div>
	<div class="navbar-block navbar-right">
		<a class="navbar-link navlink-blue navlink-planos w-inline-block" href="<%if pagina <> "index" then%>/index.asp<%end if%>#planos_id">
			<div class="navbar-text-link">Assine Já</div>
		</a>
	</div>
	<%If Session("logado") <> "" then%>
	<a class="login-link-mobile navbar-link navlink-blue w-inline-block" href="minhaassinatura.asp">
		<div class="navbar-text-link">LOGIN</div>
	</a>
	<%else%>
	<a class="login-link-mobile navbar-link navlink-blue w-inline-block" id="md_loginmb">
		<div class="navbar-text-link">CONTA</div>
	</a>
	<%end if%>
 
</div>
