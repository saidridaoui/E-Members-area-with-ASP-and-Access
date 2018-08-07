<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Utilsateur connectés
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %></TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY background="../images/fond.gif">

<CENTER>
<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">

  <!--#include file="connect.asp"-->
  <%
  'affichage des utilisateurs logués
  SQL = "SELECT CONNEXION.cLogin, USER.uLogin, USER.uSexe FROM CONNEXION, [USER] WHERE CONNEXION.cLogin = USER.uLogin ORDER BY CONNEXION.cLogin"
  SET rSC = Connect.Execute(SQL)

  While not rSC.EoF
  %>
  <TR>
    <TD width="2%">
    <%
    if rSC("uSexe") = "Homme" then
      response.write "<img src=../images/homme.gif>"
    end if

    if rSC("uSexe") = "Femme" then
      response.write "<img src=../images/femme.gif>"
    end if
    %>
    </TD>
    <TD align="left"><A HREF="#" onClick="window.open('profil.asp?User=<% =rSC("cLogin") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)"><% =rSC("cLogin") %></a></TD>
    
  </TR>
  
  <%
  rSC.MoveNext
  Wend

  Connect.Close
  Set Connect=Nothing
  %>
  
</TABLE>
</CENTER>

<BR>
<DIV align="center"><a href="javascript:window.close();">Fermer</a></DIV>

<DIV align="center"><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>

</BODY>
</HTML>


