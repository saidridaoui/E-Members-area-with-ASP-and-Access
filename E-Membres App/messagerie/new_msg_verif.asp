<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Verification des données pour l'envoi d'un message privé
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

session("A")      = Request.Form("A")
session("objet")  = Request.Form("objet")
session("message")= Request.Form("message")
session("dat")    = Request.Form("dat")

if Request.Form("A") = session("user") Then
  Response.redirect "index.asp?msg=!+Vous+ne+pouvez+pas+vous+envoyer+un+message+à+vous+même+!"
End if

%>
<!--#include file="../auth/connect.asp"-->
<%
SQL = "SELECT * FROM USER WHERE uLogin='" & session("A") & "'"
SET rSC = Connect.Execute(SQL)

'test si l'utilisateur existe
if rSC.EOF Then
  Response.redirect "index.asp?msg=!+Ce+membre+est+inexistant+!"
End if

Connect.Close
Set Connect=Nothing

if session("A")="" OR session("objet")="" OR session("message")="" then
  Response.redirect "index.asp?msg=!+Tous+les+champs+sont+obligatoire+!"
end if


%>
<!--#include file="../auth/connect.asp"-->
<%
SQL = "SELECT * FROM CONTACT WHERE (((CONTACT.ctLogin)='" & session("A") & "') AND ((CONTACT.ctFriend)='" & session("user") & "') AND ((CONTACT.ctIgnor)=True))  "
SET rSC = Connect.Execute(SQL)

if rSC.EOF Then
    au = 1
end if

Connect.Close
Set Connect=Nothing

'test si autorisation envoi de message
if au = "" then
  Response.redirect "index.asp?msg=!+L'utilisateur+ne+souhaite+pas+reçevoir+de+message+de+votre+part+!"
end if

comments = Replace(session("message"), "<", "")
comments = Replace(session("message"), "'", "&#39")
comments = Replace(session("message"), ">", "")
   %>
   <!--#include file="../auth/connect.asp"-->
   <%
   Set Record = Server.CreateObject("ADODB.Recordset")
   Record.Open "MESSAGE",Connect,2,2,2
   Record.addNew

   Record.Fields("mDE")     = session("user")
   Record.Fields("mA")      = session("A")
   Record.Fields("mObjet")  = session("objet")
   Record.Fields("mMessage")= comments
   'Record.Fields("mDate")   = session("dat")

   Record.Update

   Record.Close
   Set Record=Nothing

   Connect.Close
   Set Connect=Nothing

   if Request.Form("save") = "ok" then
   %>
   <!--#include file="../auth/connect.asp"-->
   <%
   Set Record = Server.CreateObject("ADODB.Recordset")
   Record.Open "MESSAGE_ENVOYEE",Connect,2,2,2
   Record.addNew

   Record.Fields("mDE")     = session("user")
   Record.Fields("mA")      = session("A")
   Record.Fields("mObjet")  = session("objet")
   Record.Fields("mMessage")= comments
   'Record.Fields("mDate")   = session("dat")

   Record.Update

   Record.Close
   Set Record=Nothing

   Connect.Close
   Set Connect=Nothing
   end if

   session("A")      = ""
   session("objet")  = ""
   session("message")= ""

   Response.redirect "index.asp?msg=!+Votre+message+à+bien+été+envoyé+!"
%>
