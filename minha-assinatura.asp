<!DOCTYPE html>
<!--  Last Published: Sat Dec 03 2016 07:28:29 GMT+0000 (UTC)  -->
<html data-wf-page="582aedef2f37bac07c1f0e8c" data-wf-site="582aedef2f37bac07c1f0e8b">

<%pagina = "minha-assinatura"%>
<!--#INCLUDE FILE="barra-topo-estilos.asp"-->

<body>

  <!--#INCLUDE FILE="barra-topo.asp"-->

  <div class="blog" id="blog_id" style="    margin-top: 74px;">
    <div class="blog-container w-container">
      <div class="blog-header">
        <div class="linha-container">
          <div class="bola-cheia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-vazia dark"></div>
        </div>
        <h3 class="h3 h3-blog">Minha Conta</h3>
        <div class="linha-container">
          <div class="bola-vazia dark"></div>
          <div class="dark largura-como-funciona linha"></div>
          <div class="bola-cheia dark"></div>
        </div>
      </div>

      <div class="blog-posts-wrapper">

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="md_cadastro"></a>

            <div class="button-text">Meu Cadastro</div>

          </div>
        </div>

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="md_pedidos"></a>

            <div class="button-text">Pedidos</div>

          </div>
        </div>

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="md_envios"></a>

            <div class="button-text">Assinaturas</div>

          </div>
        </div>

      </div>

      <div class="blog-posts-wrapper" style="margin: 0 0 50px 0;">

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="md_alterarcartao"></a>

            <div class="button-text">Atualizar Cart&atilde;o</div>

          </div>
        </div>

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="md_contato_log"></a>

            <div class="button-text">Fale Conosco</div>

          </div>
        </div>

        <div class="blog-post-card" style="height: 100px;">
          <div class="funciona slide-button" style="width: 260px;">
            <a class="button-link w-inline-block w--current" id="alterar_senha"></a>

            <div class="button-text">Alterar Senha</div>

          </div>
        </div>

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

  <%session("sessionID") = ""%>

  <!--#INCLUDE FILE="barra-rodape.asp"-->

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

</body>
</html>
