<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page validation d'un contact
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="valider.asp">Valider un Contact</a></TD>
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
            <DIV class="boxtitle">Valider un Contact</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	  <BR>

	    <TABLE width="100%"  border="0" cellspacing="3" cellpadding="0">
              <TR>
                <TD><STRONG>Vous avez la possibilit&eacute; de les accepter ou des les refuser</STRONG>
		</TD>
              </TR>
              <TR>
                <TD>
                <BR>
                  
		  <DIV align="center">
  	
                  <TABLE width="80%"  border="0" cellspacing="1" cellpadding="0">
                  
                  <!--#include file="../auth/connect.asp"-->
  	          <%
                  SQL = "SELECT * FROM CONTACT WHERE ctLogin='" & session("user") & "' ORDER BY ctFriend"
                  SET rSC = Connect.Execute(SQL)

                  alternate = "2"

                  if rSC.EoF Then  ' Test si il y a des données à afficher
                  %>
                  <B>Vous n'avez aucun contact en attente actuellement</B></DIV><BR>
                  <%
                  Else

                  While not rSC.EoF
                  
                  if alternate = "1" then
                    color = "#ffffff"
                    alternate = "2"
                  else
                    color = "#efefef"
                    alternate = "1"
                  end if
                  %>
                  
                    <TR>
	              <TD width="4%">
                      <%
		      if ((rSC("ctIgnor")) = False) AND ((rSC("ctValide")) = False) then
		      %>
                        <DIV align="center"><img src="../images/att.gif" ></DIV>
		      <%		
		      End if
		      
		      if rSC("ctIgnor") = True then
		      %>
                        <DIV align="center"><img src="../images/deconnect.gif"></DIV>
		      <%		
		      End if
		      
		      if rSC("ctValide") = True then
		      %>
                        <DIV align="center"><img src="../images/connect.gif"></DIV>
		      <%		
		      End if		
		      %>	
	              
		      </TD>
                      <TD bgcolor="<% =color %>"><A HREF="#" onClick="window.open('../auth/profil.asp?User=<% =rSC("ctFriend") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)"><% =rSC("ctFriend") %></a></TD>
                      <TD bgcolor="<% =color %>"> <% =rSC("Date") %></TD>
	              <TD align="right" bgcolor="<% =color %>">

                      <%
		      if ((rSC("ctIgnor")) = False) AND ((rSC("ctValide")) = False) then
		      %>
		        <a href="contact.asp?A=contact_valider&friend=<% =rSC("ctFriend") %>">Valider</a>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        <a href="contact.asp?A=contact_refuser&friend=<% =rSC("ctFriend") %>">Refuser</a>
		      <%		
		      End if


		      if ((rSC("ctValide")) = True) then
		      %>
		        <a href="contact.asp?A=contact_refuser&friend=<% =rSC("ctFriend") %>">Refuser</a>
		      <%
		      End if
		      if ((rSC("ctIgnor")) = True) then
		      %>
		      	<a href="contact.asp?A=contact_valider&friend=<% =rSC("ctFriend") %>">Valider</a>
		      <%
		      End if
	              %>	

		      </TD>
                    </TR>
                    
                  <%
                  rSC.MoveNext
                  Wend
	
	          End if
	
	          Connect.Close
                  Set Connect=Nothing
	          %>
                    
                  </TABLE>
                  
                  </DIV>
                  
                </TD>
              </TR>
	    </TABLE>
	    
	  <BR>
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

