<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page rechercher un contact
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="search.asp">Rechercher un Contact</a></TD>
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
            <DIV class="boxtitle">Rechercher un Contact</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	  <BR>

            <FORM action="search.asp?A=search" method="POST">
            
            <TABLE width="100%"  border="0" cellspacing="3" cellpadding="0">
              <TR>
                <TD><DIV align="center">Entrer au minimum 1 caract&egrave;re </DIV></TD>
              </TR>
              <TR>
                <TD><DIV align="center"><INPUT name="search" type="text" value="" size="40" maxlength="20"></DIV></TD>
              </TR>
              <TR>
                <TD><DIV align="center"><INPUT type="submit" value="Rechercher" name="action"></DIV></TD>
              </TR>
            </TABLE>

	    </FORM>

	    <DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV>
	    
	    <%
	    if Request.Querystring("A") = "search" then
              if Request.Form("search") = "" then
                Response.redirect "search.asp?msg=!+Le+champ+est+vide+!"
              End if
	    %>
	
            <BR>
            <DIV align="center">
            <TABLE width="80%"  border="0" cellspacing="2" cellpadding="0">

            <!--#include file="../auth/connect.asp"-->
  	    <%
  	     
            SQL = "SELECT USER.uLogin FROM [USER] GROUP BY USER.uLogin HAVING (((USER.uLogin) Like '%" & Request.Form("search") &"%')) ORDER BY USER.uLogin   "
            SET rSC = Connect.Execute(SQL)

            alternate = "2"

            if rSC.EoF Then  ' Test si il y a des données à afficher
            %>
            <B><font color="#CC0000">! Aucun membres ne correspond à votre recherche !</font></B><BR>
            <%
            Else
            
            While not rSC.EoF%>
            <%
             If alternate = "1" Then
               color = "#ffffff"
               alternate = "2"
             Else
               color = "#efefef"
               alternate = "1"
             End if
            %>
              <TR>
                <TD bgcolor="<% =color %>" align="left"><B><% =rSC("uLogin")%></B></TD>
                <TD width="10%" align="center"></TD>
                <TD>
		  <A HREF="#" onClick="window.open('../auth/profil.asp?User=<% =rSC("uLogin") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)">Voir le Profil</a> |
		  <A HREF="../contact/ajout.asp?pseudo=<% =rSC("uLogin") %>">Ajouter &agrave; mes contacts</a>
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
	    
	    <%
	    End if
            %>	

	  <BR>	
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

