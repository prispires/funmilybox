<title>blog-section-home</title>
<!--<div class="blog" id="blog_id">
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
  </div>-->