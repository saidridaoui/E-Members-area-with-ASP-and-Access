<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Formulaire d'inscription
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

on error resume next

'Test si l'utilisateur est déjà identifié
if Session("Good") = True then
Response.Redirect("auth/index.asp")
end if
%>

<!--#include file="include/config.inc.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE><% =titre %> / Inscription</TITLE>
<META content=text/html;charset=ISO-8859-1 http-equiv=Content-Type>
<LINK href="default.css" rel="stylesheet" type="text/css">

<SCRIPT language="javascript">
    function CheckDate(d) {
      // Cette fonction vérifie le format JJ/MM/AAAA saisi et la validité de la date.
      // Le séparateur est défini dans la variable separateur
	var amin=1900;  // année mini
	var amax=2000;  // année maxi
	var separateur="."; // separateur entre jour/mois/annee
	var j=(d.substring(0,2));
	var m=(d.substring(3,5));
	var a=(d.substring(6));
	var ok=1;
	if ( ((isNaN(j))||(j<1)||(j>31)) && (ok==1) ) {
		alert("Date de nais., le jour n'est pas correct."); ok=0; return false;
	}
	if ( ((isNaN(m))||(m<1)||(m>12)) && (ok==1) ) {
		alert("Date de nais., le mois n'est pas correct."); ok=0; return false;
	}
	if ( ((isNaN(a))||(a<amin)||(a>amax)) && (ok==1) ) {
		alert("Date de nais., (min 1900 / max 2000) l'année n'est pas correcte."); ok=0; return false;
	}
	if ( ((d.substring(2,3)!=separateur)||(d.substring(5,6)!=separateur)) && (ok==1) ) {
		alert("Date de nais., les séparateurs doivent être des "+separateur); ok=0; return false;
	}
	if (ok==1) {
		var d2=new Date(a,m-1,j);
		j2=d2.getDate();
		m2=d2.getMonth()+1;
		a2=d2.getYear();
		if (a2<=100) {a2=1900+a2}
		if ( (j!=j2)||(m!=m2)||(a!=a2) ) {
			alert("La date "+d+" n'existe pas !");
			ok=0;
			return false;
		}
	}
    }
</SCRIPT>

</HEAD>
<BODY background="images/fond.gif">
<BR><BR>
<CENTER>

<FORM action="verif_inscription.asp" method="POST">

<TABLE border="0" cellPadding="0" cellSpacing="0" width="500">
  <TR>
    <TD vAlign="top">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="2"><IMG alt="" height="21" width="11" src="images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Connexion</DIV>
          </TD>
          <TD background="images/vertical.gif" rowSPAN="3" width="2">
            <IMG src="images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol" width="2"></TD>
          <TD bgColor="#ffffff">
            <DIV align="left">
 	      <TABLE border="0" cellspacing="1" cellpadding="0" width="100%">
	        <TR>
	          <TD height="40"><DIV align="center"><B><% = Request.QueryString("Error") %></B></DIV></TD>
	        </TR>
	        <TR>
	          <TD>
	            <%
	            ' Bloc : Connexion
		    %>
		    <TABLE border="0" cellspacing="5" cellpadding="0">
                      <TR>
		        <TD><B>Login : </B></TD>
		        <TD>
		          <INPUT name="uLogin" type="text" size="25" maxlength="19" value="<% =Session("Login") %>"> *
		        </TD>
		      </TR>
		      <TR>
		        <TD><B>Password : </B></TD>
			<TD>
			  <INPUT name="uPassword1" type="password" size="25" maxlength="19"  value="<% =Session("Pass1") %>"> *
			</TD>
		      </TR>
		      <TR>
		        <TD><B>Confirmation de Password :</B></TD>
			<TD>
			  <INPUT name="uPassword2" type="password" size="25" maxlength="19"  value="<% =Session("Pass2") %>"> *
			</TD>
	              </TR>
		      <TR>
		        <TD><B>Adresse Email : </B></TD>
			<TD>
			  <INPUT name="uEmail" type="text" size="25"  value="<% =Session("Email") %>" maxlength="45"> *
			</TD>
		      </TR>
	            </TABLE>
	            <%
	            ' Fin Bloc : Connexion
		    %>	
	          </TD>
                </TR>
              </TABLE>
            </DIV>
          </TD>
        </TR>
        <TR>
          <TD><IMG alt="" height="12" src="images/cap.gif" width="11"></TD>
          <TD bgColor="#ffffff"></TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>

