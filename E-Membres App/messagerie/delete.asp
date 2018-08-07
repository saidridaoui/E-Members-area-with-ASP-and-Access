<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Page pour la suppression des message(s)
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Select Case Request.QueryString("A")

    Case "msg_reception" : 'Messages recus

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
	
      For Each objElement In Request.Form
          If Request.Form(objElement).Count >= 1 Then
            For increment = 1 To Request.Form(objElement).Count

              if Request.Form(objElement) = "Supprimer" then
	        exit for
              end if

              SQL = "DELETE FROM MESSAGE WHERE mID_message=" & Request.Form(objElement)(increment) & ""
              'Response.write SQL
	      Connect.Execute(SQL)
	
	      'Response.write Request.Form(objElement)(increment) & " ok <br>"

            Next
          End If
      Next

      Connect.Close
      set Connect=Nothing

      Response.redirect "msg_reception.asp?msg=!+Message(s)+de+la+boîte+de+réception+supprimé+!"

    Case "msg_envoyee" : 'Messages envoyee

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
	      
      For Each objElement In Request.Form
          If Request.Form(objElement).Count >= 1 Then
            For increment = 1 To Request.Form(objElement).Count

              if Request.Form(objElement) = "Supprimer" then
	        exit for
              end if

              SQL = "DELETE FROM MESSAGE_ENVOYEE WHERE mID_message=" & Request.Form(objElement)(increment) & ""
	      Connect.Execute(SQL)
	
	      'Response.write Request.Form(objElement)(increment) & " ok <br>"
                
            Next
          End If
      Next
      
      Connect.Close
      set Connect=Nothing
      
      Response.redirect "msg_envoyee.asp?msg=!+Message(s)+de+la+boîte+d'envoi+supprimé+!"

    Case "msg_delete" : 'Supprime un message

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      
      if Request.Querystring("A2") = "msg_reception" then
		
        SQL = "DELETE FROM MESSAGE WHERE mID_message=" & Request.Querystring("msg_ID") & ""
        Connect.Execute(SQL)	

        Connect.Close
        set Connect=Nothing

	Response.redirect "msg_reception.asp?msg=!+Message+de+la+boîte+de+réception+supprimé+!"
	
      end if

      if Request.Querystring("A2") = "msg_envoyee" then

        SQL = "DELETE FROM MESSAGE_ENVOYEE WHERE mID_message=" & Request.Querystring("msg_ID") & ""
        Connect.Execute(SQL)

        Connect.Close
        set Connect=Nothing
        
        Response.redirect "msg_envoyee.asp?msg=!+Message+de+la+boîte+d'envoi+supprimé+!"
      
      end if
     	

    Case Else : 'autre choix erreur
      Response.redirect "../auth/index.asp"
End select

%>
