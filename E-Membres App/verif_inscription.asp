<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Verification des données pour la création d'un nouveau compte
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<!--#include file="include/config.inc.asp"-->

<%
session("Login")  = Request.Form("uLogin")
session("Pass1")  = Request.Form("uPassword1")
session("Pass2")  = Request.Form("uPassword2")
session("Email")  = Request.Form("uEmail")

session("Nom")    = Request.Form("uNom")
session("Prenom") = Request.Form("uPrenom")
session("Datnais")= Request.Form("ladate")
session("Sexe")   = Request.Form("uSexe")
session("Etat")   = Request.Form("uEtat")
session("Ville")  = Request.Form("uVille")
session("Desc")   = Request.Form("uDescription")
session("Url")    = Request.Form("uUrl")
session("MSN")    = Request.Form("uMSN")
session("News")   = Request.Form("uNews")


%>
<!--#include file="connect.asp"-->
<%
SQL = "SELECT * FROM USER WHERE uLogin='" & lcase(session("Login")) & "'"
SET rSC = Connect.Execute(SQL)

  'test si le login est deja pris
  if NOT rSC.EOF then
    if lcase(session("Login")) = lcase(rSC("uLogin")) then
      Response.redirect "inscription.asp?Error=!+Ce+login+est+déjà+pris+!"
    End if
  End if

Connect.Close
Set Connect=Nothing

%>
<!--#include file="connect.asp"-->
<%
SQL = "SELECT * FROM USER WHERE uMail='" & lcase(session("Email")) & "'"
SET rSC = Connect.Execute(SQL)

  'test si l'adresse e-mail est deja prise
  if NOT rSC.EOF then
    if lcase(session("Email")) = rSC("uMail") then
      Response.redirect "inscription.asp?Error=!+Cette+adresse+email+est+déjà+enregistrée+!"
    End if
  End if

Connect.Close
Set Connect=Nothing


'champs vides 
if session("Login")="" OR session("Pass1")="" OR session("Pass2")="" OR session("Email")="" then
  Response.redirect "inscription.asp?Error=!+Les+champs+suivis+de+*+sont+obligatoires+!"
end if

'longueur du login
if Len(session("Login")) < 3 then
  Response.redirect "inscription.asp?Error=!+Le+login+doit+comporter+au+minimum+3+caractères+!"
end if

TestLetterOnly(session("Login"))

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
                Response.redirect "inscription.asp?Error=!+Votre+login+comporte+des+caractères+non+autorisé+!"
                Exit Function
            End If
        Next
    End If
    'TestLetterOnly="True"
End Function

'test si il y a espace dans le login
if instrrev(session("Login")," ") > 0 then
  Response.redirect "inscription.asp?Error=!+Aucun+espace+dans+le+login+!"
end if

'test mot de passe identique 
if session("Pass1") <> session("Pass2") then
  Response.redirect "inscription.asp?Error=!+Les+mot+de+passe+doivent+être+identique+!"
end if

'test le sexe et date nais.
if session("Sexe") = "" OR session("Datnais") = "" then
  Response.redirect "inscription.asp?Error1=!+Les+champs+suivis+de+*+sont+obligatoires+!"
end if

'newsletter
if session("News")=""  then
  newsletter = false
else
  newsletter = true
end if

'description
if session("Desc")=""  then
  desc = "-"
else
  desc = session("Desc")
end if

'enlève le (http://)
fldLien = session("Url")

if Lcase(Left(fldLien,7))="http://" then
  fldLien= Right(fldLien,(Len(fldLien)-7))
end if  

'encrypte le mot de passe
pass = encrypttext(session("Pass1"),"password")

%>
<!--#include file="connect.asp"-->
<!--#include file="include/fonctions.inc.asp"-->
<%
comments = Replace(desc, "<", "")
comments = Replace(desc, "'", "&#39")
comments = Replace(desc, ">", "")

   Set Record = Server.CreateObject("ADODB.Recordset")
   Record.Open "USER",Connect,2,2,2
   Record.addNew

   Record.Fields("uLogin")      = session("Login")
   Record.Fields("uPassword")   = pass
   Record.Fields("uNom")        = session("Nom")
   Record.Fields("uPrenom")     = session("Prenom")
   Record.Fields("uEtat_civil") = session("Etat")
   Record.Fields("uSexe")       = session("Sexe")
   Record.Fields("uDate_naiss") = session("Datnais")
   Record.Fields("uVille")      = session("Ville")
   Record.Fields("uDescription")= comments
   Record.Fields("uUrl")        = fldLien
   Record.Fields("uMsn")        = session("MSN")
   Record.Fields("uPhoto")      = "-"
   Record.Fields("uMail")       = lcase(session("Email"))
   Record.Fields("uNewsletter") = newsletter
   Record.Fields("uStatus")     = verif_compte

   Record.Update          

   Record.Close
   Set Record=Nothing
   
   Connect.Close
   Set Connect=Nothing

   session.Abandon()
   Response.redirect "index.asp?Error=!+Votre+Compte+a+été+crée+avec+succès+!"

%>

