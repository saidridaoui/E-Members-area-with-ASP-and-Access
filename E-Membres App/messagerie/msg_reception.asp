<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page reception des messages
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="msg_reception.asp">Boîte de Réception</a></TD>
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
            <DIV class="boxtitle">Boîte de Réception</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
          
            <FORM action="delete.asp?A=msg_reception" method="POST">
          
            <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
              <TR>
                <TD>
		  <TABLE width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <TR>
                      <TD height="20" colspan="5">
		        <DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV>
                      </TD>
                    </TR>
                    <TR bgcolor="<% =cadre_color %>">
                      <TD width="5%" bgcolor="<% =cadre_color %>"><DIV align="center"><IMG src="../images/msg_non_lu.gif" width="14" height="11"></DIV></TD>
                      <TD width="5%" bgcolor="<% =cadre_color %>"></TD>
                      <TD width="24%" height="20"><font color="#ffffff">Auteur</font></TD>
                      <TD width="44%"><font color="#ffffff">Sujet</font></TD>
                      <TD width="22%"><font color="#ffffff">Date</font></TD>
                    </TR>
                    <TR>
                      <TD colspan="5">

                        <!--#include file="../auth/connect.asp"-->
  	                <%
                        SQL = "SELECT * FROM MESSAGE WHERE mA='" & session("user") & "' ORDER BY mDate DESC"
                        SET rSC = Connect.Execute(SQL)

                        If rSC.EoF Then  ' Test si il y a des données à afficher
                          response.write "<BR><DIV align=center><B>Votre Boîte de Réception est vide</B></DIV><BR>"
                        Else

                          While not rSC.EoF
			  %>
			    <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
			      <TR>
	                        <TD width="5%" valign="bottom"><DIV align="center">
				<%
				if rSC("mRead_message") = True then
                                %>
                                <a href="message.asp?A=msg_reception&msg_ID=<% =rSC("mID_message")%>&on=<% =rSC("mRead_message")%>"><img border="0" src="../images/msg_lu.gif" width="15" height="12"></a>

                                <%else%>
                                <a href="message.asp?A=msg_reception&msg_ID=<% =rSC("mID_message")%>&on=<% =rSC("mRead_message")%>"><img border="0" src="../images/msg_non_lu.gif" width="14" height="11"></a>
				
                                <%end if%>
				</DIV>				
				</TD>			
			        <TD width="5%"><DIV align="center"><input type="checkbox" name="chbox" value="<% =rSC("mID_message")%>"></DIV></TD>
				<TD width="24%"><a href="index.asp?A=<% =rSC("mDE") %>"><% =rSC("mDE") %></a></TD>
				<TD width="44%"><a href="message.asp?A=msg_reception&msg_ID=<% =rSC("mID_message")%>&on=<% =rSC("mRead_message")%>"><% =rSC("mObjet") %></a></TD>
				<TD width="22%"><% =rSC("mDate") %></TD>
			      </TR>
			    </TABLE>
                          <%
			  rSC.MoveNext
			  Wend
                        End if

                        Connect.Close
                        Set Connect=Nothing
                        %>
		
		      </TD>
                    </TR>
                  </TABLE>
		</TD>
              </TR>
              <TR>
                <TD height="18">
		  <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <TR>
                      <TD height="40">
                        <DIV align="right"><INPUT type="submit" value="Supprimer" name="action" onClick="return confirm('\nDemande de confirmation ?');" >&nbsp;&nbsp;&nbsp;&nbsp;</DIV>
		      </TD>
                    </TR>
                  </TABLE>
		</TD>
              </TR>
            </TABLE>
            
            </FORM>
            
          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

