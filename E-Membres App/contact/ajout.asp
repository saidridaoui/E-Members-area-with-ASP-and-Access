<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour ajouter des contacts
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="ajout.asp">Ajouter un Contact</a></TD>
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
            <DIV class="boxtitle">Ajouter un Contact</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	
            <FORM action="contact.asp?A=ajout_contact" method="POST">
            
            <TABLE width="100%" border="0" cellpadding="3" cellspacing="0">
	      <TR>
	        <TD>
                  <DIV align="center">Saisissez le pseudonyme d'un membre</DIV>
                </TD>
              </TR>
              <TR>
                <TD colspan="2">Pour ajouter un contact &agrave; votre liste, entrer simplement le pseudonyme d'un membre. Celui-ci sera visible dans votre liste apr&egrave;s son acceptation ! </TD>
              </TR>
              <TR>
                <TD height="40"><DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV>
                <BR>
		  <DIV align="center">
                  <INPUT name="pseudo" type="text" value="<% =Request.Querystring("pseudo") %>" size="40">
                  </DIV></TD>
                    <TD><DIV align="center"><INPUT type="submit" value="Ajouter" name="action"></DIV></TD>
                  </TR>
                  <TR>
                    <TD colspan="2"><B>N.B. :</B> Utiliser le moteur de recherche ou la liste des membres inscrits afin de trouver un contact !</TD>
                  </TR>
		</TD>
              </TABLE>

              </FORM>
              
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

