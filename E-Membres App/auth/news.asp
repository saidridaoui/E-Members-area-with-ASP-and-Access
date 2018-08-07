              <BR>
              <!--#include file="../auth/connect.asp"-->
  	      <%
              SQL = "SELECT * FROM NEWS ORDER BY nDate DESC"
              SET rSC = Connect.Execute(SQL)

              if rSC.EoF then  ' Test si il y a des données à afficher
                response.write "<BR><DIV align=center><B>Aucun news dans la base de données</B></DIV><BR>"
              else

              While not rSC.EoF
              %>
              
              <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
                <TR bgcolor="#DCDCDC">
                  <TD ><STRONG><% =rSC("nTitre") %></STRONG></TD>
                  <TD align="right"><EM>(<% =rSC("nAuteur") %>)</EM> <% =rSC("nDate") %></TD>
                </TR>
                <TR bgcolor="#DCDCDC">
                  <TD colspan="2"><% =rSC("nContenu") %></TD>
                </TR>
              </TABLE>
	      <BR>

	      <%
	      rSC.MoveNext
	      Wend

              End if

              Connect.Close
              Set Connect=Nothing
              %>
