<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Nom    : Ridaoui
' Prénom : Said
'
' Description : Page principale
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="index.asp">Accueil</a> </TD>
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
            <DIV class="boxtitle">Statistiques</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
            <!--#include file="message.asp"-->
          </TD>
        </TR>
      </TABLE>

      <BR>

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
            <!--#include file="news.asp"-->
          </TD>
        </TR>
      </TABLE>

      <BR>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Liste des membres inscrits / Liste des membres connect&eacute;s</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
              <TABLE width="100%"  border="0" cellspacing="0" cellpadding="3">
                <TR>
                  <TD height="40" align="center" valign="top">
                    <P align="left">Découvrez la liste de tous les membres inscrits sur <% =titre %>  !<BR>
                      Cliquer sur le lien ci-dessous pour accéder à la liste complète !
                    </P>
                  </TD>
                  <TD height="40" align="center" valign="top">
                    <P align="left">D&eacute;couvrez la liste de tous les membres connect&eacute;s aujourd'hui sur leur compte !<BR>
                      Utilisez le lien ci-dessous pour d&eacute;couvrir la liste.
                    </P>
                  </TD>
                  <TD width="3%"><BR></TD>                  
                </TR>
                <TR>
                  <TD height="40" align="center"><a href="liste_membres.asp" target="_blank">Voir la liste des membres inscrits</a></TD>
                  <TD height="40" align="center"><a href="#" onClick="window.open('user_connect.asp','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=200, height=300, left=350, top=200');return(false)">Membres connect&eacute;s aujourd'hui</a></TD>
                  <TD width="3%"><BR></TD>
                </TR>
              </TABLE>                  
          </TD>
        </TR>
      </TABLE>

      <BR>

      <TABLE border="0" width="100%" cellPadding="2" cellSpacing="0" >
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Les <% =aff_membres %> derniers membres inscrits</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">
              <!--#include file="connect.asp"-->
  	      <%
              'affichage des X dernier membres inscrits
              SQL = "SELECT TOP "& aff_membres & " * FROM USER ORDER BY user.uID_user DESC"

              SET rSC = Connect.Execute(SQL)
              
              While not rSC.EoF

              color_sexe = rSC.Fields("uSexe")

              ph = rSC.Fields("uPhoto")
              
              if ph = "-" then
                ph = "../images/avatar/aucun_avat.gif"
              end if

              if color_sexe = "Homme" then
                color_sexe = p_homme                  
              end if  
                 
              if color_sexe = "Femme" then
                color_sexe = p_femme                  
              end if   
                 
              if color_sexe = "" then
                color_sexe = "#FFFFFF"                  
              end if   
              %>

              <TABLE width="100%"  border="0" cellpadding="5" cellspacing="1">
                <TR>
                  <TD width="18%" bgcolor="<% =color_sexe %>">
                    <DIV align="center"><a href="#" onClick="window.open('<% =ph %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=1, copyhistory=0, menuBar=0, top=200');return(false)">
		      <img src="<% =ph %>" width="60" border="0" ></a></DIV>
                  </TD>
                  <TD width="82%" valign="top" bgcolor="<% =color_sexe %>">
                    <TABLE width="100%"  border="0" cellspacing="1" cellpadding="0">
                      <TR>
                        <TD colspan="2"><SPAN><% =rSC("uLogin") %></SPAN></TD>
                      </TR>
                      <TR>
                        <TD width="23%"><B>Sexe : </B></TD>
                        <TD width="77%"><% =rSC("uSexe") %></TD>
                      </TR>
                      <TR>
                        <TD><B>Date de nais. : </B></TD>
                        <TD><% =rSC("uDate_naiss") %></TD>
                      </TR>
                      <TR>
                        <TD height="25" colspan="2">
                          <DIV align="right">
                            <A HREF="#" onClick="window.open('profil.asp?User=<% =rSC("uLogin") %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0, width=650, height=455, left=200, top=180');return(false)">Voir le Profil</a> | 
                            <A HREF="../messagerie/index.asp?A=<% =rSC("uLogin") %> ">Envoyer un message</a> | 
                            <A HREF="../contact/ajout.asp?pseudo=<% =rSC("uLogin") %>">Ajouter &agrave; mes contacts&nbsp;&nbsp;</a> 
                          </DIV>
                        </TD>
                      </TR>
                    </TABLE>
                  </TD>
                </TR>
              </TABLE>

              <%
              rSC.MoveNext
              Wend              

              Connect.Close
              Set Connect=Nothing
              %>

          </TD>
        </TR>
      </TABLE>
      

      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->
