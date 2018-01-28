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

     codigo = Split(URL,"/")(2)

         Set RS_post = Server.CreateObject("ADODB.Recordset")
         RS_post.CursorLocation = 3
         RS_post.CursorType = 0
         RS_post.LockType =  3

         RS_post.Open "SELECT * FROM Post WHERE canonical = '"&LimpaLixo_Prod(codigo)&"' ", Conexao

         if RS_post.EOF then
         response.redirect("/blog/")
         end if

 %>

 <title><%=RS_post("nome_produto")%> | <%=RS_Layout1("nome_site")%></title>
 <meta name="description" content="<%=RS_post("meta_desc")%>"/>
 <meta property="og:locale" content="pt_BR" />
 <meta property="og:type" content="website" />
 <meta property="og:title" content="<%=RS_post("nome_produto")%> | <%=RS_Layout1("nome_site")%>" />
 <meta property="og:description" content="<%=RS_post("meta_desc")%>" />
 <meta property="og:site_name" content="<%=RS_Layout1("nome_site")%>" />

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
          <div class="slider-blog-post w-slider" data-animation="slide" data-duration="500" data-hide-arrows="1" data-infinite="1" data-nav-spacing="6">
            <div class="w-slider-mask">

              <%
              Set RS_Moto_Foto_Detalhes = Server.CreateObject("ADODB.Recordset")
              RS_Moto_Foto_Detalhes.CursorLocation = 3
              RS_Moto_Foto_Detalhes.CursorType = 0
              RS_Moto_Foto_Detalhes.LockType =  3

              RS_Moto_Foto_Detalhes.Open "SELECT * FROM Post_Foto_Detalhes WHERE codigo_produto = '" & RS_post("codigo_chave")  &"'", Conexao
              while not RS_Moto_Foto_Detalhes.eof
              %>

                <div class="slide-post w-slide" style="background-image: none;">
                  <img style="width: 100%;" src="/dashboard/uploads/<%=Replace(RS_Moto_Foto_Detalhes("foto"), " ", "")%>" alt="<%=RS_post("nome_produto")%>">
                </div>

              <%
              RS_Moto_Foto_Detalhes.movenext
              wend
              RS_Moto_Foto_Detalhes.Close
              Set RS_Moto_Foto_Detalhes = Nothing
              %>



            </div>
            <div class="post-arrow w-slider-arrow-left">
              <div class="w-icon-slider-left"></div>
            </div>
            <div class="post-arrow w-slider-arrow-right">
              <div class="w-icon-slider-right"></div>
            </div>
            <div class="post-slider-nav w-round w-shadow w-slider-nav"></div>
          </div>
          <h1 class="h1-blog-post h1-interno"><%=RS_post("nome_produto")%></h1>
          <div class="blog-post-header">
            <div>Postado em:</div>
            <div class="cms-post-tex">Blog - <%
                Set RS_Genero = Server.CreateObject("ADODB.Recordset")
                RS_Genero.CursorLocation = 3
                RS_Genero.CursorType = 0
                RS_Genero.LockType =  3

                RS_Genero.Open "SELECT * FROM Categorias_blog WHERE codigo_chave = '"&RS_post("codigo_categoria")&"' ", Conexao

                if not RS_Genero.eof then
                categoria_canonical = RS_Genero("canonical")
                nome_categoria_canonical = RS_Genero("nome_categoria")

                %>
                  <a itemprop="item" href="/blog/categoria/<%=RS_Genero("canonical")%>" title="<%=RS_Genero("nome_categoria")%>"><%=RS_Genero("nome_categoria")%></a>
                <%
                end if
                %></div>

            <div class="data-post">- <%=RS_post("data")%></div>
          </div>
          <div class="post-body w-richtext">
            <p><%=RS_post("descricao_produto")%></p>
          </div>
          <div class="disqus-wrapper">

                <div id="disqus_thread"></div>
                <script>
                var disqus_shortname = 'assinestore';
                var disqus_identifier = '<%=RS_post("nome_produto")%>';
                var disqus_title = '<%=RS_post("nome_produto")%>';
                var disqus_url = 'http://www.assinestore.com.br/post/<%=RS_post("canonical")%>';

                (function() { // DON'T EDIT BELOW THIS LINE
                var d = document, s = d.createElement('script');

                s.src = '//assinestore.disqus.com/embed.js';

                s.setAttribute('data-timestamp', +new Date());
                (d.head || d.body).appendChild(s);
                })();
                </script>
                <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">Disqus.</a></noscript>


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
          <div class="categoria-header">
            <h1 class="h1-interno">+ Posts</h1>
          </div>

          <%
          Set RS_post = Server.CreateObject("ADODB.Recordset")
          RS_post.Pagesize = 10
          RS_post.CursorLocation = 3
          RS_post.CursorType = 0
          RS_post.LockType =  3

          RS_post.Open "SELECT * FROM Post WHERE disponivel = 1 AND canonical <> '"&LimpaLixo_Prod(codigo)&"' ORDER BY codigo_chave DESC LIMIT 5", Conexao

          if not RS_post.eof then

          While Not RS_post.Eof

             Set RS_categorias = CreateObject("ADODB.Recordset")
             Set RS_categorias.ActiveConnection = Conexao
             RS_categorias.CursorLocation = 3
             RS_categorias.CursorType = 0
             RS_categorias.LockType =  1
             RS_categorias.Open "SELECT * FROM Categorias_blog WHERE codigo_chave = '"&RS_post("codigo_categoria")&"' ", Conexao
          %>
          <div class="post-side-block">
            <a class="button-link w-inline-block" href="../post/<%=RS_post("canonical")%>"></a>
            <img class="side-post-image" src="/dashboard/uploads/<%=RS_post("img_produtoGRD")%>" alt="<%=RS_post("nome_produto")%>">
            <div class="blog-title blog-title-side"><%=RS_post("nome_produto")%></div>
          </div>

           <%
                        RS_post.movenext
                        wend

                        end if
                        %>


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

    <script id="dsq-count-scr" src="//assinestore.disqus.com/count.js" async></script>

  </body>
  </html>
