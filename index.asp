<!DOCTYPE html>
<!--  Last Published: Sat Dec 03 2016 07:28:29 GMT+0000 (UTC)  -->
<html data-wf-page="582aedef2f37bac07c1f0e8c" data-wf-site="582aedef2f37bac07c1f0e8b">

<%
pagina = "index"
Session("template") = "romanflags"
%>
<!--#INCLUDE FILE="barra-topo-estilos.asp"-->

<body>

  <!--#INCLUDE FILE="barra-topo.asp"-->


  <div class="slider-container w-slider" data-animation="over" data-duration="500" data-infinite="1" data-nav-spacing="7" id="top_id">
    <div class="w-slider-mask">

    <%
    Set RS_slides = Server.CreateObject("ADODB.Recordset")
    RS_slides.CursorLocation = 3
    RS_slides.CursorType = 0
    RS_slides.LockType =  3

    RS_slides.Open "SELECT * FROM Roman_flags WHERE tipo = 0 ORDER BY codigo_chave ASC", Conexao


    If NOT RS_slides.Eof Then
    i = 1
    while not RS_slides.eof

        Set RS_slides_foto = Server.CreateObject("ADODB.Recordset")
        RS_slides_foto.CursorLocation = 3
        RS_slides_foto.CursorType = 0
        RS_slides_foto.LockType =  3

        RS_slides_foto.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_slides("codigo_chave")  &"'", Conexao

            if not RS_slides_foto.eof then
            fotoparc = RS_slides_foto("foto")
            else
            fotoparc = ""
            end if
    %>

    <div class="slide slide-<%=i%> w-slide" style="background-image: linear-gradient(180deg, rgba(0, 0, 0, .55), rgba(0, 0, 0, .55)), url(/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>) !important;">
      <div class="slide-content w-container">
        <h1><%=RS_slides("titulo")%></h1>
        <div class="slide-linhas-container">
          <div class="linha-container">
            <div class="bola-cheia"></div>
            <div class="largura-abertura linha"></div>
            <div class="bola-vazia"></div>
          </div>
          <div class="linha-container">
            <div class="bola-vazia"></div>
            <div class="largura-abertura linha"></div>
            <div class="bola-cheia"></div>
          </div>
        </div>
        <p class="slider-text"><%=RS_slides("texto")%></p>
        <div class="slide-button">
          <a class="button-link w-inline-block" href="#planos_id"></a>
          <div class="button-text">CONHE&Ccedil;A OS PLANOS</div>
        </div>
      </div>
    </div>

    <%
    i = i+1
    RS_slides.movenext
    wend
    end if
    %>




    </div>
    <div class="arrow-area left-hero w-slider-arrow-left">
      <img class="arrow-hero" src="/config/templateclube/images/arrow_left.svg">
    </div>
    <div class="arrow-area right-hero w-slider-arrow-right">
      <img class="arrow-hero" src="/config/templateclube/images/arrow_right.svg">
    </div>
    <div class="hero-slide-nav w-round w-shadow w-slider-nav"></div>
  </div>

  <%
  Set RS_Chamada_Principal = Server.CreateObject("ADODB.Recordset")
  RS_Chamada_Principal.CursorLocation = 3
  RS_Chamada_Principal.CursorType = 0
  RS_Chamada_Principal.LockType =  3

  RS_Chamada_Principal.Open "SELECT * FROM Roman_flags WHERE tipo = 6 ORDER BY codigo_chave ASC", Conexao


  If NOT RS_Chamada_Principal.Eof Then

  while not RS_Chamada_Principal.eof

      Set RS_Chamada_Principal_Foto = Server.CreateObject("ADODB.Recordset")
      RS_Chamada_Principal_Foto.CursorLocation = 3
      RS_Chamada_Principal_Foto.CursorType = 0
      RS_Chamada_Principal_Foto.LockType =  3

      RS_Chamada_Principal_Foto.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_Chamada_Principal("codigo_chave")  &"'", Conexao

          if not RS_Chamada_Principal_Foto.eof then
          fotoparc = RS_Chamada_Principal_Foto("foto")
          else
          fotoparc = ""
          end if
  %>
  <div class="abertura">
    <div class="abertura-container w-container">
      <div class="abertura-header">
        <div class="linha-container">
          <div class="bola-cheia"></div>
          <div class="largura-abertura linha"></div>
          <div class="bola-vazia"></div>
        </div>
        <h2 class="h2 h2-home"><%=RS_Chamada_Principal("titulo")%></h2>
        <div class="linha-container">
          <div class="bola-vazia"></div>
          <div class="largura-abertura linha"></div>
          <div class="bola-cheia"></div>
        </div>
      </div>
      <div class="abertura-content">
        <img class="abertura-icon" src="/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>" alt="<%=RS_Chamada_Principal("titulo")%>">
        <div class="abertura-text w-richtext">
          <%=RS_Chamada_Principal("texto")%>
        </div>
      </div>
    </div>
  </div>
  <%
  RS_Chamada_Principal.movenext
  wend
  end if
  %>

  <div class="como-funciona" id="funciona_id">
    <div class="como-funciona-container w-container">
      <div class="flag-stripe-box">
        <div class="stripe stripe-orange">
          <div class="stripe-point-box">
            <img class="point" src="/config/templateclube/images/point_60.svg" width="60">
          </div>
          <div class="stripe-fold-box">
            <img class="stripe-fold" src="/config/templateclube/images/stripe_fold_grey.svg">
          </div>
        </div>
      </div>
      <div class="como-funciona-header">
        <div class="linha-container">
          <div class="bola-cheia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-vazia dark"></div>
        </div>
        <h3 class="h3 h3-como-funciona">Como funciona?</h3>
        <div class="linha-container">
          <div class="bola-vazia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-cheia dark"></div>
        </div>
      </div>
      <div class="como-funciona-cards-wrapper">

        <%
        Set RS_funciona = Server.CreateObject("ADODB.Recordset")
        RS_funciona.CursorLocation = 3
        RS_funciona.CursorType = 0
        RS_funciona.LockType =  3

        RS_funciona.Open "SELECT * FROM Roman_flags WHERE tipo = 1 ORDER BY codigo_chave ASC", Conexao


        If NOT RS_funciona.Eof Then

        while not RS_funciona.eof

            Set RS_funciona_img = Server.CreateObject("ADODB.Recordset")
            RS_funciona_img.CursorLocation = 3
            RS_funciona_img.CursorType = 0
            RS_funciona_img.LockType =  3

            RS_funciona_img.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_funciona("codigo_chave")  &"'", Conexao

                if not RS_funciona_img.eof then
                fotoparc = RS_funciona_img("foto")
                else
                fotoparc = ""
                end if
        %>
        <div class="como-funciona-card">
          <img class="como-funciona-icon" src="/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>" alt="<%=RS_funciona("titulo")%>">
          <div class="titulo-card"><%=RS_funciona("titulo")%></div>
          <div class="texto-card"><%=RS_funciona("texto")%></div>
        </div>
        <%
        RS_funciona.movenext
        wend
        end if
        %>


      </div>
      <div class="funciona slide-button">
        <a class="button-link w-inline-block" href="#planos_id"></a>

        <div class="button-text">ESCOLHA E ASSINE!</div>

      </div>
    </div>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" type="text/javascript"></script>
  <script src="/config/templateclube/js/roman-flags-2.js" type="text/javascript"></script>
  <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
  <script type="text/javascript" src="/config/templateclube/_js/jquery.mask.min.js"></script>
  <script type="text/javascript" src="/config/templateclube/_js/scripts.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="_wizard/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
  <script src="_wizard/js/jquery.validate.min.js"></script>
  <script src="_wizard/js/wizard.js"></script>

  <%
  Set RS_backplanos = Server.CreateObject("ADODB.Recordset")
  RS_backplanos.CursorLocation = 3
  RS_backplanos.CursorType = 0
  RS_backplanos.LockType =  3

  RS_backplanos.Open "SELECT * FROM Roman_flags WHERE tipo = 7 ORDER BY codigo_chave ASC", Conexao


  If NOT RS_backplanos.Eof Then

  while not RS_backplanos.eof

      Set RS_backplanos_img = Server.CreateObject("ADODB.Recordset")
      RS_backplanos_img.CursorLocation = 3
      RS_backplanos_img.CursorType = 0
      RS_backplanos_img.LockType =  3

      RS_backplanos_img.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_backplanos("codigo_chave")  &"'", Conexao

          if not RS_backplanos_img.eof then
          backplanos = "style='background-image: linear-gradient(180deg, rgba(0, 0, 0, .55), rgba(0, 0, 0, .55)), url(/dashboard/uploads/"&Replace(RS_backplanos_img("foto"), " ", "")&") !important;'"
          else
          backplanos = ""
          end if

  RS_backplanos.movenext
  wend
  end if
  %>

  <div class="planos" id="planos_id" <%=backplanos%> >
  	<div class="planos-container w-container">
  		<div class="planos-header">
  			<div class="linha-container">
  				<div class="bola-cheia"></div>
  				<div class="largura-planos linha"></div>
  				<div class="bola-vazia"></div>
  			</div>
  			<h3 class="h3 h3-planos">Escolha seu plano mensal</h3>
  			<div class="linha-container">
  				<div class="bola-vazia"></div>
  				<div class="largura-planos linha"></div>
  				<div class="bola-cheia"></div>
  			</div>
  		</div>

  		<div class="slider-planos w-slider" data-animation="slide" data-duration="500" data-infinite="1" data-nav-spacing="7">
  			<div class="mask-planos w-slider-mask">

  				<%
  				Set RS_planos = CreateObject("ADODB.Recordset")
  				Set RS_planos.ActiveConnection = Conexao
  				RS_planos.CursorLocation = 3
  				RS_planos.CursorType = 0
  				RS_planos.LockType =  1

  				RS_planos.Open "SELECT * FROM Produtos WHERE plano = 1 ORDER BY preco_unitario DESC", Conexao
  				i = 1
  				while not RS_planos.eof
  				%>

  				<div class="plano<%=i%> slide-plano w-slide">
  					<div class="plano-card">
  						<h4 class="plano-title"><%=RS_planos("nome_produto")%></h4>
  						<div class="slider-plano-itens w-slider" data-animation="slide" data-duration="500" data-infinite="1" data-nav-spacing="5">
  							<div class="slide-plano-itens-mask w-slider-mask">

                  <%
                  Set RS_Moto_Foto_Detalhes = Server.CreateObject("ADODB.Recordset")
                  RS_Moto_Foto_Detalhes.CursorLocation = 3
                  RS_Moto_Foto_Detalhes.CursorType = 0
                  RS_Moto_Foto_Detalhes.LockType =  3

                  RS_Moto_Foto_Detalhes.Open "SELECT * FROM Produtos_Foto_Detalhes WHERE codigo_produto = '" & RS_planos("codigo_chave")  &"'", Conexao
                  while not RS_Moto_Foto_Detalhes.eof
                  %>

                  <div class="slide-plano-item w-slide">
                    <img class="plano-image" src="/dashboard/uploads/<%=Replace(RS_Moto_Foto_Detalhes("foto"), " ", "")%>" alt="<%=RS_planos("nome_produto")%>">
                  </div>

                  <%
                  RS_Moto_Foto_Detalhes.movenext
                  wend
                  RS_Moto_Foto_Detalhes.Close
                  Set RS_Moto_Foto_Detalhes = Nothing
                  %>


  							</div>
  							<div class="plano-item-left w-slider-arrow-left">
  								<div class="w-icon-slider-left"></div>
  							</div>
  							<div class="plano-item-right w-slider-arrow-right">
  								<div class="w-icon-slider-right"></div>
  							</div>
  							<div class="plano-item-nav w-round w-slider-nav w-slider-nav-invert"></div>
  						</div>
  						<div class="plano-item-title">DETALHES</div>
  						<div class="plano-item-text"><%=RS_planos("descricao_produto")%></div>
  						<div class="plano-price-box">
  							<div class="cifra plano-price">R$</div>
  							<div class="plano-price"><%=formatnumber(RS_planos("preco_unitario"))%></div>
  							<div class="mes plano-price">/m&ecirc;s</div>
  						</div>
  						<div class="plano slide-button">
  							<a class="button-link w-inline-block" onclick="addcar('<%=RS_planos("codigo_produto")%>');"  ></a>

  							<div class="button-text">ASSINAR</div>

  							<input type="hidden" id="plano<%=i%>" name="plano<%=i%>" value="<%=RS_planos("nome_produto")%>">
  							<input type="hidden" id="valor_plano<%=i%>" value="<%=FormatNumber(RS_planos("preco_unitario"))%>">
  							<input type="hidden" id="peso_plano<%=i%>" value="<%=replace(RS_planos("peso"), ",",".")%>">


  						</div>
  						<!--<a class="mes-anterior plano-item-text">ver kits de meses anteriores</a>-->
  					</div>
  				</div>

  				<%
  				i = i+1
  				RS_planos.movenext
  				wend
  				%>

          <script>
           function addcar(a) {
            qtd = '1';
            cor = '0';
            tam = '0';
            grade = '';

              $.post('/checkout/functions/Geral/functions.asp', {
                tipo: "novo_ped",
                qtd: qtd,
                id_prod: a,
                codigo_tamanho: tam,
                codigo_cor: cor,
                grade: grade

              }, function (data) {

                window.location='<%=RS_Layout1("url_segura")%>/checkout/index.asp?id='+data;

              });
          }
        </script>

  			</div>
  			<div class="left-planos w-slider-arrow-left">
  				<img class="arrow-plano" src="/config/templateclube/images/arrow_left.svg">
  			</div>
  			<div class="right-planos w-slider-arrow-right">
  				<img class="arrow-plano" src="/config/templateclube/images/arrow_right.svg">
  			</div>
  			<div class="slider-planos-nav w-round w-slider-nav"></div>
  		</div>
  	</div>
  </div>

  <div class="vantagens" id="vantagens_id">
    <div class="vantagens-container w-container">
      <div class="flag-box-right flag-stripe-box flag-stripe-curta">
        <div class="stripe stripe-blue">
          <div class="stripe-point-box">
            <img class="point" src="/config/templateclube/images/point_blue.svg" width="60">
          </div>
          <div class="stripe-fold-box">
            <img class="stripe-fold stripe-fold-righ w-preserve-3d" src="/config/templateclube/images/stripe_fold_grey.svg">
          </div>
        </div>
      </div>
      <div class="vantagens-header">
        <div class="linha-container">
          <div class="bola-cheia"></div>
          <div class="largura-planos linha"></div>
          <div class="bola-vazia"></div>
        </div>
        <h3 class="h3 h3-vantagens">Vantagens de assinar</h3>
        <div class="linha-container">
          <div class="bola-vazia"></div>
          <div class="largura-planos linha"></div>
          <div class="bola-cheia"></div>
        </div>
      </div>
      <div class="vantagens-cards-wrapper">

        <%
        Set RS_vantagens = Server.CreateObject("ADODB.Recordset")
        RS_vantagens.CursorLocation = 3
        RS_vantagens.CursorType = 0
        RS_vantagens.LockType =  3

        RS_vantagens.Open "SELECT * FROM Roman_flags WHERE tipo = 3 ORDER BY codigo_chave ASC", Conexao


        If NOT RS_vantagens.Eof Then

        while not RS_vantagens.eof

            Set RS_vantagens_foto = Server.CreateObject("ADODB.Recordset")
            RS_vantagens_foto.CursorLocation = 3
            RS_vantagens_foto.CursorType = 0
            RS_vantagens_foto.LockType =  3

            RS_vantagens_foto.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_vantagens("codigo_chave")  &"'", Conexao

                if not RS_vantagens_foto.eof then
                fotoparc = RS_vantagens_foto("foto")
                else
                fotoparc = ""
                end if
        %>
        <div class="vantagens-card">
          <img class="vantagens-icon" src="/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>" alt="<%=RS_vantagens("titulo")%>">
          <div class="titulo-card titulo-vantagens"><%=RS_vantagens("titulo")%></div>
          <div class="texto-card texto-vantagens"><%=RS_vantagens("texto")%></div>
        </div>
        <%
        RS_vantagens.movenext
        wend
        end if
        %>

      </div>
      <div class="slide-button vantagem-button">
        <a class="button-link w-inline-block" href="#planos_id"></a>

        <div class="button-text">ENTRE NO CLUBE</div>

      </div>
    </div>
  </div>

  <div class="testemunhais">
    <div class="testemunhais-container w-container">
      <div class="testemunhais-header">
        <div class="linha-container">
          <div class="bola-cheia"></div>
          <div class="largura-planos linha"></div>
          <div class="bola-vazia"></div>
        </div>
        <h3 class="h3 h3-testemunhais">O que falam de n&oacute;s?</h3>
        <div class="linha-container">
          <div class="bola-vazia"></div>
          <div class="largura-planos linha"></div>
          <div class="bola-cheia"></div>
        </div>
      </div>
      <div class="testemunhais-wrapper">

        <%
        Set RS_depoimentos = Server.CreateObject("ADODB.Recordset")
        RS_depoimentos.CursorLocation = 3
        RS_depoimentos.CursorType = 0
        RS_depoimentos.LockType =  3

        RS_depoimentos.Open "SELECT * FROM Roman_flags WHERE tipo = 4 ORDER BY codigo_chave ASC", Conexao


        If NOT RS_depoimentos.Eof Then

        while not RS_depoimentos.eof

            Set RS_depoimentos_foto = Server.CreateObject("ADODB.Recordset")
            RS_depoimentos_foto.CursorLocation = 3
            RS_depoimentos_foto.CursorType = 0
            RS_depoimentos_foto.LockType =  3

            RS_depoimentos_foto.Open "SELECT * FROM Roman_flags_Foto WHERE codigo_pagina = '" & RS_depoimentos("codigo_chave")  &"'", Conexao

                if not RS_depoimentos_foto.eof then
                fotoparc = RS_depoimentos_foto("foto")
                else
                fotoparc = ""
                end if
        %>

        <div class="testemunhal-card">
          <div class="testemunhal-foto-mask">
            <img class="testemunhal-foto" src="/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>" alt="<%=RS_depoimentos("titulo")%>">
          </div>
          <div class="texto-card texto-testemunhal"><%=RS_depoimentos("texto")%></div>
          <div class="testemunhal-nome"><%=RS_depoimentos("titulo")%></div>
        </div>

        <%
        RS_depoimentos.movenext
        wend
        end if
        %>




      </div>
      <div class="slide-button testemunhal-button">
        <a class="button-link w-inline-block" href="#planos_id"></a>

        <div class="button-text">ENTRE NO CLUBE</div>

      </div>
    </div>
  </div>

  <div class="blog" id="blog_id">
    <div class="blog-container w-container">
      <div class="blog-header">
        <div class="linha-container">
          <div class="bola-cheia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-vazia dark"></div>
        </div>
        <h3 class="h3 h3-blog">Leia nosso blog</h3>
        <div class="linha-container">
          <div class="bola-vazia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-cheia dark"></div>
        </div>
      </div>
      <div class="blog-posts-wrapper">

        <%
        Set RS_blog = Server.CreateObject("ADODB.Recordset")
        RS_blog.CursorLocation = 3
        RS_blog.CursorType = 0
        RS_blog.LockType =  3

        RS_blog.Open "SELECT * FROM Post WHERE disponivel = 1 ORDER BY data DESC LIMIT 3", Conexao


        If NOT RS_blog.Eof Then

        while not RS_blog.eof

        %>

        <div class="blog-post-card">
          <img class="img-blog" src="/dashboard/uploads/<%=RS_blog("img_produtoGRD")%>" alt="<%=RS_blog("nome_produto")%>">
          <div class="blog-title"><%=RS_blog("nome_produto")%></div>
          <div class="blog-button">
            <a class="button-link w-inline-block" href="post/<%=RS_blog("canonical")%>" title="<%=RS_blog("nome_produto")%>">
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

        <%
        RS_blog.movenext
        wend
        end if
        %>

      </div>
      <div class="slide-button vantagem-button">
        <a class="button-link w-inline-block" href="blog/"></a>

        <div class="button-text">ACESSE NOSSO BLOG</div>

      </div>
      <div class="flag-box-right flag-stripe-box flag-stripe-curta">
        <div class="stripe stripe-orange">
          <div class="stripe-point-box">
            <img class="point" src="/config/templateclube/images/point_60.svg" width="60">
          </div>
          <div class="stripe-fold-box">
            <img class="stripe-fold stripe-fold-righ w-preserve-3d" src="/config/templateclube/images/stripe_fold_grey.svg">
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="blog" id="faq">
    <div class="blog-container w-container">
      <div class="blog-header">
        <div class="linha-container">
          <div class="bola-cheia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-vazia dark"></div>
        </div>
        <h3 class="h3 h3-blog">Perguntas Frequentes</h3>
        <div class="linha-container">
          <div class="bola-vazia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-cheia dark"></div>
        </div>
      </div>
      <div class="blog-posts-wrapper" style="margin: 0;">

        <div class="faq">

        <%
        Set RS_faq = Server.CreateObject("ADODB.Recordset")
        RS_faq.CursorLocation = 3
        RS_faq.CursorType = 0
        RS_faq.LockType =  3

        RS_faq.Open "SELECT * FROM Help", Conexao

        i = 1
        while not RS_faq.eof
        %>

          <div class="pergunta <%if i=1 then%>select<%end if%>" name="pergunta<%=i%>"><%=RS_faq("nome_help")%></div>
          <div class="resposta <%if i=1 then%>select<%end if%>" id="resposta-pergunta<%=i%>"><%=RS_faq("descricao_help")%></div>

                    <%
        i = i + 1
        RS_faq.movenext
        wend
        %>

        </div>

      </div>


    </div>
  </div>

  <!--#INCLUDE FILE="barra-rodape.asp"-->

</body>
</html>
