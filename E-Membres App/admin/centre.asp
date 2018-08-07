<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Partie centrale / ADMIN
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



Select Case Request.QueryString("A")

    Case "news" :
    %>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">News</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
          <CENTER>
	
            <FORM action="admin.asp?A=news&A2=ajout" method="POST">
	      
	    <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
	      <TR>
	        <TD colspan="2"><DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV></TD>
	      </TR>
              <TR>
                <TD width="50%"><B>Titre : </B><BR><INPUT name="tit" type="text" size="25" maxlength="35" value="<% =session("titre") %>"> *</TD>
                <TD><EM>(<% =session("user") %>)</EM> <% =Date %></TD>
              </TR>
              <TR>
                <TD colspan="2"><B>Contenu : </B><BR>
		  (ne pas faire des mots trop long,)
		  <BR><INPUT name="cont" type="text" size="80%" maxlength="240" value="<% =session("contenu") %>"> *
		</TD>
              </TR>
              <TR>
                <TD colspan="2" width="20%"><DIV align="right"><INPUT type="submit" value="Ajouter" name="action"></DIV></TD>
              </TR>
	    </TABLE>
            <HR color="<% =cadre_color %>">	
            
            </FORM>

            <!--#include file="news.asp"-->
              
	    </CENTER>
	    
          </TD>
        </TR>
      </TABLE>

    <%
    Case "user" :
    %>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">User</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">

            <!--#include file="../auth/connect.asp"-->
            <%
            SQL = "SELECT * FROM USER ORDER BY uLogin"
            SET rSC = Connect.Execute(SQL)

            if rSC.EoF then  ' Test si il y a des données à afficher
              response.write "<BR><DIV align=center><B>Auncun membre inscrit dans la base de données</B></DIV><BR>"
            else
            %>

	    <BR>
            <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
              <TR>
                <TD></TD>
                <TD><STRONG>Login</STRONG></TD>
                <TD><STRONG></STRONG></TD>
              </TR>

            <%
            While not rSC.EoF
            %>

              <TR>
	        <TD width="4%">
                <%
		if rSC("uStatus") = True then
		%>
                  <DIV align="center"><img src="../images/connect.gif" ></DIV>
		<%		
		end if
		
	        if rSC("uStatus") = False then
	        %>
                  <DIV align="center"><img src="../images/deconnect.gif"></DIV>
	        <%		
	        end if
	        %>
                </TD>
                <TD width="50%"><A HREF="#" onClick="window.open('../auth/profil.asp?User=<% =rSC("uLogin") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)"><% =rSC("uLogin") %></a></TD>
                <TD>
		<%
		if rSC("uStatus") = True then
		%>
		  <a href="admin.asp?A=user&A2=refuser&ulog=<% =rSC("uLogin") %>">Refuser</a>
                <%
		end if
		
		if rSC("uStatus") = False then
		%>
		  <a href="admin.asp?A=user&A2=accepter&ulog=<% =rSC("uLogin") %>">Valider</a>
		<%
		end if
	        %>
		
		</TD>
              </TR>
            
            <%
	    rSC.MoveNext
	    Wend

            End if

            Connect.Close
            Set Connect=Nothing
            %>

            </TABLE>
            <BR>
            
            <!--#include file="user.asp"-->

          </TD>
        </TR>
      </TABLE>

    <%
    Case "admin" :
    %>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Admin</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
	    <CENTER>
	    
            <FORM action="admin.asp?A=admin&A2=ajout" method="POST">

	    <DIV align="center"><B><% = Request.QueryString("msg") %></B></DIV>

            <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
              <TR>
                <TD><B>Login : </B></TD>
	        <TD><INPUT name="login" type="text" size="25" maxlength="19" value="<% =session("login") %>"> *</TD>
              </TR>
	      <TR>
	        <TD><B>Password : </B></TD>
		<TD><INPUT name="pass1" type="password" size="25" maxlength="19"  value="<% =session("pass1") %>"> *</TD>
	      </TR>
	      <TR>
	        <TD><B>Confirmation de Password :</B></TD>
		<TD><INPUT name="pass2" type="password" size="25" maxlength="19"  value="<% =session("pass2") %>"> *</TD>
              </TR>
	      <TR>
                <TD align="left"></TD>
                <TD align="right"><INPUT type="submit" value="Ajouter" name="action1"></TD>
              </TR>
            </TABLE>
            <HR color="<% =cadre_color %>">

	    </FORM>

            <!--#include file="admin_donnees.asp"-->

	    </CENTER>

          </TD>
        </TR>
      </TABLE>

    <%
    Case Else 'DEFAUT
    %>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Administrateur</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
            <BR>
              <CENTER><B>Bienvenue sur la partie administrateur de l'espace membre <% =titre %></B></CENTER>
              <BR><B>
	      &nbsp;&nbsp;Réalisé par : Hasmir Alic<BR>
	      &nbsp;&nbsp;Date : Septembre 2004<BR>
              &nbsp;&nbsp;Internet : http://www.alic.ch<BR>
	      </B>
            <BR>
          </TD>
        </TR>
      </TABLE>

    <%


End select
%>
