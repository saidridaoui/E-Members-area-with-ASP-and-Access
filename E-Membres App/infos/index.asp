<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page visualisation du profil
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><strong>Vous &ecirc;tes ici :</strong> <a href="../auth/index.asp">Accueil</a> &gt; <a href="index.asp">Voir mon Profil</a></TD>
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
            <DIV class="boxtitle">Voir mon Profil</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">


                <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
                  <TR>
                    <td height="40" align="center">
                    <!--#include file="../auth/connect.asp"-->
                    <%
                    SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
                    SET rSC = Connect.Execute(SQL)

                    ph = rSC.Fields("uPhoto")

                    if ph = "-" then
                      ph = "../images/avatar/aucun_avat.gif"
                    end if
                    %>
                    
                    <TABLE width="100%" border="0" cellpadding="0" cellspacing="5">
                      <TR>
                        <TD width="19%"><DIV align="center"><a href="#" onClick="window.open('<% =ph %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=1, copyhistory=0, menuBar=0, top=200');return(false)">
			  <img src="<% =ph %>" width="60" border="0"></a></DIV>
			</TD>
                        <TD width="81%">
                          <DIV align="right"><SPAN><B><% =session("user") %></B><BR>
                            Inscrit depuis le <% =rSC("uDate_inscription") %></SPAN>
                          </DIV>
                        </TD>
                      </TR>
                      <TR>
                        <TD colspan="2">
                          <TABLE width="100%" border="0" cellspacing="2" cellpadding="0">
                            <TR>
                              <TD width="21%" align="left"><strong>Nom : </STRONG></TD>
                              <TD width="79%" align="left"><% =rSC("uNom") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><STRONG>Prénom : </STRONG></TD>
                              <td width="79%" align="left"><% =rSC("uPrenom") %></TD>
                            </TR>
                            <TR>
                              <TD align="left"><STRONG>Date de nais. : </STRONG></TD>
                              <TD align="left"><% =rSC("uDate_naiss") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><STRONG>Sexe : </STRONG></TD>
                              <TD width="79%" align="left"><% =rSC("uSexe") %></TD>
                            </TR>
                            <TR>
                              <TD width="21%" align="left"><STRONG>Etat civil : </STRONG></TD>
                              <TD width="79%" align="left"><% =rSC("uEtat_civil") %></TD>
                            </TR>
                            <TR>
                              <TD align="left"><STRONG>Ville : </STRONG></TD>
                              <TD align="left"><% =rSC("uVille") %></TD>
                            </TR>
                            <TR>
                              <TD colspan="2" align="left"><br><STRONG>Description :</STRONG><BR>
			        <% =Replace(rSC("uDescription"), VbCrlf, "<br>") %>
			      </TD>
                            </TR>

                            <TR>
                              <TD colspan="2" align="left"><STRONG><br>Site Web Personnel :</STRONG>
                                <a href="http://<% =rSC("uUrl") %>" target="_blank"><% =rSC("uUrl") %></a>
                              </TD>
                            </TR>
                            <TR>
                              <TD colspan="2" align="left"><STRONG>Adresse MSN :</STRONG>
                                <a href="Mailto:<% =rSC("uMsn") %>" target="_blank"><% =rSC("uMsn") %></a>
                              </TD>
                            </TR>
                            <TR>
                              <TD colspan="2" align="left"><STRONG>Adresse Email :</STRONG>
                                <a href="Mailto:<% =rSC("uMail") %>" target="_blank"><% =rSC("uMail") %></a>
                              </TD>
                            </TR>
                          </TABLE>
                        </TD>
                      </TR>
                    </TABLE>
                    <%
                    Connect.Close
                    Set Connect=Nothing
                    %>
                    </TD>
                  </TR>
                </TABLE>

          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->
