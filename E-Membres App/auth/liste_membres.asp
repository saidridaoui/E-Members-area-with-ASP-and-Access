<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Liste des profils
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'Test si l'utilisateur est déjà authentifié
if Session("Good") = False or IsNull (Session("Good")) = True then
Response.Redirect("../index.asp")
end if

if Request.Querystring("lettre") = "" then
  Response.Redirect("liste_membres.asp?lettre=*")
end if
%>

<!--#include file="../include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / Liste des membres</TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="../default.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY background="../images/fond.gif">

<BR><CENTER>
<a href="liste_membres.asp?lettre=-">-+-</a> |
<a href="liste_membres.asp?lettre=a">A</a> |
<a href="liste_membres.asp?lettre=b">B</a> |
<a href="liste_membres.asp?lettre=c">C</a> |
<a href="liste_membres.asp?lettre=d">D</a> |
<a href="liste_membres.asp?lettre=e">E</a> |
<a href="liste_membres.asp?lettre=f">F</a> |
<a href="liste_membres.asp?lettre=g">G</a> |
<a href="liste_membres.asp?lettre=h">H</a> |
<a href="liste_membres.asp?lettre=i">I</a> |
<a href="liste_membres.asp?lettre=j">J</a> |
<a href="liste_membres.asp?lettre=k">K</a> |
<a href="liste_membres.asp?lettre=l">L</a> |
<a href="liste_membres.asp?lettre=m">M</a> |
<a href="liste_membres.asp?lettre=n">N</a> |
<a href="liste_membres.asp?lettre=o">O</a> |
<a href="liste_membres.asp?lettre=p">P</a> |
<a href="liste_membres.asp?lettre=q">Q</a> |
<a href="liste_membres.asp?lettre=r">R</a> |
<a href="liste_membres.asp?lettre=s">S</a> |
<a href="liste_membres.asp?lettre=t">T</a> |
<a href="liste_membres.asp?lettre=u">U</a> |
<a href="liste_membres.asp?lettre=u">V</a> |
<a href="liste_membres.asp?lettre=w">W</a> |
<a href="liste_membres.asp?lettre=x">X</a> |
<a href="liste_membres.asp?lettre=y">Y</a> |
<a href="liste_membres.asp?lettre=z">Z</a>

<BR><BR>

<TABLE border="0" cellPadding="0" cellSpacing="0" width="600">
  <TR>
    <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
    <TD class="boxtitleBG">
      <DIV class="boxtitle">Lettre : <% =ucase(Request.Querystring("lettre")) %></DIV>
    </TD>
  </TR>
  <TR>
    <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
    <TD>

      <TABLE width="100%"  border="0" cellspacing="0" cellpadding="2">
        <TR>
          <TD>

            <!--#include file="connect.asp"-->
            <%
	    if Request.Querystring("lettre") = "-" then
	      SQL = "SELECT * FROM USER WHERE (((USER.uLogin) Like '0%' Or (USER.uLogin) Like '1%' Or (USER.uLogin) Like '2%' Or (USER.uLogin) Like '3%' Or (USER.uLogin) Like '4%' Or (USER.uLogin) Like '5%' Or (USER.uLogin) Like '6%' Or (USER.uLogin) Like '7%' Or (USER.uLogin) Like '8%' Or (USER.uLogin) Like '9%')) ORDER BY USER.uLogin "
	    else
	      SQL = "SELECT * FROM USER WHERE uLogin like '" & Request.Querystring("lettre") &"%' ORDER BY user.uID_user ASC"
	    end if
	
            SET rSC = Connect.Execute(SQL)
	
	    alternate = "2"
	
	    If rSC.EoF Then  ' Test si il y a des données à afficher
	      msg=2
	
	      if Request.Querystring("lettre") = "*" then
	        msg=1
	      end if
	
	      if msg = "1" then
	        response.write "<center><b><br>Veuillez choisir une lettre !<br><br></b></center>"
	      end if
	
	      if msg = "2" then
	        response.write "<center><b><br>Aucun membre inscrit sous la lettre "& ucase(Request.Querystring("lettre")) &" !<br><br></b></center>"
	      end if
	
            Else
	
	      While not rSC.EoF
	        if alternate = "1" Then
	          color = "#F3F5F5"
	          alternate = "2"
	        else
	          color = "#CCCCCC"
	          alternate = "1"
	        end if
	
                ph = rSC.Fields("uPhoto")

                if ph = "-" then
                  ph = "../images/avatar/aucun_avat.gif"
                end if
	        %>
	        
                <TABLE width="100%"  border="0" cellpadding="5" cellspacing="3">
                  <TR>
                    <TD width="18%" bgcolor="<% =color %>">
                      <DIV align="center"><a href="#" onClick="window.open('<% =ph %>','_blank','toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=1, copyhistory=0, menuBar=0, top=200');return(false)">
		        <img src="<% =ph %>" width="60" border="0" ></a></DIV>
                    </TD>
                    <TD width="82%" valign="top" bgcolor="<% =color %>">
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
	      
            End if
	    %>

          </TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>

<BR>

<a href="liste_membres.asp?lettre=-">-+-</a> |
<a href="liste_membres.asp?lettre=a">A</a> |
<a href="liste_membres.asp?lettre=b">B</a> |
<a href="liste_membres.asp?lettre=c">C</a> |
<a href="liste_membres.asp?lettre=d">D</a> |
<a href="liste_membres.asp?lettre=e">E</a> |
<a href="liste_membres.asp?lettre=f">F</a> |
<a href="liste_membres.asp?lettre=g">G</a> |
<a href="liste_membres.asp?lettre=h">H</a> |
<a href="liste_membres.asp?lettre=i">I</a> |
<a href="liste_membres.asp?lettre=j">J</a> |
<a href="liste_membres.asp?lettre=k">K</a> |
<a href="liste_membres.asp?lettre=l">L</a> |
<a href="liste_membres.asp?lettre=m">M</a> |
<a href="liste_membres.asp?lettre=n">N</a> |
<a href="liste_membres.asp?lettre=o">O</a> |
<a href="liste_membres.asp?lettre=p">P</a> |
<a href="liste_membres.asp?lettre=q">Q</a> |
<a href="liste_membres.asp?lettre=r">R</a> |
<a href="liste_membres.asp?lettre=s">S</a> |
<a href="liste_membres.asp?lettre=t">T</a> |
<a href="liste_membres.asp?lettre=u">U</a> |
<a href="liste_membres.asp?lettre=u">V</a> |
<a href="liste_membres.asp?lettre=w">W</a> |
<a href="liste_membres.asp?lettre=x">X</a> |
<a href="liste_membres.asp?lettre=y">Y</a> |
<a href="liste_membres.asp?lettre=z">Z</a>

</CENTER>

<BR>
<DIV align="center"><a href="javascript:window.close();">Fermer</a></DIV>

<DIV align="center"><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>

</BODY>
</HTML>
