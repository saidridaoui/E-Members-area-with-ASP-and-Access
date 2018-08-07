<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Nom    : Ridaoui
' Prénom : Said
'
' Description : Formulaire pour l'evoi du mot de passe par e-mail
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

on error resume next
%>

<!--#include file="include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / Password Oubli&eacute; ?</TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="default.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY background="images/fond.gif">
<BR><BR>
<CENTER>
<FORM action="recup_pwd.asp" method="POST">
<TABLE border="0" cellPadding="0" cellSpacing="0" width="400">
  <TR>
    <TD vAlign="top">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="2"><IMG alt="" height="21" width="11" src="images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Password Oubli&eacute; ? </DIV>
          </TD>
          <TD background="images/vertical.gif" rowSpan="3" width="2">
            <IMG src="images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol" width="2"></TD>
          <TD bgColor="#ffffff">
            <DIV align="center">
 	      <TABLE width="" border="0" cellspacing="1" cellpadding="0">
	        <TR>           
                  <%
                  if Request.QueryString("msg") = "1" then
                    msg = "! Un mail contenant votre login et votre mot de passe<BR>vient d'être envoyé à votre adresse email !"
                  else
                    msg = Request.QueryString("msg")
                  end if
                  %>
	          <TD height="40"><DIV align="center"><B><% =msg %></B></DIV></TD>
	        </TR>
	        <TR>
	          <TD>

  		    <TABLE width="78%" border="0" align="center" cellpadding="0" cellspacing="3">
		      <TR>
		        <TD><DIV align="center">Adresse Email </DIV></TD>
		      </TR>
		      <TR>
		        <TD>
			  <DIV align="center"><INPUT name="email" type="text" size="32"></DIV>
		        </TD>
 	              </TR>
	              <TR>
		        <TD><BR>
			  <DIV align="center"><INPUT type="submit" value="Valider" name="action"><DIV>
			</TD>
		      </TR>
		    </TABLE>

	          </TD>
                </TR>
              </TABLE>
	    </DIV>
          </TD>
        </TR>
        <TR>
          <TD><IMG alt="" height="12" src="images/cap.gif" width="11"></TD>
          <TD bgColor="#ffffff"></TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>
</FORM>
</CENTER>

<DIV align="center">
  <P>&nbsp;</P>
  <P><B><a href="index.asp">Identification </a></B>|
     <B><a href="inscription.asp">Inscription </a></B>
  </P>
</DIV>
<DIV align="center"><BR><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>

</BODY>
</HTML>
