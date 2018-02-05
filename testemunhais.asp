<!--<div class="testemunhais">
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
  </div>-->