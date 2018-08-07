<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page liste des contacts
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="index.asp">Liste de mes Contacts</a></TD>
    <TD width="31%"><DIV align="right"><SCRIPT LANGUAGE="JavaScript">document.write(messageDate);</SCRIPT></DIV></TD>
  </TR>
</TABLE>

<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
  <TR height="10">
    <TD></TD>
  </TR>
  <TR>
    <TD vAlign="top" width="4%"></TD>
    <TD vAlign="top">

      <!--#include file="../include/menu.inc.asp"-->

    </TD>
    <TD width="4%"><IMG alt="" src="../images/trans.gif" width="15"></TD>
    <TD align="left" vAlign="top" width="84%">
    <%
    '**** PARTIE CENTRALE ****
    %>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Liste de mes Contacts</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	  <BR>
	  
	    <TABLE width="100%"  border="0" cellspacing="3" cellpadding="0">
              <TR>
                <TD>
                  <B>Voici la liste de tous vos contacts actuels. </B><BR>
                  <SPAN>Vous pouvez supprimer ou envoyer un message &agrave; vos contacts.</SPAN>
                </TD>
              </TR>
              <TR>
                <TD height="50" valign="bottom"><BR>
		  <DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV><BR>
	  	
                  <!--#include file="../auth/connect.asp"-->
                  <%
                  SQL = "SELECT * FROM CONTACT WHERE (((CONTACT.ctLogin)='" & session("user") & "') AND ((CONTACT.ctValide)=True)) ORDER BY ctLogin"
                  SET rSC = Connect.Execute(SQL)

                  If rSC.EoF Then  ' Test si il y a des données à afficher
                    response.write "<DIV align=center><B>Vous n'avez aucun contact actuellement</B></DIV><BR>"
                  Else

                    While not rSC.EoF
                    %>
                      <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
	                <TR>
	                <%
	                'regarde si l'utilisateur est en ligne
			%>
			
	                  <TD width="5%" align="center"> <img src="../images/connect.gif" width="10" height="10" border="0" alt="OnLine"></TD>			
		          <TD width="55%"><a href="#" onClick="window.open('../auth/profil.asp?User=<% =rSC("ctFriend") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)"><% =rSC("ctFriend") %></a></TD>
		          <TD width="22%"><a href="../messagerie/index.asp?A=<% =rSC("ctFriend") %>">Envoyer un Message</a></TD>
		          <TD width="18%"><a href="contact.asp?A=contact_delete&contact=<% =rSC("ctFriend") %>" onClick="return confirm('\nDemande de confirmation ?');">Supprimer</a></TD>
		        </TR>
                      </TABLE>
                    <%
                    rSC.MoveNext
	            Wend
                  End if

                Connect.Close
                Set Connect=Nothing
                %>
            
              <BR>
              </TD>
            </TR>
          </TABLE>	
          
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->
