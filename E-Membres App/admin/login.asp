<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Nom    : Ridaoui
' Pr�nom : Said
'
' Description : Traitement du formulaire pour la connexion administrateur
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="../include/config.inc.asp"-->
<!--#include file="../auth/connect.asp"-->

<!--#include file="../include/fonctions.inc.asp"-->

<%
'exemple
'v = Request.Form("password")
'ev = encrypttext(v,"password")
'dv = decrypttext(ev,"password")

user = Request.Form("login")

TestLetterOnly(user)

'Test si il y a des caract�res non autoris� dans la chaine
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
                Response.redirect "index.asp?Error=!+Votre+login+comporte+des+caract�res+non+autoris�+!"
                Exit Function
            End If
        Next
    End If
    'TestLetterOnly="True"
End Function


SQL = "SELECT * FROM ADMIN WHERE aLogin='" & user & "'" 
SET rSC = Connect.Execute(SQL)

  if NOT rSC.EOF Then
    if Request.Form("password") = decrypttext(rSC("aPassword"),"password") then

        session("Good_ADMIN") = true

	session.Timeout = session_duree
        session("user") = rSC("aLogin")  

	Response.Redirect("index.asp")	

    End if
  End if

Connect.Close                                    
Set Connect=Nothing   

session("Good_ADMIN") = false
Response.Redirect("index.asp?Error=!+Utilisateur+ou+mot+de+passe+incorrect+!")
%>
