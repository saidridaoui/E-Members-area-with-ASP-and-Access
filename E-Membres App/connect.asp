<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Chaîne de connexion pour la base de donnée
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Set Connect = Server.CreateObject("ADODB.Connection")
ConnectDBQ="DRIVER={Microsoft Access Driver (*.mdb)};"&"DBQ="&Server.MapPath(".")&"/db/bdEMembres.mdb;PWD=;"
Connect.Open ConnectDBQ

%>
