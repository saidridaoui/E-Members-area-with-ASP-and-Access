<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Pr�nom : Said
'
' Description : Cha�ne de connexion pour la base de donn�e
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Set Connect = Server.CreateObject("ADODB.Connection")
ConnectDBQ="DRIVER={Microsoft Access Driver (*.mdb)};"&"DBQ="&Server.MapPath(".")&"/db/bdEMembres.mdb;PWD=;"
Connect.Open ConnectDBQ

%>
