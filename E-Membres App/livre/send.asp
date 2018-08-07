<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour la suppression des message(s)
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

if Request.Form("message") = "" then
  Response.redirect "index.asp?msg=!+Vous+devez+remplir+tous+les+champs+!"
end if
%>
<!--#include file="../auth/connect.asp"-->
<%
comments = Replace(Request.Form("message"), "<", "")
comments = Replace(Request.Form("message"), "'", "&#39")
comments = Replace(Request.Form("message"), ">", "")

  Set Record = Server.CreateObject("ADODB.Recordset")
  Record.Open "BOOK",Connect,2,2,2
  Record.addNew

  Record.Fields("bLogin")   = Request.Form("login")
  Record.Fields("bMessage") = comments

  Record.Update

  Record.Close
  Set Record=Nothing

  Connect.Close
  Set Connect=Nothing

  Response.redirect "index.asp?msg=!+Votre+message+a+bien+été+enregistré+!"
%>
