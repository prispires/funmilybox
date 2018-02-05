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