<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Livre d'or
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

msgpg = "10"	'Nombre de message par page


%>

<!--#include file="../include/entete.inc.asp"-->
<!--#include file="../include/config.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="index.asp">Livre d'or</a></TD>
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
            <DIV class="boxtitle">Livre d'or</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff" align="center"><BR>

            <!--#include file="../auth/connect.asp"-->

            <B><% = Request.QueryString("msg") %></B><BR>

            <FORM ACTION="send.asp" METHOD="post">

            <TABLE border="0" cellpacing="0" cellpadding="0" width="50%">
              <TR>
                <TD><INPUT type="hidden" name="login" value="<% =session("user") %>"></TD>
              </TR>
              <TR>
		<TD><TEXTAREA name="message" ROWS="7" COLS="45"></TEXTAREA></TD>	
              </TR>
              <TR>
                <TD align="center"><INPUT type="submit" VALUE="Envoyer" class="button">&nbsp;<INPUT type="reset" VALUE="Effacer" class="button"></TD>
              </TR>
            </TABLE>				

            </FORM>

            <%
            SQL = "SELECT * FROM BOOK ORDER by bDate DESC"
            SET rSC = Connect.Execute(SQL)

	    alternate = "2"

            Nmax = msgpg
            Ncur = 0
            Ndeb = 0 

            if Request.QueryString("page") <> "" then _
              Ndeb = Cint(Request.QueryString ("page"))

            if rSC.EOF then
              response.write "<B>! Aucun message !</B>"
            end If
            
            While NOT rSC.EOF AND Ncur < Nmax + Ndeb

	    if alternate = "1" Then
	      color = "#F3F5F5"
	      alternate = "2"
	    else
	      color = "#CCCCCC"
	      alternate = "1"
	    end if
            
            if Ncur >= Ndeb then
            %>
            <TABLE border="0" cellspacing="0" cellpadding="3" width="80%" bgcolor="<% =color %>">
              <TR>
                <TD align="left"><STRONG><% =rSC("bLogin") %></STRONG></TD>
                <TD align="right">(<% =rSC("bDate") %>)
		<%
		if session("user") = rSC("bLogin") then
	          xx = 1
                end if
                
 		if xx = 1 then
 		%>
                <a href="delete.asp?A=msg_delete&bID=<% =rSC("bID_Book") %>">supprimer</a>
 		<%
 		xx = 0
 		end if
                
		%>
		</TD>
              </TR>
              <TR>	
                <TD colspan="2"><% =Replace(rSC("bMessage"), VbCrlf, "<BR>") %><BR></TD>
              </TR>
            </TABLE><BR>

            <%
            end If

            rSC.MoveNext
            Ncur = Ncur + 1	
            Wend
            
            %>
            <TABLE border="0" cellspacing="0" cellpadding="0" width="80%">
              <TR>
              <%
              if Ndeb > 0 then 
              %>
                <TD align="left"><a href="index.asp?page=<% = Ndeb-Nmax %>">Retour</a></TD>
              <%
              end If

              if NOT rSC.EOF then
              %>
                <TD align="right"><a href="index.asp?page=<% = Ncur %>">Suite</a></TD>
              <% 
              end if 
              %>
              </TR>
            </TABLE><BR>
            
	    <%
            Connect.Close
            Set Connect = Nothing
	    %>

          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

