<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Entete
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

on error resume next

'Test si l'utilisateur est déjà authentifié
if Session("Good") = False or IsNull (Session("Good")) = True then
Response.Redirect("../index.asp")
end if
%>

<!--#include file="config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> </TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript">
navvers = navigator.appVersion.substring(0,1);
if (navvers > 3)
	navok = true;
else
	navok = false;

today = new Date;
jour = today.getDay();
numero = today.getDate();
if (numero<10)
	numero = "0"+numero;
mois = today.getMonth();
if (navok)
	annee = today.getFullYear();
else
	annee = today.getYear();
TabJour = new Array("Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi");
TabMois = new Array("janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre");
messageDate = TabJour[jour] + " " + numero + " " + TabMois[mois] + " " + annee;
</SCRIPT>

</HEAD>

<BODY background="../images/fond.gif">

<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
  <TR>
    <TD><IMG align="middle" border="0" src="../images/logotthb1.gif"></TD>
    <TD>
      <CENTER><IMG align="middle" border="0" src="../images/bani.gif"></CENTER>
    </TD>
    <TD align="middle"></TD>
  </TR>
  <TR>
    <TD align="middle" height="28" background="../images/logotthb2.gif"><B><% =titre %></B></TD>
    <TD background="../images/bande1b.gif" colSpan="2" height="21" width="100%">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD height="18" width="88"></TD>
          <TD width="14%"></TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>

