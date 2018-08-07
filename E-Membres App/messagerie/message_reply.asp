
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour répondre au message
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt;
    
    <%
    if Request.Querystring("A") = "msg_reception" then
    %>
      <a href="msg_reception.asp">Boîte de Réception</a> &gt; <a href="message.asp?A=msg_reception&msg_ID=<% =Request.Querystring("msg_ID") %>">Lecture message</a>
    <%
    end if
    %>
    
    </TD>
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
            <DIV class="boxtitle">Message</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	
            <%
            Select Case Request.QueryString("A")

              Case "msg_reception" : 'Messages recus
	        %>	
	
	        <!--#include file="../auth/connect.asp"-->
	        <%
	        SQL = "SELECT * FROM MESSAGE WHERE mID_message=" & Request.Querystring("msg_ID")& " "
	        SET rSC = Connect.Execute(SQL)
	
	        If rSC.EoF Then  ' Test si il y a des données à afficher
	          response.write "<BR><DIV align=center><B>Erreur !</B></DIV><BR>"
	        Else
	        %>
	        
	        <FORM action="reply_msg_verif.asp?A=msg_reception&A2=<% =Request.Querystring("A2") %>&msg_ID=<% =Request.Querystring("msg_ID") %>" method="POST">
	
                <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
                  <TR>
                    <TD height="40" colspan="2"><DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV></TD>
                  </TR>
                  <TR>
                    <TD></TD>
                    <TD><INPUT name="A" type="hidden" value="<% =rSC("mDE") %>" size="20" maxlength="19"></TD>
                  </TR>
                  <TR>
                    <TD>A : </TD>
                    <TD><INPUT disabled name="" type="text" value="<% =rSC("mDE") %>" size="20" maxlength="19"></TD>
                  </TR>
                  <TR>
                    <TD>Date : </TD>
                    <TD><INPUT disabled name="dat" type="text" value="<% =date %><% Response.Write " " %><% =time %>" size="20"></TD>
                  </TR>
                  <TR>
                    <TD>Objet : </TD>
                    <TD><INPUT name="objet" type="text" value="RE : <% =rSC("mObjet") %>" size="30" maxlength="50"></TD>
                  </TR>
                  <TR>
                    <TD valign="top">Message : </TD>
                    <TD><TEXTAREA name="message" cols="40" rows="10"><% Response.write VbCrlf %><% Response.write VbCrlf %>----------------------------------------<% Response.write VbCrlf %><% =Replace(rSC("mMessage"), "<br>", VbCrlf )%></TEXTAREA></TD>
                  </TR><%'=Replace(rSC("mMessage"), VbCrlf, "<br>")%>
                  <TR>
                    <TD height="35" colspan="2">
		      <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <TR>
                          <TD width="5%"><INPUT name="save" type="checkbox" value="ok"></TD>
                          <TD width="61%">Sauvegarder dans les &quot;<em>Messages Envoy&eacute;s</em>&quot;</TD>
                          <TD width="34%" align="right">
                            <INPUT type="hidden" name="auteur" value="<% =session("user") %>">
                            <INPUT type="submit" value="Envoyer" name="action" >
                          </TD>
                        </TR>
                      </TABLE>
                    </TD>
                  </TR>
                </TABLE>

                </FROM>	
		
                <%
	        End if
	        
	        Connect.Close
	        Set Connect=Nothing	


              Case Else : 'autre choix erreur
                Response.redirect "../auth/index.asp"
            End select
	    %>
	    
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>
			
<!--#include file="../include/pied.inc.asp"-->

