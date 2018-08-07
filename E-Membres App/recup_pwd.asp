<%@ Language=VBScript %>

<%response.buffer=true%>

<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Envoi mail
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


%>
<!--#include file="connect.asp"-->
<!--#include file="include/config.inc.asp"-->
<!--#include file="include/fonctions.inc.asp"-->
<%

mail = Request.Form("email")

mail = Replace(mail, "<", "")
mail = Replace(mail, "'", "&#39")
mail = Replace(mail, ">", "")

SQL = "SELECT * FROM USER WHERE uMail='" & mail & "'"
SET rSC = Connect.Execute(SQL)

  'test si l'utilisateur existe
  if rSC.EOF then
    Response.redirect "lost_pwd.asp?msg=!+Cet+adresse+email+existe+pas+!"
  end if

  pass = DecryptText(rSC("uPassword"),"password")
  user = rSC("uLogin")

Connect.Close
Set Connect=Nothing

msg = "Bonjour,<br><br>Vous avez demandés à recevoir vos identifiants de connexion !<br>Voici vos identifiants :<br><br>Login : " & user & "<br>Password : " & pass & "<br><br>Pensez à changer votre password régulièrement !<br>____________________________________________________________________________________________<br><br>CECI EST UN EMAIL AUTOMATIQUE ! NE REPONDEZ PAS ! AUCUNE REPONSE NE VOUS SERA RETOURNEE !<br>____________________________________________________________________________________________<br>" & titre &" "

Dim objMail, strEnvoyeur, strDestinataire, strSujet, lngImportance, strMessage, strFichierAttache, strMess_resultat, strCopy

strMess_resultat = ""

' Propriété BodyFormat
Const CdoBodyFormatHTML	= 0	' Message en format HTML.
Const CdoBodyFormatText	= 1	' Message en format Texte (par default).

' Propriété MailFormat
Const CdoMailFormatMime	= 0	' Courriel en format MIME format.
Const CdoMailFormatText	= 1	' Courriel en format Texte (par default).

' Propriété Importance
Const CdoLow	= 0		' Priorité Basse
Const CdoNormal	= 1		' Priorité Normale (default)
Const CdoHigh	= 2		' Priorité Haute

' Récupérer les données du formulaire
strEnvoyeur     = mail_serveur
strDestinataire = Request.Form("email")

strCopy         = ""
strSujet        = mail_sujet
lngImportance   = mail_importance

'message au format html
strMessage = FaitHTML(strSujet, Replace(msg, vbcrlf, "<br />"))

' Ajouter cette ligne pour empècher l'affichage des erreurs
On error resume next
Set objMail  = Server.CreateObject("CDONTS.NewMail")
objMail.From = strEnvoyeur
objMail.To   = strDestinataire
objMail.Cc   = strCopy
objMail.Subject = strSujet
objMail.Body    = strMessage

objMail.BodyFormat = CdoBodyFormatHTML
objMail.MailFormat = CdoMailFormatMime

objMail.Importance = lngImportance
objMail.Send

strMess_resultat = "Le message a &eacute;t&eacute; envoy&eacute;"

Set objMail = Nothing

''''''''''''''''''''''''''''''''''''''''''''''''''''
' Fonction pour convertir un sujet et un message
' en document HTML.
''''''''''''''''''''''''''''''''''''''''''''''''''''
Function FaitHTML(nSujet, nBody)
  Dim txtTemp
  txtTemp = "<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//FR"">" & vbCrLf
  txtTemp = txtTemp & "<html>" & vbCrLf
  txtTemp = txtTemp & "<head>" & vbCrLf
  txtTemp = txtTemp & "<meta http-equiv=""Content-Type"""
  txtTemp = txtTemp & "content=""text/html; charset=iso-8859-1"">" & vbCrLf
  txtTemp = txtTemp & "<title>"
  txtTemp = txtTemp & nSujet
  txtTemp = txtTemp & "</title>" & vbCrLf
  txtTemp = txtTemp & "</head>" & vbCrLf
  txtTemp = txtTemp & "<body>" & vbCrLf
  txtTemp = txtTemp & nBody & vbCrLf
  txtTemp = txtTemp & "</body>" & vbCrLf
  txtTemp = txtTemp & "</html>"
  FaitHTML = txtTemp
End Function
''''''''''''''''''''''''''''''''''''''''''''''''''''
' Fin de la fonction "FaitHTML"
''''''''''''''''''''''''''''''''''''''''''''''''''''

''''''''''''''''''''''''''''''''''''''''''''''''''''
' FONCTION pour ouvrir et retourner un fichier texte
' si vous avez un peid de message ou autre fichier
' texte à ajouter au message.
' À utiliser comme ceci:
' txtTemp = txtTemp & LieFichier("C:\inetpub\wwwroot\...\pied.txt")
''''''''''''''''''''''''''''''''''''''''''''''''''''
Function LieFichier(FichierTexte)
  Dim txtTemp, objFS, objFL
  Set objFS = CreateObject("Scripting.FileSystemObject")
  Set objFL = objFS.OpenTextFile(FichierTexte)
  Do While Not objFL.AtEndOfStream
    txtTemp = txtTemp & objFL.ReadLine
    txtTemp = txtTemp & vbCrLf
  Loop	
  objFL.Close
  Set objFS = Nothing
  LieFichier = txtTemp
End Function
''''''''''''''''''''''''''''''''''''''''''''''''''''
' Fin de la fonction "LieFichier"
''''''''''''''''''''''''''''''''''''''''''''''''''''

%>

<%=strMess_resultat%>
<p>De : <%=strEnvoyeur%><br />
À : <%=strDestinataire%><br />
CC: <%=strCopy%><br />
Sujet: <%=strSujet%></p>
<p><%=strMessage%></p>


<%
Response.redirect "lost_pwd.asp?msg=1"
%>

