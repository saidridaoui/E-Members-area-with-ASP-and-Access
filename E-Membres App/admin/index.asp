<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Nom    : Ridaoui
' Prénom : Said
'
' Description : Formulaire de connexion pour le compte administrateur
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

on error resume next

'Test si l'utilisateur est déjà authentifié
if Session("Good_ADMIN") = True then
Response.Redirect("admin.asp")
end if
%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / Identification ADMINISTRATEUR</TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY background="../images/fond.gif">

<%
' Si create = 1 c'est qu'on a déjà essayé de créer le cookie
If Request.QueryString("create") = "1" Then
     ' Si le cookie n'est pas crée, c'est que le navigateur client ne les accepte pas
     If Request.Cookies("test") <> "ok" Then
          Response.Write("<CENTER><BR><B>Vous n'acceptez pas les cookies !<BR>Les options de votre navigateur que vous utilisez sont configurées<BR> pour désactiver les cookies. Pour ce connecter, vous devez activer les cookies.</B><CENTER>")
     Else
          'Response.Write("Vous acceptez les cookies")
     End If

Else
     ' Si create <> 1, on essai de créer le cookie
     Response.Cookies("test") = "ok"
     Response.Redirect "index.asp?create=1&Error="& Request.QueryString("Error")&""
End If
%>
<CENTER>
<BR><B>CONNEXION ADMINISTRATEUR <% =titre %></B><BR><BR>

<FORM action="login.asp" method="POST">
<TABLE border="0" cellPadding="0" cellSpacing="0" width="400">
  <TR>
    <TD vAlign="top">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="2"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Identification</DIV>
          </TD>
          <TD background="../images/vertical.gif" rowSpan="3" width="2">
            <IMG src="../images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol" width="2"></TD>
          <TD bgColor="#ffffff">
            <DIV align="center">
 	      <TABLE width="" border="0" cellspacing="1" cellpadding="0">
	        <TR>
	          <TD height="40"><DIV align="center"><B><% = Request.QueryString("Error") %></B></DIV></TD>
	        </TR>
	        <TR>
	          <TD>
	            <TABLE width="78%" border="0" align="center" cellpadding="0" cellspacing="3">
	              <TR>
	                <TD height="20"><DIV align="center">Login</DIV></TD>
	              </TR>
                      <TR>
		        <TD>
	                  <INPUT name="login" type="text" size="32">
	                </TD>
	              </TR>
                      <TR>
		        <TD height="20" align="center"><DIV align="center">Password</DIV></TD>
                      </TR>
		      <TR>
		        <TD>
			  <INPUT name="password" type="password" size="32">
	                </TD>
	              </TR>
		      <TR>
		        <TD><BR>
	                  <DIV align="center"><INPUT type="submit" value="Connexion" name="action"></DIV>
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
          <TD><IMG alt="" height="12" src="../images/cap.gif" width="11"></TD>
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
  <P><B><a href="../index.asp"><% =titre %></a></B>
  </P>
</DIV>
<DIV align="center"><BR><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>
  
</BODY>
</HTML>
