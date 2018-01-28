<!DOCTYPE html>
<html data-wf-page="582aedef2f37bac07c1f0e8c" data-wf-site="582aedef2f37bac07c1f0e8b">

<%pagina = "institucional"%>
<!--#INCLUDE FILE="barra-topo-estilos.asp"-->

<body>

  <div class="body-wrapper">
    <div class="body-header">
      <!--#INCLUDE FILE="barra-topo.asp"-->
    </div>

    <%
  	Set RS_paginas = Server.CreateObject("ADODB.Recordset")
  	RS_paginas.CursorLocation = 3
  	RS_paginas.CursorType = 0
  	RS_paginas.LockType =  3

  	RS_paginas.Open "SELECT * FROM Paginas WHERE codigo_chave = '"&Replace(LimpaLixo_Prod(Request("id")), "'", "''")&"' ORDER BY codigo_chave DESC", Conexao

  	If RS_paginas.Eof Then
  		Response.Redirect("/")
  	end if
  	%>

    <div class="body-content">
      <div class="content-wrapper w-container">
        <div class="content-box-full content-left-box">
          <div class="blog-header-interno">
            <div class="header-wrapper">
              <h1 class="h1-institucional h1-interno"><%=RS_paginas("titulo")%></h1>
              <div class="linha-interna"></div>
            </div>
          </div>
          <div class="texto-institucional w-richtext">
            <%=RS_paginas("texto")%>
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
    <script src="_wizard/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="_wizard/js/jquery.validate.min.js"></script>
    <script src="_wizard/js/wizard.js"></script>

</body>
</html>
