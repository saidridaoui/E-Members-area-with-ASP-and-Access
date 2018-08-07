
              <!--#include file="connect.asp"-->
              <%
              'regarde si l'utilisateur a deja mis une photo sur son profil
              SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "' "
              SET rSC = Connect.Execute(SQL)
                  
              photo = rSC.Fields("uPhoto")

              if photo = "-" then
                response.write "<b>Vous n'avez pas encore ajouté une photo ou un avatar à votre profil.</b><br><br>"
              else 
                response.write ""                   
              end if
              
              Connect.Close
              Set Connect=Nothing

              %>
              <TABLE width="250"  border="0" cellspacing="0" cellpadding="3">
                <TR>
                  <TD align="left"><a href="../messagerie/msg_reception.asp">Boîte de Réception</a></TD>
                  <TD>:</TD>
                  <TD><B><% =nbr_msg %></B></TD>
                </TR>
                <TR>
                  <TD align="left"><a href="../messagerie/msg_envoyee.asp">Messages Envoyés</a></TD>
                  <TD>:</TD>
                  <TD><B><% =nbr_msg_envoyee %></B></TD>
                </TR>
                <TR>
                  <TD align="left"><a href="../messagerie/msg_reception.asp">Nouveau Message(s)</a></TD>
                  <TD>:</TD>
                  <TD><B><% =nbr_msg_new %></B></TD>
                </TR>
                <TR>
                  <TD align="left">Membres inscrits </TD>
                  <TD>:</TD>
                  <TD><B><% =tot_user %></B></TD>
                </TR>
              </TABLE>

              <!--#include file="connect.asp"-->
              <%
              'IP du visiteur
              IP = request.serverVariables("REMOTE_ADDR")

              'Suppression des anciens
              SQL = "DELETE FROM CONNEXION WHERE cDate_connexion < Date()"
              Connect.Execute(SQL)


              'Stockage du hit courant
              SQL = "SELECT * FROM CONNEXION WHERE cIP='" & IP & "' "
              SET rSC = Connect.Execute(SQL)

              'test si l'utilisateur existe
              if rSC.EOF Then
                %>
		<!--#include file="../auth/connect.asp"-->
	        <%
	        Set Record = Server.CreateObject("ADODB.Recordset")
	        Record.Open "CONNEXION",Connect,2,2,2
	        Record.addNew
		
	        'Mise à jour
	        Record("cLogin") = session("user")
	        Record("cIP") = IP
                Record("cDate_connexion") = Date()
	
		Record.update
	
		Record.close

              End if

	      Set Record=Nothing


              SQL = "SELECT COUNT(*) AS CompteDeIP FROM CONNEXION"
              SET rSC = Connect.Execute(SQL)

              'Nombre de visiteurs en ligne
              online = rSC.Fields("CompteDeIP")


              'Déconnnexion
	      Connect.Close
              Set Connect=Nothing

              'Affichage
              %>

