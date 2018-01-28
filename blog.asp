<!DOCTYPE html>
<!--  Last Published: Sat Dec 03 2016 07:28:29 GMT+0000 (UTC)  -->
<html data-wf-page="582aedef2f37bac07c1f0e8c" data-wf-site="582aedef2f37bac07c1f0e8b">

<%
pagina = "blog"
Session("template") = "romanflags"
%>

<head>
  <meta charset="iso-8859-1" />

  <%
   url = Replace(Replace(Split(Request.ServerVariables("QUERY_STRING"), ";")(1), "http://", ""), "https://", "")

   arra_y = Split(URL,"/")

   if UBound(arra_y) >= 2 then
     secao = Split(URL,"/")(2)
   end if

palavra_busca = ""

if secao = "categoria" then

   codigo = Split(URL,"/")(3)

         Set RS_categoria_busca = Server.CreateObject("ADODB.Recordset")
         RS_categoria_busca.CursorLocation = 3
         RS_categoria_busca.CursorType = 0
         RS_categoria_busca.LockType =  3

         RS_categoria_busca.Open "SELECT * FROM Categorias_blog WHERE canonical = '"&LimpaLixo_Prod(codigo)&"' ", Conexao

         if RS_categoria_busca.EOF then
           Response.redirect("/blog/")
         end if

   codigo_categoria = RS_categoria_busca("codigo_chave")
%>
 <title><%=RS_categoria_busca("nome_categoria")%> | <%=RS_Layout1("nome_site")%></title>
 <meta name="description" content="<%=RS_categoria_busca("descricao_categoria")%>"/>
 <meta property="og:locale" content="pt_BR" />
 <meta property="og:type" content="website" />
 <meta property="og:title" content="<%=RS_categoria_busca("nome_categoria")%> | <%=RS_Layout1("nome_site")%>" />
 <meta property="og:description" content="<%=RS_categoria_busca("descricao_categoria")%>" />
 <meta property="og:site_name" content="<%=RS_Layout1("nome_site")%>" />

<%
elseif secao = "busca" then

   palavra_busca = Split(URL,"/")(3)
   palavra_busca = Replace(palavra_busca, "?s=", "")
   palavra_busca = Replace(palavra_busca, "'", "''")
   palavra_busca = Replace(palavra_busca, "+", " ")

%>

 <title><%=palavra_busca%> | <%=RS_Layout1("nome_site")%></title>
 <meta property="og:locale" content="pt_BR" />
 <meta property="og:type" content="website" />
 <meta property="og:title" content="<%=palavra_busca%> | <%=RS_Layout1("nome_site")%>" />
 <meta property="og:site_name" content="<%=RS_Layout1("nome_site")%>" />

<%else%>
 <title>Blog | <%=RS_Layout1("nome_site")%></title>
<meta name="author" content="AssineStore" />
 <meta property="og:locale" content="pt_BR" />
 <meta property="og:type" content="website" />
 <meta property="og:title" content="Blog | <%=RS_Layout1("nome_site")%>" />
 <meta property="og:site_name" content="assinestore" />
<%end if%>

  <meta name="robots" content="index, follow" />
	<meta name="author" content="AssineStore" />
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
  <script src='https://www.google.com/recaptcha/api.js'></script>
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


