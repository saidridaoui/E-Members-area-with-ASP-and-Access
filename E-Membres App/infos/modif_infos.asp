<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page modification du profil
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'session en cours :
'session("user") login de l'utilisateur

%>

<!--#include file="../include/entete.inc.asp"-->

<TABLE width="100%"  border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="69%"><STRONG>Vous &ecirc;tes ici :</STRONG> <a href="../auth/index.asp">Accueil</a> &gt; <a href="modif_infos.asp">Modifier mes Informations</a></TD>
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
            <DIV class="boxtitle">Modifier mes Informations - Connexion</DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">

            <SCRIPT language="javascript">
	      function CheckDate(d) {
	      // Cette fonction vérifie le format JJ/MM/AAAA saisi et la validité de la date.
	      // Le séparateur est défini dans la variable separateur
	      var amin=1900;  // année mini
	      var amax=2005;  // année maxi
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
		alert("Date de nais., (min 1900 / max 2005) l'année n'est pas correcte."); ok=0; return false;
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

            <FORM action="verif_infos.asp?A=connexion" method="POST">

            <!--#include file="../auth/connect.asp"-->
            <!--#include file="../include/fonctions.inc.asp"-->
            <%
            SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
            SET rSC = Connect.Execute(SQL)
            
            pass = decrypttext(rSC("uPassword"),"password")
	    %>
	    
            <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
              <TR>
                <TD colspan="2" align="center"><B><% = Request.QueryString("msg_conn") %></B><BR></TD>
              </TR>
              <TR>
                <TD width="50%" align="left"><STRONG>Login : </STRONG></TD>
                <TD width="50%"><INPUT disabled name="uLogin" type="text" size="25" value="<% =session("user") %>"></TD>
              </TR>
              <TR>
	        <TD width="50%" align="left"><STRONG>Password : </STRONG></TD>
		<TD width="50%"><INPUT name="pass1" type="password" size="25" maxlength="19"  value="<% =pass %>"><SPAN> *</SPAN></TD>
              </TR>
	      <TR>
	        <TD width="50%" align="left"><STRONG>Confirmation de Password :</STRONG></TD>
		<TD width="50%"><INPUT name="pass2" type="password" size="25" maxlength="19"  value="<% =pass %>"><SPAN> *</SPAN></TD>
              </TR>
              <TR>
                <TD width="50%" align="left"><STRONG>Adresse Email : </STRONG></TD>
                <TD width="50%"><INPUT name="mail" type="text" size="25"  maxlength="45" value="<% =rSC.Fields("uMail") %>"><SPAN> *</SPAN></TD>
              </TR>
	      <TR>
                <TD align="left"></TD>
                <TD align="right"><INPUT type="submit" value="Valider" name="action1"></TD>
              </TR>
            </TABLE>

            <%
            Connect.Close
            Set Connect=Nothing
            %>
            
            </FORM>
            
          </TD>
        </TR>
      </TABLE>

      <BR>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Modifier mes Informations - Votre Profil <a name="aaa"></a></DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">

            <FORM action="verif_infos.asp?A=profil" method="POST">
            
            <!--#include file="../auth/connect.asp"-->
            <%
            SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
            SET rSC = Connect.Execute(SQL)
	    %>
            
	    <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
              <TR>
                <TD colspan="2" align="center"><B><% = Request.QueryString("msg_conn2") %></B><BR></TD>
              </TR>
              <TR>
                <TD>Nom : </TD>
                <TD><INPUT name="nm" type="text" value="<% =rSC("uNom") %>" maxlength="45" size="25"></TD>
              </TR>
	      <TR>
	        <TD>Prénom : </TD>
	        <TD><INPUT name="pre" type="text" value="<% =rSC("uPrenom") %>" maxlength="45" size="25"></TD>
	      </TR>
	      <TR>
	        <TD width="50%">Date de nais.  : </TD>
	        <TD width="50%">
	   	  <INPUT type="text" name="ladate" value="<% =rSC("uDate_naiss") %>" size="10" maxlength="10" onBlur="CheckDate(this.form.ladate.value)">
	          <SPAN> *</SPAN>
		  <EM>(ex : 23.10.1983)</EM>
	
	        </TD>
	      </TR>
	      <TR>
	        <TD>Sexe : </TD>
	        <TD><select name="sx">
	              <option value="<% =rSC("uSexe") %>"><% =rSC("uSexe") %></option>
	              <option value="Homme">Homme</option>
	              <option value="Femme">Femme</option>
	            </select><SPAN> *</SPAN>
		</TD>
	      </TR>
	      <TR>
	        <TD>Etat civil : </TD>
	        <TD><select name="et">
	              <option value="<% =rSC("uEtat_civil") %>"><% =rSC("uEtat_civil") %></option>
	              <option value="Marié">Marié</option>
	              <option value="Célibataire">Célibataire</option>
	            </select>
		</TD>
	      </TR>
	      <TR>
	        <TD>Ville : </TD>
	        <TD><INPUT name="vil" type="text" value="<% =rSC("uVille") %>" size="25" maxlength="45"></TD>
	      </TR>
	      <TR>
	        <TD valign="top">Description : </TD>
	        <TD><textarea name="ds" cols="35" rows="5"><% =rSC("uDescription") %></textarea></TD>
	      </TR>
	      <TR>
	        <TD>URL de votre site : </TD>
	        <TD><INPUT name="url" type="text" value="<% =rSC("uUrl") %>" size="25" maxlength="95">
		  <EM>(sans le : http://... )</EM>
		</TD>
	      </TR>
	      <TR>
	        <TD>MSN : </TD>
	        <TD><INPUT name="msn" type="text" value="<% =rSC("uMsn") %>" size="25" maxlength="45"></TD>
	      </TR>
	      <TR>
	        <TD>Inscription Newsletter : </TD>
	        <%
		if rSC("uNewsletter") = true then
                  n = "checked"
		else
		  n = ""
		end if
		%>
	        <TD><INPUT name="ns" type="checkbox" <% =n %>></TD>
	      </TR>
	      <TR>
	        <TD></TD>
	        <TD align="right"><INPUT type="submit" value="Valider" name="action2" onClick="return CheckDate(this.form.ladate.value)"></TD>
	      </TR>	
	    </TABLE>
	    
            <%
            Connect.Close
            Set Connect=Nothing
            %>
	    
	    </FORM>

          </TD>
        </TR>
      </TABLE>
      
      <BR>

      <TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
        <TR>
          <TD class="leftcol" width="1%"><IMG alt="" height="21" src="../images/boxmark.gif" width="11"></TD>
          <TD class="boxtitleBG">
            <DIV class="boxtitle">Modifier mes Informations - Avatar / Photo <a name="bbb"></a></DIV>
          </TD>
        </TR>
        <TR>
          <TD class="leftcol"><IMG alt="" src="../images/trans.gif" width="11"></TD>
          <TD bgcolor="#ffffff">

            <TABLE width="100%"  border="0" cellspacing="5" cellpadding="0">
            <TR>
	      <TD></TD>
	      <TD align="left"><B><% = Request.QueryString("msg_conn3") %></B><BR></TD>
            </TR>
              <TR>
                <TD width="30%">Avatar / Photo : </TD>
                <TD><a href="modif_infos.asp?Lien=2&#bbb">avatar</a> | <a href="modif_infos.asp?Lien=1&#bbb">photo</a>
	        </TD>
              </TR>
              
	      <%
	      'Photo
	      if Request.Querystring("Lien") = "1" then
	      %>

              <!--#include file="../auth/connect.asp"-->
              <%
              SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
              SET rSC = Connect.Execute(SQL)
	      %>

              <FORM action="verif_infos.asp?A=photo" method="POST" ENCTYPE="multipart/form-data">

	      <TR>
	        <TD width="30%">Photo : </TD>
	        <TD><INPUT type="file" name="file1" size="25"></TD>
	      </TR>	
	      <TR>
	        <TD></TD>
	        <TD align="right"><INPUT type="submit" value="Valider" name="action3"></TD>
	      </TR>		
	        
              <%
              Connect.Close
              Set Connect=Nothing
              %>
	        
	      </FORM>

	      <%
              End if
	
	      'Avatar	
	      if Request.Querystring("Lien") = "2" then
	      %>
	      
              <!--#include file="../auth/connect.asp"-->
              <%
              SQL = "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
              SET rSC = Connect.Execute(SQL)
	      %>
	      
              <FORM action="verif_infos.asp?A=avatar" method="POST">
	      	
	      <TR>
	        <TD width="30%">Avatar : </TD>
                <TD><select name="avt" onChange="document.apercu.src=form.avt.options[form.avt.selectedIndex].value">
                          <option value="../images/avatar/aucun_avat.gif">- Aucun Avatar -</option>
	                  <option value="../images/avatar/1.gif">01</option>
	                  <option value="../images/avatar/2.gif">02</option>
	                  <option value="../images/avatar/3.gif">03</option>
	                  <option value="../images/avatar/4.gif">04</option>
	                  <option value="../images/avatar/5.gif">05</option>
	                  <option value="../images/avatar/6.gif">06</option>
	                  <option value="../images/avatar/7.gif">07</option>
	                  <option value="../images/avatar/8.gif">08</option>
	                  <option value="../images/avatar/9.gif">09</option>
	                  <option value="../images/avatar/10.gif">10</option>			  			  			  	
	                  <option value="../images/avatar/11.gif">11</option>			  			  			  	
	                  <option value="../images/avatar/12.gif">12</option>			  			  			  	
	                  <option value="../images/avatar/13.gif">13</option>		
	                  <option value="../images/avatar/14.gif">14</option>			  			  			  	
	                  <option value="../images/avatar/15.gif">15</option>		
	                  <option value="../images/avatar/16.gif">16</option>		
	                  <option value="../images/avatar/17.gif">17</option>			  			  			  	
	                  <option value="../images/avatar/18.gif">18</option>		
	                  <option value="../images/avatar/19.gif">19</option>			  			  			  	
	                  <option value="../images/avatar/20.gif">20</option>		
	                  <option value="../images/avatar/21.gif">21</option>		
	                  <option value="../images/avatar/22.gif">22</option>			  			  			  	
	                  <option value="../images/avatar/23.gif">23</option>		
	                  <option value="../images/avatar/24.gif">24</option>			  			  			  	
	                  <option value="../images/avatar/25.gif">25</option>		
	                  <option value="../images/avatar/26.gif">26</option>					  	
	                  <option value="../images/avatar/27.gif">27</option>			  			  			  	
	                  <option value="../images/avatar/28.gif">28</option>			  			  			  	
	                  <option value="../images/avatar/29.gif">29</option>			  			  			  	
	                  <option value="../images/avatar/30.gif">30</option>		
	                  <option value="../images/avatar/31.gif">31</option>			  			  			  	
	                  <option value="../images/avatar/32.gif">32</option>		
	                  <option value="../images/avatar/33.gif">33</option>		
	                  <option value="../images/avatar/34.gif">34</option>			  			  			  	
	                  <option value="../images/avatar/35.gif">35</option>		
	                  <option value="../images/avatar/36.gif">36</option>			  			  			  	
	                  <option value="../images/avatar/37.gif">37</option>		
	                  <option value="../images/avatar/38.gif">38</option>		
	                  <option value="../images/avatar/39.gif">39</option>			  			  			  	
	                  <option value="../images/avatar/40.gif">40</option>		
	            </select>
                </TD>
	        <TD>Actuel :</TD>
	      </TR>
	      <TR>
	        <TD valign="top">Aper&ccedil;u de l'avatar : </TD>
	        <TD valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="apercu" src="../images/avatar/aucun_avat.gif" border="0"></TD>
	        <TD width="40%">
		<%
                  if rSC("uPhoto") = "-" then
	            photo = "../images/avatar/aucun_avat.gif"
	          else
                    photo = rSC("uPhoto")	
                  end if
		%>
		<img src="<%  =photo %>" width="60" border="0"></TD>
	      </TR>	
	      <TR>
	        <TD></TD>
	        <TD></TD>	
	        <TD align="right"><INPUT type="submit" value="Valider" name="action4"></TD>
	      </TR>		
	      
              <%
              Connect.Close
              Set Connect=Nothing
              %>
	      
              </FORM>
	      
	      <%
	      End if
              %>
              
            </TABLE>
          </TD>
	

          </TD>
        </TR>
      </TABLE>
      <%
      '**** FIN PARTIE CENTRALE ****
      %>

<!--#include file="../include/pied.inc.asp"-->

