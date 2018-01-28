<!--LISTAGEM DOS PLANOS-->
<section>
		<div id="assine">
			<div class="container">
				<div class="row">

					<div class="col-md-10 col-md-offset-1 col-sm-12">

						<h2>Planos</h2>
						<p>Escolha um dos planos a seguir e faça parte de nosso Clube de Assinaturas. </p>

						<div class="row">

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
                                <div class="col-md-4 col-sm-4">
                                    <div class="assine">
                                        <h3><%=RS_planos("nome_produto")%></h3>
                                        <big>R$<%=formatnumber(RS_planos("preco_unitario"))%></big> <small>/mês</small>

																				<div class="descplanos">
	                                        <%=RS_planos("descricao_produto")%>
																				</div>

                                        <hr />
                                        <a onclick="addcar('<%=RS_planos("codigo_produto")%>');" class="btn verde">ASSINAR </a>
                                        <input type="hidden" id="plano<%=i%>" name="plano<%=i%>" value="<%=RS_planos("nome_produto")%>">
                                        <input type="hidden" id="valor_plano<%=i%>" value="<%=FormatNumber(RS_planos("preco_unitario"))%>">
                                        <input type="hidden" id="peso_plano<%=i%>" value="<%=replace(RS_planos("peso"), ",",".")%>">


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
					</div>

					<div class="col-md-8 col-md-offset-2 col-sm-12">

                         <div class="share-group">
                                    <div class="share-first">Compartilhe em</div>
                                    <button class="btn btn-share btn-facebook" title="Compartilhe no seu Facebook"><i class="fa fa-facebook"></i></button>
                                    <button class="btn btn-share btn-twitter" title="Compartilhe no seu Twitter"><i class="fa fa-twitter"></i></button>
                                    <button class="btn btn-share btn-google-plus" title="Compartilhe no seu Google Plus"><i class="fa fa-google-plus"></i></button>
                                    <button class="btn btn-share btn-envelope" title="Convidar Amigos" id="md_indicacao"><i class="fa fa-envelope"></i></button>
                        </div>

                         <script type="text/javascript">
                                    url = document.location.href;
                                    nome = '<%=RS_Layout1("nome_site")%>';
                                    nome = nome.replace(" ", "+")
                                    nome = nome.replace("/", "")

                                    $('.btn-facebook').click(function() {
                                        window.open('http://www.facebook.com/sharer/sharer.php?u='+url+'&amp;title='+nome,'_blank', 'width=900, height=450');
                                    });
                                    $('.btn-google-plus').click(function() {
                                        window.open('https://plus.google.com/share?url='+url,'_blank', 'width=900, height=450');
                                    });
                                    $('.btn-twitter').click(function() {
                                        window.open('http://twitter.com/intent/tweet?status='+nome+'+'+url,'_blank', 'width=900, height=450');
                                    });
                        </script>



                        <div class="col-md-12 col-sm-12">
                            <div style="margin: 20px auto 0 auto;color:#fff; text-align:center; font-size:16px">
                            <strong>Aceitamos</strong><br>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-visa.png" width="53" height="42" alt="Pague com Visa"/>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-mastercard.png" width="53" height="42" alt="Pague com Mastercard"/>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-diners.png" width="53" height="42" alt="Pague com Diners"/>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-amex.png" width="53" height="42" alt="Pague com Amex"/>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-boleto.png" width="53" height="42" alt="Pague com boleto"/>
                            <img src="/config/templateclube/_imagens/bandeiras/icon-deposito-bancario.png" width="53" height="42" alt="Pague com deposito"/>

                            </div>
                        </div>

					</div>

				</div>
			</div>



			<div id="seu-box">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-sm-12 seuboxh2">
							<h2>SEU BOX - Você pode receber</h2>
							<p>Nela podemos enviar uma combinação de acessórios para você compor o seu look e arrasar.</p>
							<div class="itens">

	                        <%
	                        Set RS_receber = Server.CreateObject("ADODB.Recordset")
	                        RS_receber.CursorLocation = 3
	                        RS_receber.CursorType = 0
	                        RS_receber.LockType =  3

	                        RS_receber.Open "SELECT * FROM Parceiros WHERE tipo = 2 ORDER BY codigo_chave ASC", Conexao


	                        If NOT RS_receber.Eof Then

	                        while not RS_receber.eof

	                            Set RS_Moto_Foto_Detalhes = Server.CreateObject("ADODB.Recordset")
	                            RS_Moto_Foto_Detalhes.CursorLocation = 3
	                            RS_Moto_Foto_Detalhes.CursorType = 0
	                            RS_Moto_Foto_Detalhes.LockType =  3

	                            RS_Moto_Foto_Detalhes.Open "SELECT * FROM Parceiros_Foto WHERE codigo_pagina = '" & RS_receber("codigo_chave")  &"'", Conexao

	                                if not RS_Moto_Foto_Detalhes.eof then
	                                fotoparc = RS_Moto_Foto_Detalhes("foto")
	                                else
	                                fotoparc = ""
	                                end if
	                        %>

	                            <div><img src="/dashboard/uploads/<%=Replace(fotoparc, " ", "")%>" alt="<%=RS_receber("titulo")%>" /><%=RS_receber("titulo")%></div>

							<%
	                        RS_receber.movenext
	                        wend
	                        end if
	                        %>


							</div>
						</div>
					</div>
				</div>
			</div>


		</div>




</section>
