<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page de traitement des contacts
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Select Case Request.QueryString("A")

    Case "ajout_contact" :
    
      if Request.Form("pseudo") = session("user") Then
         Response.redirect "ajout.asp?msg=!+Vous+ne+pouvez+pas+ajouter+votre+propre+login+!"
      End if

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      SQL = "SELECT * FROM USER WHERE uLogin='" & Request.Form("pseudo") & "'"
      SET rSC = Connect.Execute(SQL)

      'test si l'utilisateur existe
      if rSC.EOF Then
         Response.redirect "ajout.asp?msg=!+Ce+membre+est+inexistant+!"
      End if

      Connect.Close
      Set Connect=Nothing

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      SQL = "SELECT * FROM CONTACT WHERE (((CONTACT.ctLogin)='" & session("user") & "') AND ((CONTACT.ctFriend)='" & Request.Form("pseudo") & "'))  "
      SET rSC = Connect.Execute(SQL)

      if rSC.EOF Then
        au = 1
      end if

      Connect.Close
      Set Connect=Nothing

      'test si autorisation envoi de message
      if au = "" then
        Response.redirect "ajout.asp?msg=!+Ce+membre+a+déjà+été+ajouté+!"
      end if

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      Set Record = Server.CreateObject("ADODB.Recordset")
      Record.Open "CONTACT",Connect,2,2,2
      Record.addNew

      Record.Fields("ctLogin")  = session("user")
      Record.Fields("ctFriend") = Request.Form("pseudo")

      Record.Update

      Record.Close
      Set Record=Nothing

      Connect.Close
      Set Connect=Nothing

      Response.redirect "ajout.asp?msg=!+Utilisateur+ajouté+avec+succès+!"

    Case "contact_valider" : 'Valide un contact

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM CONTACT WHERE (((CONTACT.ctLogin)='" & session("user") & "') AND ((CONTACT.ctFriend)='" & Request.Querystring("friend") & "'))"
      RS.Open SQL,Connect,1,2,1	
	
      RS("ctValide") = True
      RS("ctIgnor") = False
	
      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Connect.Close
      Set Connect = Nothing
		
      Response.redirect "valider.asp"


    Case "contact_refuser" : 'Refuse un contact

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM CONTACT WHERE (((CONTACT.ctLogin)='" & session("user") & "') AND ((CONTACT.ctFriend)='" & Request.Querystring("friend") & "'))"
      RS.Open SQL,Connect,1,2,1	
	
      RS("ctValide") = False
      RS("ctIgnor") = True
	
      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Connect.Close
      Set Connect = Nothing
		
      Response.redirect "valider.asp"

    Case "contact_delete" : 'Supprime un contact

      %>
      <!--#include file="../auth/connect.asp"-->
      <%

        SQL = "DELETE FROM CONTACT WHERE ctFriend='" & Request.Querystring("contact") & "'"
        Connect.Execute(SQL)

        Connect.Close
        set Connect=Nothing

        Response.redirect "index.asp?msg=!+Le+contact+a+été+supprimé+!"
          	

    Case Else : 'autre choix erreur
      Response.redirect "../auth/index.asp"
End select
%>
