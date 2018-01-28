<head>
  <meta charset="iso-8859-1" />
  <title><%=RS_Layout1("nome_site")%></title>
  <meta name="description" content="<%=RS_Layout1("meta_desc")%>" />
 	<meta name="keywords" content="<%=RS_Layout1("meta_tags")%>" />
  <meta name="robots" content="index, follow" />
	<meta name="author" content="AssineStore" />
  <meta property="og:type" content="website"/>
  <meta property="og:title" content="<%=RS_Layout1("nome_site")%>"/>
  <meta property="og:descriprion" content="<%=RS_Layout1("meta_desc")%>"/>
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <link href="/config/templateclube/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/config/templateclube/css/components.css" rel="stylesheet" type="text/css">
  <link href="/config/templateclube/css/roman-flags-2.css" rel="stylesheet" type="text/css">

  <link href="_wizard/css/gsdk-base.css" rel="stylesheet" />

  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
  <script type="text/javascript">
    WebFont.load({
      google: {
        families: ["Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic","Roboto Slab:100,300,regular,700","Roboto:100,100italic,300,regular,italic,500,700,700italic,900"]
      }
    });
  </script>
  <script src="/config/templateclube/js/modernizr.js" type="text/javascript"></script>
  <link rel="shortcut icon" href="/dashboard/uploads/ce54da8c-0a58-4e63-9032-2a3fcf59a4e5/logo-funmily.jpg" type="image/x-icon" />

    <%
	Set RS_headers = Server.CreateObject("ADODB.Recordset")
	RS_headers.CursorLocation = 3
	RS_headers.CursorType = 0
	RS_headers.LockType =  3

	RS_headers.Open "SELECT * FROM Headers ORDER BY codigo_chave DESC", Conexao

	If NOT RS_headers.Eof Then
	while not RS_headers.eof
	if RS_headers("disponivel") = "on" then
	%>
	<%=RS_headers("texto")%>
	<%
	end if
	RS_headers.movenext
	wend
	end if

	Session.Timeout = 30
	If Request.QueryString("logoff") <> "" Then
		Session.Abandon
		Application("logado") = ""
		Response.Redirect "/index.asp"
	End If
	%>
</head>
