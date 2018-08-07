
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour la lecture des messages
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
    
    if Request.Querystring("A") = "msg_envoyee" then
    %>
      <a href="msg_envoyee.asp">Messages Envoyés</a> &gt; <a href="message.asp?A=msg_envoyee&msg_ID=<% =Request.Querystring("msg_ID") %>">Lecture message</a>
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

		if Request.Querystring("on") = "False" then
		%>
	        <!--#include file="../auth/connect.asp"-->
	        <%
	        Set RS = Server.CreateObject("ADODB.Recordset")
                SQL= "SELECT * FROM MESSAGE WHERE mID_message=" & Request.Querystring("msg_ID")& " "
                RS.Open SQL,Connect,1,2,1	
	        
	        RS("mRead_message") = True
	        
                RS.UpdateBatch
                RS.Close
                Set RS = Nothing

                Connect.Close
                Set Connect = Nothing
                
		End if	
                %>	
                
	        <!--#include file="../auth/connect.asp"-->
	        <%
	        SQL = "SELECT * FROM MESSAGE WHERE mID_message=" & Request.Querystring("msg_ID")& " "
	        SET rSC = Connect.Execute(SQL)
	
	        If rSC.EoF Then  ' Test si il y a des données à afficher
	          response.write "<BR><DIV align=center><B>Erreur !</B></DIV><BR>"
	        Else
	        %>
	
	          <TABLE width="100%"  border="0" cellspacing="3" cellpadding="0">
		    <TR>
		      <TD><STRONG>Envoyée le : </STRONG></TD>
		      <TD><% =rSC("mDate") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>A : </STRONG></TD>
		      <TD><% =rSC("mA") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>Objet : </STRONG></TD>
		      <TD><% =rSC("mObjet") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>Message : </STRONG></TD>
		      <TD>&nbsp;</TD>
		    </TR>
		    <TR>
		      <TD colspan="2"><BR><% =Replace(rSC("mMessage"), VbCrlf, "<br>") %></TD>
		    </TR>
		    <TR>
		      <TD colspan="2" align="right"><BR><DIV align="right"><a href="msg_reception.asp">Retour</a> | <a href="message_reply.asp?A=msg_reception&A2=<% =rSC("mA") %>&msg_ID=<% =Request.Querystring("msg_ID") %>">R&eacute;pondre</a> | <a href="delete.asp?A=msg_delete&A2=msg_reception&msg_ID=<% =Request.Querystring("msg_ID") %>">Supprimer le message</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV></TD>
		    </TR>	
		  </TABLE>
		
		  <%
	        End if

	        Connect.Close
	        Set Connect=Nothing

              Case "msg_envoyee" : 'Messages envoyee
	        %>	
	
	        <!--#include file="../auth/connect.asp"-->
	        <%
	        SQL = "SELECT * FROM MESSAGE_ENVOYEE WHERE mID_message=" & Request.Querystring("msg_ID") & " "
	        SET rSC = Connect.Execute(SQL)
	
	        If rSC.EoF Then  ' Test si il y a des données à afficher
	          response.write "<BR><DIV align=center><B>Erreur !</B></DIV><BR>"
	        Else
	        %>
	
	          <TABLE width="100%"  border="0" cellspacing="3" cellpadding="0">
		    <TR>
		      <TD><STRONG>Envoyée le : </STRONG></TD>
		      <TD><% =rSC("mDate") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>A : </STRONG></TD>
		      <TD><% =rSC("mA") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>Objet : </STRONG></TD>
		      <TD><% =rSC("mObjet") %></TD>
		    </TR>
		    <TR>
		      <TD><STRONG>Message : </STRONG></TD>
		      <TD>&nbsp;</TD>
		    </TR>
		    <TR>
		      <TD colspan="2"><BR><% =Replace(rSC("mMessage"), VbCrlf, "<br>") %></TD>
		    </TR>
		    <TR>
		      <TD colspan="2" align="right"><BR><DIV align="right"><a href="msg_envoyee.asp">Retour</a> | <a href="delete.asp?A=msg_delete&A2=msg_envoyee&msg_ID=<% =Request.Querystring("msg_ID") %>">Supprimer le message</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV></TD>
		    </TR>	
		  </TABLE>
		
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