<BR>

<TABLE border="0" cellPadding="0" cellSpacing="0" width="500">
  <TR>
    <TD vAlign="top">
      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="2"><IMG alt="" height="21" width="11" src="images/boxmark.gif"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Votre Profil</DIV>
          </TD>
          <TD background="images/vertical.gif" rowSPAN="3" width="2">
            <IMG src="images/trans.gif" width="2">
          </TD>
        </TR>
        <TR>
          <TD class="leftcol" width="2"></TD>
          <TD bgColor="#ffffff">
            <DIV align="left">
 	      <TABLE border="0" cellspacing="1" cellpadding="0">
	        <TR>
	          <TD height="40"><DIV align="center"><B><% = Request.QueryString("Error1") %></B></DIV></TD>
	        </TR>
	        <TR>
	          <TD>
	            <%
	            ' Bloc : Profil
		    %>	
                    <TABLE border="0" cellspacing="5" cellpadding="0">
		      <TR>
		        <TD width="50%">Nom : </TD>
		        <TD width="50%"><INPUT name="uNom" type="text" value="<% =session("Nom") %>" size="25" maxlength="45"></TD>
		      </TR>
		      <TR>
		        <TD>Prénom : </TD>
		        <TD><INPUT name="uPrenom" type="text" value="<% =session("Prenom") %>" size="25" maxlength="45"></TD>
	              </TR>
	              <TR>
		        <TD>Date de nais.  : </TD>
		        <TD>
		          <INPUT type="text" name="ladate" value="<% =session("Datnais") %>" size="10" maxlength="10" onBlur="CheckDate(this.form.ladate.value)"> *
			  <EM>(ex : 23.10.1983)</EM>
		        </TD>
		      </TR>
		      <TR>
		        <TD>Sexe : </TD>
		        <TD><select name="uSexe">
		              <option value="<% =session("Sexe") %>"><% =session("Sexe") %></option>
		              <option value="Homme">Homme</option>
		              <option value="Femme">Femme</option>
		            </select> *
	                </TD>
		      </TR>
		      <TR>
		        <TD>Etat civil : </TD>
		        <TD><select name="uEtat">
		              <option value="<% =session("Etat") %>"><% =session("Etat") %></option>
		              <option value="Marié">Marié</option>
		              <option value="Célibataire">Célibataire</option>
		            </select>
		        </TD>
		      </TR>
		      <TR>
		        <TD>Ville : </TD>
		        <TD><INPUT name="uVille" type="text" value="<% =session("Ville") %>" size="25" maxlength="45"></TD>
		      </TR>
		      <TR>
		        <TD valign="top">Description : </TD>
		        <TD><TEXTAREA name="uDescription" cols="35" rows="5"><% =session("Desc") %></TEXTAREA></TD>
		      </TR>
		      <TR>
		        <TD>URL de votre site : </TD>
		        <TD>
			  <INPUT name="uUrl" type="text" value="<% =session("Url") %>" size="25" maxlength="95">
			  <EM>(sans le : http://... )</EM>
			</TD>
		      </TR>
		      <TR>
		        <TD>MSN : </TD>
		        <TD><INPUT name="uMSN" type="text" value="<% =session("MSN") %>" size="25" maxlength="45"></TD>
		      </TR>
		      <TR>
		        <TD>Inscription Newsletter : </TD>
		        <TD><INPUT name="uNews" type="checkbox" checked></TD>
		      </TR>
		      <TR>
		        <TD colspan="2">
			  <DIV align="center"><BR>
		            <INPUT type="submit" value="Valider" name="action" onClick="return CheckDate(this.form.ladate.value)">
			  </DIV>
		        </TD>
                      </TR>
		    </TABLE>
	            <%
	            ' Fin Bloc : Profil
		    %>			
	          </TD>
                </TR>
              </TABLE>
	    </DIV>
          </TD>
        </TR>
        <TR>
          <TD><IMG alt="" height="12" src="images/cap.gif" width="11"></TD>
          <TD bgColor="#ffffff"></TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>
</FORM>

</CENTER>

<DIV align="center">
  <P>&nbsp;</P>
  <P><B><a href="index.asp">Identification </a></B>|
     <B><a href="lost_pwd.asp">Password Oubli&eacute; ?</a></B>
  </P>
</DIV>
<DIV align="center"><BR><BR>
  <SPAN style="color: #999999; font-style: italic"><% =copyright %></SPAN>
</DIV>
  
</BODY>
</HTML>
