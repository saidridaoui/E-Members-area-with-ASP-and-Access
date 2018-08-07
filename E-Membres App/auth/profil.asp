<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Profil de l'utilsateur
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / profil de <% =Request.Querystring("user") %></TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY background="../images/fond.gif">

<CENTER>
<TABLE border="0" cellPadding="0" cellSpacing="0" width="90%">
  <TR>
    <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
    <TD class="boxtitleBG">
      <DIV class="boxtitle">Profil de <% =Request.Querystring("user") %></DIV>
    </TD>
  </TR>
  <TR>
    <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
    <TD>
      <DIV class="boxcontent">
      <TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
        <TR>
          <TD>
          
            <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
              <TR>
                <TD height="40" align="center">
                  <!--#include file="../auth/connect.asp"-->
                  <%
                  SQL = "SELECT * FROM USER WHERE uLogin='" & Request.Querystring("user") & "'"
                  SET rSC = Connect.Execute(SQL)

                  if rSC.EoF then  ' Test si il y a des données à afficher

                    response.write "<center><b><br>Erreur, cet utilisateur existe pas !<br><br></b></center>"

                  else

                    ph = rSC.Fields("uPhoto")

                    if ph = "-" then
                      ph = "../images/avatar/aucun_avat.gif"
                    end if
                    %>
                    
                    <TABLE width="100%" border="0" align="center" cellpadding="0" cellspacing="5">
                      <TR>
                        <TD width="19%">
			  <DIV align="center"><a href="#" onClick="window.open('<% =ph %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=1, copyhistory=0, menuBar=0, top=200');return(false)">
			  <img src="<% =ph %>" width="60" border="0"></a></DIV>
			</TD>
                        <TD width="81%">
                          <DIV align="right">
			    <SPAN><B><% =Request.Querystring("user") %></B><BR></SPAN>
			    <SPAN>Inscrit depuis le <% =rSC("uDate_inscription") %></SPAN>
                          </DIV>
                        </TD>
                      </TR>
                      <TR>
                        <TD colspan="2">
                          <TABLE width="100%" border="0" cellspacing="2" cellpadding="0">
                            <TR>
                              <TD width="21%" align="left"><B>Nom : </B></TD>
                              <TD width="79%" align="left"><% =rSC("uNom") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><B>Prénom : </B></TD>
                              <TD width="79%" align="left"><% =rSC("uPrenom") %></TD>
                            </TR>
                            <TR>
                              <TD align="left"><B>Date de nais. : </B></TD>
                              <TD align="left"><% =rSC("uDate_naiss") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><B>Sexe : </B></TD>
                              <TD width="79%" align="left"><% =rSC("uSexe") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><B>Etat civil : </B></TD>
                              <td width="79%" align="left"><% =rSC("uEtat_civil") %></TD>
                            </TR>
                            <TR>
                              <TD align="left"><B>Ville : </B></TD>
                              <TD align="left"><% =rSC("uVille") %></TD>
                            </TR>
                          </TABLE>
                        </TD>
                      </TR>
                      <TR>
                        <TD colspan="2" align="left"><B>Description :</B><BR><% =Replace(rSC("uDescription"), VbCrlf, "<br>") %></TD>
                      </TR>
                      <TR>
                        <TD colspan="2" align="left"><B><BR>Site Web Personnel :</B>
                          <a href="http://<% =rSC("uUrl") %>" target="_blank"><% =rSC("uUrl") %></a>
                        </TD>
                      </TR>
                      <TR>
                        <TD colspan="2" align="left"><B>Adresse MSN :</B>
                          <a href="Mailto:<% =rSC("uMsn") %>" target="_blank"><% =rSC("uMsn") %></a>
                        </TD>
                      </TR>
                      <TR>
                        <TD colspan="2" align="left"><B>Adresse Email :</B>
                          <a href="Mailto:<% =rSC("uMail") %>" target="_blank"><% =rSC("uMail") %></a>
                        </TD>
                      </TR>
                    </TABLE>
                    
                  <%
                  Connect.Close
                  Set Connect=Nothing

                  End if
                  %>

                </TD>
              </TR>
            </TABLE>
		
          </TD>
        </TR>
      </TABLE>
      </DIV>
    </TD>
  </TR>
</TABLE>
</CENTER>

<BR>
<DIV align="center"><a href="javascript:window.close();">Fermer</a></DIV>

<DIV align="center"><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>
  
</BODY>
</HTML>
