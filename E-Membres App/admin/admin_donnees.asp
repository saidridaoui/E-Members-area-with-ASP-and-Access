<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Said
' Prénom : Ridaoui
'
' Description : ADMIN DONNEES
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>
	      <CENTER><B><% = Request.QueryString("msg2") %></B></CENTER><BR>
              <!--#include file="../auth/connect.asp"-->
  	      <%
              if session("user") = "admin" then
	        xx = 1
              end if
  	      
              SQL = "SELECT * FROM ADMIN ORDER BY aLogin"
              SET rSC = Connect.Execute(SQL)

              if rSC.EoF then  ' Test si il y a des données à afficher
                response.write "<BR><DIV align=center><B>ERREUR</B></DIV><BR>"
              else

              While not rSC.EoF
              %>
              
              <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
                <TR>
                  <TD width="50%"><STRONG><% =rSC("aLogin") %></STRONG></TD>
                  <TD colspan="2" align="right">

		  <%
 		  if xx = 1 then
 		  %>
                    <a href="admin.asp?A=admin&A2=modif&aID=<% =rSC("aID_Admin") %>">modifier</a>
 		  <%
 		  xx = 0
 		  end if
		  
		  if rSC("aLogin") <> "admin" OR xx = "1" then
		  %>
		    <a href="admin.asp?A=admin&A2=modif&aID=<% =rSC("aID_Admin") %>">modifier</a> |
		    <a href="admin.asp?A=admin&A2=supp&aID=<% =rSC("aID_Admin") %>" onClick="return confirm('\nDemande de confirmation ?');">Supprimer</a>
		  <%
		  end if
		  %>
		  </TD>
		  
                </TR>
              </TABLE>

	      <%
	      rSC.MoveNext
	      Wend

              End if

              Connect.Close
              Set Connect=Nothing

              
              Select Case Request.QueryString("A2")

                Case "ajout" :

                  session("login") = Request.Form("login")
                  session("pass1") = Request.Form("pass1")
                  session("pass2") = Request.Form("pass2")	
	
                  if Request.Form("login") = "" OR Request.Form("pass1") = "" OR Request.Form("pass2") = "" then
                    Response.redirect "admin.asp?A=admin&msg=!+Tous+les+champs+sont+obligatoire+!"
                  end if
                
                  if Len(session("login")) < 3 then
                    Response.redirect "admin.asp?A=admin&msg=!+Le+login+doit+comporter+au+minimum+3+caractères+!"
                  end if
                
                  TestLetterOnly(session("login"))
                
                  'Test si il y a des caractères non autorisé dans la chaine
                  Function TestLetterOnly(strRequestTest)
                    strRequestTest = UCase(strRequestTest)
                    If strRequestTest ="" Then
                      TestLetterOnly = "Empty"
                    Else
                      strRequestLen = Len(strRequestTest)
                      For i = 0 To strRequestLen-1
                        strRequest = False
                        strRequestletter = Mid(strRequestTest,i+1,1)
                        'Response.Write strRequestletter
                        For j=65 To 90
                          If strRequestletter = Chr(j) Then
                            strRequest = True
                          End If
                        Next

                       'verification des exeption : . , ' et space
                       Select Case strRequestletter
                         Case "_","0","1","2","3","4","5","6","7","8","9"' "
                           strRequest = True
                       End Select

                       If Not strRequest Then
                         'TestLetterOnly="False"
                         Response.redirect "admin.asp?A=admin&msg=!+Votre+login+comporte+des+caractères+non+autorisé+!"
                        Exit Function
                        End If
                      Next
                    End If
                    'TestLetterOnly="True"
                  End Function

                  'test mot de passe identique
                  if session("pass1") <> session("pass2") then
                    Response.redirect "admin.asp?A=admin&msg=!+Les+mot+de+passe+doivent+être+identique+!"
                  end if

                  %>
                  <!--#include file="../auth/connect.asp"-->
                  <!--#include file="../include/fonctions.inc.asp"-->
                  <%
                  SQL = "SELECT * FROM ADMIN WHERE aLogin='" & session("login") & "'"
                  SET rSC = Connect.Execute(SQL)

                  'test si le login est deja pris
                  if NOT rSC.EOF then
                    if session("login") = rSC("aLogin") then
                      Response.redirect "admin.asp?A=admin&msg=!+Ce+login+est+déjà+pris+!"
                    End if
                  End if
                  
                  pass = encrypttext(session("pass1"),"password")
                  
                  Set Record = Server.CreateObject("ADODB.Recordset")
                  Record.Open "ADMIN",Connect,2,2,2
                  Record.addNew

                  Record.Fields("aLogin")    = session("login")
                  Record.Fields("aPassword") = pass

                  Record.Update

                  Record.Close
                  Set Record=Nothing

                  Connect.Close
                  Set Connect=Nothing
                
                  session("login") = ""
                  session("pass1") = ""
                  session("pass2") = ""
                  
                  Response.redirect "admin.asp?A=admin&msg=!+Administrateur+ajouté+!"
	        
	        
                Case "modif" :
                %>
                
                  <HR color="<% =cadre_color %>">
                  <!--#include file="../auth/connect.asp"-->
                  <!--#include file="../include/fonctions.inc.asp"-->
                  <%
                  SQL = "SELECT * FROM ADMIN WHERE aID_Admin=" & Request.Querystring("aID") & " "
                  SET rSC = Connect.Execute(SQL)
                  
                  pass = decrypttext(rSC("aPassword"),"password")
		  %>

                  <FORM action="admin.asp?A=admin&A2=modif&aID=<% =rSC("aID_Admin") %>&A3=valid" method="POST">

                  <DIV align="center"><B><% = Request.QueryString("msg3") %></B></DIV><BR>

                  <TABLE border="0" cellPadding="3" cellSpacing="0" width="100%">
                    <TR>
                      <TD><B>Login : </B></TD>
	              <TD><INPUT disabled type="text" size="25" maxlength="19" value="<% =rSC("aLogin") %>"></TD>
                    </TR>
                    <TR>
	              <TD><B>Password : </B></TD>
		      <TD><INPUT name="pass1" type="password" size="25" maxlength="19"  value="<% =pass %>"> *</TD>
	            </TR>
	            <TR>
	              <TD><B>Confirmation de Password :</B></TD>
		      <TD><INPUT name="pass2" type="password" size="25" maxlength="19"  value="<% =pass %>"> *</TD>
                    </TR>
	            <TR>
                      <TD align="left"></TD>
                      <TD align="right"><INPUT type="submit" value="Modifier" name="action1"></TD>
                    </TR>
                  </TABLE>

                  </FORM>

                  <%
                  Connect.Close
                  Set Connect=Nothing
                  
		  if Request.Querystring("A3") = "valid" then
		  
                    if Request.Form("pass1") = "" OR Request.Form("pass2") = "" then
                      Response.redirect "admin.asp?A=admin&A2=modif&aID="&Request.Querystring("aID")&"&msg3=!+Tous+les+champs+sont+obligatoire+!"
                    end if
                    
                    'test mot de passe identique
                    if Request.Form("pass1") <> Request.Form("pass2") then
                      Response.redirect "admin.asp?A=admin&A2=modif&aID="&Request.Querystring("aID")&"&msg3=!+Les+mot+de+passe+doivent+être+identique+!"
                    end if

                    %>
                    <!--#include file="../auth/connect.asp"-->
                    <!--#include file="../include/fonctions.inc.asp"-->
                    <%
                    pass = encrypttext(Request.Form("pass1"),"password")
                    
                    Set RS = Server.CreateObject("ADODB.Recordset")
                    SQL= "SELECT * FROM ADMIN WHERE aID_Admin=" & Request.Querystring("aID") & " "
                    RS.Open SQL,Connect,1,2,1	
	
                    RS("aPassword") = pass
	
                    RS.UpdateBatch
                    RS.Close
                    Set RS = Nothing

                    Connect.Close
                    Set Connect = Nothing
		
                    Response.redirect "admin.asp?A=admin&msg2=!+Modification+OK+!"
		  
		  end if
                
                Case "supp" :
                
                  %>
                  <!--#include file="../auth/connect.asp"-->
                  <%

                  SQL = "DELETE FROM ADMIN WHERE aID_Admin=" & Request.Querystring("aID") & " "
                  Connect.Execute(SQL)

                  Connect.Close
                  Set Connect=Nothing
                  
                  Response.redirect "admin.asp?A=admin&msg2=!+Administrateur+supprimé+!"

              End select
%>
