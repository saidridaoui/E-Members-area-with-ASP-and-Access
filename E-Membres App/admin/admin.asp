<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page de l'administrateur
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

on error resume next

'Test si l'utilisateur est déjà authentifié
if Session("Good_ADMIN") = False or IsNull (Session("Good_ADMIN")) = True then
  Response.Redirect("index.asp")
end if

%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / ADMINISTRATEUR </TITLE>
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
    <TD vAlign="bottom"><IMG align="middle" border="0" src="../images/logotthb1.gif"></A></TD>
    <TD>
      <CENTER><IMG align="middle" border="0" src="../images/bani.gif"></CENTER>
    </TD>
    <TD align="middle"></TD>
  </TR>
  <TR>
    <TD><IMG align="middle" border="0" src="../images/logotthb2.gif"></TD>
    <TD background="../images/bande1b.gif" colSpan="2" height="21" width="100%">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD height="18" width="88"></TD>
          <TD width="14%"><DIV align="center" class="header"><FONT color="#ffffff"></FONT></DIV></TD>
          <TD width="14%"><DIV align="center" class="header"><FONT color="#ffffff"></FONT></DIV></TD>
          <TD width="14%"><DIV align="center" class="header"><FONT color="#ffffff"></FONT></DIV></TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>


<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><DIV align="right"><SCRIPT LANGUAGE="JavaScript">document.write(messageDate);</SCRIPT></DIV></TD>
  </TR>
</TABLE>

<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
  <TR height="10">
    <TD></TD>
  </TR>
  <TR>
    <TD vAlign="top" width="4%"></TD>
    <TD vAlign="top">


      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">ADMINISTRATEUR</DIV>
          </TD>
          <TD background="../images/vertical.gif" rowSpan="3">
            <IMG src="../images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"></TD>
          <TD bgColor="#ffffff">
            <%
	    ' Bloc: Boite section de gauche
	    %>
            <TABLE border="0" cellSpacing="0" width="194">
              <TR>
                <TD width="14%"></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="admin.asp">Accueil</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD></TD>
                <TD><BR></TD>
              </TR>
              <TR>
                <TD width="14%"></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="admin.asp?A=news">News</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="admin.asp?A=user">User</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="admin.asp?A=admin">Admin</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD></TD>
                <TD><BR></TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/exit.gif" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="logout.asp">D&eacute;connexion</a></DIV>
                </TD>
              </TR>
            </TABLE>
            <%
	    ' Fin Bloc: Boite section de gauche
	    %>
          </TD>
        </TR>
        <TR>
          <TD><IMG alt="" height="12" src="../images/cap.gif" width="11"></TD>
          <TD bgColor="#ffffff"></TD>
        </TR>
        <TR>
          <TD></TD>
          <TD><B>Session : <% response.write session("user") %></B></TD>
        </TR>
        <%
	' Fin Bloc: Menu section
	%>
        <TR>
          <TD><BR></TD>
        </TR>
      </TABLE>


    </TD>
    <TD width="4%"><IMG alt="" src="../images/trans.gif" width="15"></TD>
    <TD align="left" vAlign="top" width="84%">

      <%
      '**** PARTIE CENTRALE ****
      %>


      <!--#include file="centre.asp"-->


      <%
      '**** FIN PARTIE CENTRALE ****
      %>

    <BR>
    </TD>
    <TD><IMG alt="" height="1" src="../images/trans.gif" width="4%"></TD>
    <TD width="4%"><IMG src="../images/trans.gif" width="15"></TD>
  </TR>
</TABLE>
<DIV align="center">
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>
</BODY>
</HTML>