<body>

  <!--#INCLUDE FILE="barra-topo.asp"-->

    <div class="body-content">
      <div class="content-wrapper w-container">
        <div class="content-left-box">
          <div class="blog-header-interno">
            <div class="header-wrapper">
              <div class="linha-interna"></div>
              <h1 class="h1-interno">Nosso Blog</h1>
              <div class="linha-interna"></div>
            </div>
            <div class="subtitulo-interno">Novidades e kits enviados!</div>
          </div>
          <div class="posts-wrapper" style="    display: block;">

            <%
            Set RS_post = Server.CreateObject("ADODB.Recordset")
						RS_post.Pagesize = 10
						RS_post.CursorLocation = 3
						RS_post.CursorType = 0
						RS_post.LockType =  3

						if secao = "busca" then

							palavra = Split(URL,"/")(3)
							palavra = Replace(palavra, "?s=", "")
							palavra = Replace(palavra, "'", "''")
							palavra = Replace(palavra_busca, "+", " ")
							palavra = replace(palavra, " ", "%")

							busca_q =  " AND (nome_produto like '%" & LimpaLixo_Prod(palavra) & "%' OR descricao_produto LIKE '%" & LimpaLixo_Prod(palavra) & "%')"
							busca = "&buscar = " &LimpaLixo_Prod(Request("buscar"))
						else
							busca_q = ""
							busca = ""
						end if

						if codigo_categoria <> "" then
							cat =  " AND codigo_categoria = " &LimpaLixo_Prod(codigo_categoria)
							cates = "&categoria = " &LimpaLixo_Prod(codigo_categoria)
						else
							cat = ""
							cates = ""
						end if

						if request("subcategoria") <> "" then
							subc = " AND codigo_subcategoria = " &LimpaLixo_Prod(Request("subcategoria"))
							subcates = "&subcategoria = " &LimpaLixo_Prod(Request("subcategoria"))
						else
							subc = ""
							subcates = ""
						end if

						RS_post.Open "SELECT * FROM Post WHERE disponivel = 1 "&cat&" "&subc&" "&busca_q&" ORDER BY codigo_chave DESC", Conexao

						if not RS_post.eof then

						PaginaAtual = CInt(Request.Querystring( "Pages"))

						If PaginaAtual = 0 Then
						PaginaAtual = 1
						End If

						RS_post.AbsolutePage = PaginaAtual
						Num = RS_post.PageCount

						While Not RS_post.Eof And RS_post.AbsolutePage = PaginaAtual

            %>
            <div class="blog-post-card post-card-interno" style="float: left;width: 31%;float: left; margin: 5px;">
                          <img src="/dashboard/uploads/<%=RS_post("img_produtoGRD")%>" alt="<%=RS_post("nome_produto")%>">
                          <div class="blog-title blog-title-interno"><%=RS_post("nome_produto")%></div>
                          <div class="blog-button">
                            <a class="button-link w-inline-block" href="../post/<%=RS_post("canonical")%>">
                              <div class="blog-button-box blog-button-hover">
                                <div class="linha linha-blog"></div>
                                <img class="blog-button-image" src="/config/templateclube/images/ler_post_whitetext.svg">
                                <div class="linha linha-blog"></div>
                              </div>
                              <div class="blog-button-box">
                                <div class="linha linha-blog linha-blog-red"></div>
                                <img class="blog-button-image" src="/config/templateclube/images/ler_post.svg">
                                <div class="linha linha-blog linha-blog-red"></div>
                              </div>
                            </a>
                          </div>
                        </div>

                        <%if i = 3 then%>
                        <div style="clear: both; width: 100%;"></div>
                        <%
                        i = 0
                        end if
                        %>

						<%
						RS_post.movenext
						wend

						end if
						%>

          </div>
        </div>
        <div class="content-right-box">
          <div class="categoria-header">
            <h1 class="h1-interno">Categorias</h1>
          </div>
          <div class="subtitulo-interno">Fique informado!</div>
          <div class="categorias-wrapper">

            <%
            Set RS_categorias = CreateObject("ADODB.Recordset")
            Set RS_categorias.ActiveConnection = Conexao
            RS_categorias.CursorLocation = 3
            RS_categorias.CursorType = 0
            RS_categorias.LockType =  1
            RS_categorias.Open "SELECT * FROM Categorias_blog ORDER BY nome_categoria ASC ", Conexao

            while not RS_categorias.eof
            %>
            <div class="categoria">
              <a href="categoria/<%=LCase(RS_categorias("canonical"))%>" title="<%=RS_categorias("nome_categoria")%>" class="categoria-txt"><%=RS_categorias("nome_categoria")%></a>
            </div>
            <%
            RS_categorias.movenext
            Wend
            %>

          </div>
        </div>
      </div>
    </div>


    <!--#INCLUDE FILE="barra-rodape.asp"-->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" type="text/javascript"></script>
    <script src="/config/templateclube/js/roman-flags-2.js" type="text/javascript"></script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
    <script type="text/javascript" src="/config/templateclube/_js/jquery.mask.min.js"></script>
    <script type="text/javascript" src="/config/templateclube/_js/scripts.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/_wizard/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="/_wizard/js/jquery.validate.min.js"></script>
    <script src="/_wizard/js/wizard.js"></script>

  </body>
  </html>
