<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Nom    : Ridaoui
' Prénom : Said
'
' Description : Traitement du formulaire pour la connexion
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="connect.asp"-->
<!--#include file="include/config.inc.asp"-->

<!--#include file="include/fonctions.inc.asp"-->

<%
'exemple
'v = Request.Form("password")
'ev = encrypttext(v,"password")
'dv = decrypttext(ev,"password")

user = Request.Form("login")

TestLetterOnly(user)

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
                Response.redirect "index.asp?Error=!+Votre+login+comporte+des+caractères+non+autorisé+!"
                Exit Function
            End If
        Next
    End If
    'TestLetterOnly="True"
End Function


SQL = "SELECT * FROM USER WHERE uLogin='" & user & "'" 
SET rSC = Connect.Execute(SQL)

  if NOT rSC.EOF Then
    if Request.Form("password") = decrypttext(rSC("uPassword"),"password") then
      if rSC("uStatus") = true then

	session("Good") = true
	
	session.Timeout = session_duree
        session("user") = rSC("uLogin")
        
	Response.Redirect("auth/index.asp")	
      Else
        session("Good") = false
        Response.Redirect("index.asp?Error=!+Votre+compte+n'est+pas+activé+!")
      End if
    End if
  End if

Connect.Close                                    
Set Connect=Nothing   

session("Good") = false
Response.Redirect("index.asp?Error=!+Utilisateur+ou+mot+de+passe+incorrect+!")
%>
