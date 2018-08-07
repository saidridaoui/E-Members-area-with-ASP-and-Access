<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : NEWS
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>
	      <CENTER><B><% = Request.QueryString("msg2") %></B></CENTER><BR>
              <!--#include file="../auth/connect.asp"-->
  	      <%
              SQL = "SELECT * FROM NEWS ORDER BY nDate DESC"
              SET rSC = Connect.Execute(SQL)

              if rSC.EoF then  ' Test si il y a des données à afficher
                response.write "<BR><DIV align=center><B>Aucun news dans la base de données</B></DIV><BR>"
              else

              While not rSC.EoF
              %>
              
              <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
                <TR>
                  <TD width="50%"><STRONG><% =rSC("nTitre") %></STRONG></TD>
                  <TD><EM>(<% =rSC("nAuteur") %>)</EM> <% =rSC("nDate") %></TD>
                </TR>
                <TR>
                  <TD colspan="2"><% =rSC("nContenu") %></TD>
                </TR>
                <TR>
                  <TD colspan="2" align="right"><a href="admin.asp?A=news&A2=modif&nID=<% =rSC("nID_News") %>">modifier</a> | <a href="admin.asp?A=news&A2=supp&nID=<% =rSC("nID_News") %>" onClick="return confirm('\nDemande de confirmation ?');">Supprimer</a></TD>
                </TR>
              </TABLE>
	      <BR>

	      <%
	      rSC.MoveNext
	      Wend

              End if

              Connect.Close
              Set Connect=Nothing

              
              Select Case Request.QueryString("A2")

                Case "ajout" :
                
                  session("titre")  = Request.Form("tit")
                  session("contenu")= Request.Form("cont")	
	
                  if Request.Form("tit") = "" OR Request.Form("cont") = "" then
                    Response.redirect "admin.asp?A=news&msg=!+Tous+les+champs+sont+obligatoire+!"
                  end if
                
                  %>
                  <!--#include file="../auth/connect.asp"-->
                  <%
                  Set Record = Server.CreateObject("ADODB.Recordset")
                  Record.Open "NEWS",Connect,2,2,2
                  Record.addNew

                  Record.Fields("nTitre")   = session("titre")
                  Record.Fields("nAuteur")  = session("user")
                  Record.Fields("nContenu") = session("contenu")
                  Record.Fields("nDate")    = Date

                  Record.Update

                  Record.Close
                  Set Record=Nothing

                  Connect.Close
                  Set Connect=Nothing
                
                  session("titre")  = ""
                  session("contenu")= ""
                  
                  Response.redirect "admin.asp?A=news&msg=!+News+ajouté+!"
	        
	        
                Case "modif" :
                %>
                
                  <HR color="<% =cadre_color %>">
                  <!--#include file="../auth/connect.asp"-->
                  <%
                  SQL = "SELECT * FROM NEWS WHERE nID_News=" & Request.Querystring("nID") & " "
                  SET rSC = Connect.Execute(SQL)
		  %>

                  <FORM action="admin.asp?A=news&A2=modif&nID=<% =rSC("nID_News") %>&A3=valid" method="POST">
	
                  <DIV align="center"><B><% = Request.QueryString("msg3") %></B></DIV><BR>
	
	          <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
                    <TR>
                      <TD width="50%"><B>Titre : </B><BR><INPUT name="tit" type="text" size="25" maxlength="35" value="<% =rSC("nTitre") %>"> *</TD>
                      <TD><EM>(<% =rSC("nAuteur") %>)</EM> <% =rSC("nDate") %></TD>
                    </TR>
                    <TR>
                      <TD colspan="2"><B>Contenu : </B><BR>
		        (ne pas faire des mots trop long,)
		        <BR><INPUT name="cont" type="text" size="80%" maxlength="240" value="<% =rSC("nContenu") %>"> *
		      </TD>
                    </TR>
                    <TR>
                      <TD colspan="2" width="20%"><DIV align="right"><INPUT type="submit" value="Modifier" name="action"></DIV></TD>
                    </TR>
                  </TABLE>

                  </FORM>

                  <%
                  Connect.Close
                  Set Connect=Nothing
                  
		  if Request.Querystring("A3") = "valid" then
		  
                    if Request.Form("tit") = "" OR Request.Form("cont") = "" then
                      Response.redirect "admin.asp?A=news&A2=modif&nID="&Request.Querystring("nID")&"&msg3=!+Tous+les+champs+sont+obligatoire+!"
                    end if
		  
                    %>
                    <!--#include file="../auth/connect.asp"-->
                    <%
                    Set RS = Server.CreateObject("ADODB.Recordset")
                    SQL= "SELECT * FROM NEWS WHERE nID_News=" & Request.Querystring("nID") & " "
                    RS.Open SQL,Connect,1,2,1	
	
                    RS("nTitre") = Request.Form("tit")
                    RS("nContenu")  = Request.Form("cont")
	
                    RS.UpdateBatch
                    RS.Close
                    Set RS = Nothing

                    Connect.Close
                    Set Connect = Nothing
		
                    Response.redirect "admin.asp?A=news&msg2=!+Modification+OK+!"
		  
		  end if
                
                Case "supp" :
                
                  %>
                  <!--#include file="../auth/connect.asp"-->
                  <%

                  SQL = "DELETE FROM NEWS WHERE nID_News=" & Request.Querystring("nID") & " "
                  Connect.Execute(SQL)

                  Connect.Close
                  Set Connect=Nothing
                  
                  Response.redirect "admin.asp?A=news&msg2=!+News+supprimé+!"

              End select
%>
