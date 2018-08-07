<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : A propos
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>A PROPOS DE <% =titre %></TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY background="../images/fond.gif">

<TABLE width="400" height="250"  border="0" align="center" cellpadding="0" cellspacing="6">
  <TR>
    <TD><BR></TD>
  </TR>
  <TR>
    <TD><STRONG>Intitul&eacute; :</STRONG> <% =titre %> <BR>
        <STRONG>Version :</STRONG> 1.0 </TD>
  </TR>
  <TR>
    <TD><DIV align="center">
      <TEXTAREA name="" cols="45" rows="5"><% =titre %> est un Espace Membre. Il intègre une messagerie interne, un gestionnaire de contacts, livre d'or, ect... Amusez vous bien..</TEXTAREA>
      <BR></DIV>
    </TD>
  </TR>
</TABLE>

<BR>
<DIV align="center"><a href="javascript:window.close();">Fermer</a></DIV>

<DIV align="center"><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>

</BODY>
</HTML>
