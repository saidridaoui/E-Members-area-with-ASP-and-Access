<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour la suppression des message(s)
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Select Case Request.QueryString("A")

    Case "msg_delete" : 'Supprime un message

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      
      SQL = "DELETE FROM BOOK WHERE bID_Book=" & Request.Querystring("bID") & ""
      Connect.Execute(SQL)	

      Connect.Close
      set Connect=Nothing

      Response.redirect "index.asp?msg=!+Message+supprimé+!"

    Case Else : 'autre choix erreur
      Response.redirect "../auth/index.asp"
End select

%>
