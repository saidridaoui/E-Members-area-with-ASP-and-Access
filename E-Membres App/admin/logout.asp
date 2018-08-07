<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Fermeture de toutes les sessions en cours
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

session.Abandon()
Response.Redirect("index.asp?Error=! Vous vous êtes deconnecté !")
%>
