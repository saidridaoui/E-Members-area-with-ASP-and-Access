
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <%
	' Bloc: Menu section Messagerie
	%>
        <TR>
          <TD class="leftcol"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Messagerie</DIV>
          </TD>
          <TD background="../images/vertical.gif" rowSpan="3">
            <IMG src="../images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"></TD>
          <TD bgColor="#ffffff" width="150">

            <%
	    ' Bloc: Boite section de gauche
	    %>
            <TABLE border="0" cellSpacing="0" width="100%">
	      <TR>
	        <TD colspan="2" align="center">
                <!--#include file="../auth/connect.asp"-->
	        <%
                'compte le nombre de message que possede l'utilisateur
                SQL = "SELECT Count(MESSAGE.mA) AS CptDE FROM MESSAGE WHERE MESSAGE.mA='" & session("user") & "' "
                SET rSC = Connect.Execute(SQL)
	        nbr_msg = rSC.Fields("CptDE")

                'compte le nombre de nouveau message que possede l'utilisateur
                SQL = "SELECT Count(MESSAGE.mA) AS CptDE FROM MESSAGE WHERE (((MESSAGE.mA)='" & session("user") & "') AND ((MESSAGE.mRead_message)=False)) "
                SET rSC = Connect.Execute(SQL)
	        nbr_msg_new = rSC.Fields("CptDE")
	        
                'compte le nombre de message envoyee
                SQL = "SELECT Count(MESSAGE_ENVOYEE.mDE) AS CptDE FROM MESSAGE_ENVOYEE WHERE MESSAGE_ENVOYEE.mDE='" & session("user") & "' "
                SET rSC = Connect.Execute(SQL)
	        nbr_msg_envoyee = rSC.Fields("CptDE")

                'nbr total d'utilisateur
                SQL = "SELECT Count(*) AS CptDE FROM USER"
                SET rSC = Connect.Execute(SQL)
	        tot_user = rSC.Fields("CptDE")
	

	        Connect.Close
                Set Connect=Nothing
	
                'simule une barre de progression
                if nbr_msg = 0 then
                  Response.write "<center><IMG src=../images/barre_prog_0.gif width=194 height=16></center>"
	        end if
	
                if nbr_msg > 0 AND nbr_msg < 8 then
                  Response.write "<center><IMG src=../images/barre_prog_20.gif width=194 height=16></center>"
	        end if
	      	
                if nbr_msg > 7 AND nbr_msg < 15 then
                  Response.write "<center><IMG src=../images/barre_prog_40.gif width=194 height=16></center>"
	        end if	

                if nbr_msg > 14 AND nbr_msg < 22 then
                  Response.write "<center><IMG src=../images/barre_prog_60.gif width=194 height=16></center>"
	        end if
	      	
                if nbr_msg > 21 AND nbr_msg < 29 then
                  Response.write "<center><IMG src=../images/barre_prog_80.gif width=194 height=16></center>"
	        end if

                if nbr_msg > 28 AND nbr_msg < 10000 then
		  danger = "1"
                  Response.write "<center><IMG src=../images/barre_prog_100.gif width=194 height=16></center>"
	        end if	
	        %>
	        </TD>
	      </TR>

              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/home.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../auth/index.asp">Accueil</a></DIV>
                </TD>
              </TR>
              <TR>
	        <%
		if danger <> "1" then
		%>
                <TD width="14%"><DIV align="center"><IMG src="../images/new_msg.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../messagerie/index.asp">Nouveau Message</a></DIV>
                </TD>
                <%
		end if
		%>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/msg_receved.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../messagerie/msg_reception.asp">Bo&icirc;te de R&eacute;ception (<% =nbr_msg %>(<% =nbr_msg_new %>))</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/msg_envoi.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left">
		    <a href="../messagerie/msg_envoyee.asp">Messages Envoy&eacute;s (<% =nbr_msg_envoyee %>)</a>
		  </DIV>
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
        <%
	' Fin Bloc: Menu section
	%>
        <TR>
          <TD><BR></TD>
        </TR>
        <%
	' Bloc: Menu section Contacts
	%>
        <TR>
          <TD class="leftcol"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Contacts</DIV>
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
                <TD width="14%"><DIV align="center"><IMG src="../images/contact.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../contact/index.asp">Liste de mes Contacts</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/ajouter_contact.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../contact/ajout.asp">Ajouter un Contact</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/search_contact.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../contact/search.asp">Rechercher un Contact</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/valide_contact.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../contact/valider.asp">Valider un Contact</a></DIV>
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
        <%
	' Fin Bloc: Menu section
	%>
        <TR>
          <TD><BR></TD>
        </TR>
        <%
	' Bloc: Menu section Données Personnelles
	%>
        <TR>
          <TD class="leftcol"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Données Personnelles</DIV>
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
                <TD width="14%"><DIV align="center"><IMG src="../images/info_perso.gif"  width="20" height="16"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../infos/index.asp">Voir mon Profil</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/modif_info.gif" width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../infos/modif_infos.asp">Modifier mes Informations</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/exit.gif" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../logout.asp">D&eacute;connexion</a></DIV>
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
        <%
	' Fin Bloc: Menu section
	%>
        <TR>
          <TD><BR></TD>
        </TR>
        <%
	' Bloc: Menu section Divers
	%>
        <TR>
          <TD class="leftcol"><IMG alt="" height="21" width="11" src="../images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle"><% =titre %></DIV>
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
                <TD width="14%"><DIV align="center"><IMG src="../images/livre.gif"  width="16" height="16"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><a href="../livre/index.asp">Livre d'or <% =titre %></a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/faq.gif"  width="15" height="12"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><A HREF="#" onClick="window.open('../faq/index.asp','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)">FAQ</a></DIV>
                </TD>
              </TR>
              <TR>
                <TD width="14%"><DIV align="center"><IMG src="../images/att.gif" width="17" height="18"></DIV></TD>
                <TD width="86%" onmouseover="this.style.cursor='hand';this.style.backgroundColor='#DCDCDC'" onmouseout="this.style.backgroundColor='#FFFFFF'">
		  <DIV align="left"><A HREF="#" onClick="window.open('../propos/index.asp','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)">A Propos</a></DIV>
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

	
      </TABLE>
