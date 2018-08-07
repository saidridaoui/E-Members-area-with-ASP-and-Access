<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : Verification des données pour la modification d'un compte
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Select Case Request.QueryString("A")

    Case "connexion" :

      'champs vides
      if Request.Form("pass1")="" OR Request.Form("pass2")="" OR Request.Form("mail")="" then
        Response.redirect "modif_infos.asp?msg_conn=!+Les+champs+suivis+de+*+sont+obligatoires+!"
      end if

      'test mot de passe identique
      if Request.Form("pass1") <> Request.Form("pass2") then
        Response.redirect "modif_infos.asp?msg_conn=!+Les+mot+de+passe+doivent+être+identique+!"
      end if

      %>
      <!--#include file="../auth/connect.asp"-->
      <%

      'test si l'adresse e-mail est deja prise ou si elle lui appartient déjà
      SQL = "SELECT * FROM USER WHERE (((USER.uLogin)='" & session("user") & "') AND ((USER.uMail)='" & Request.Form("mail") & "')) "
      SET rSC = Connect.Execute(SQL)


      'adresse mail lui appartient, on faire rien
      if NOT rSC.EOF Then
      
        %>
        <!--#include file="../include/fonctions.inc.asp"-->
        <%

        pass = encrypttext(Request.Form("pass1"),"password")

        response.write pass

        'Modification des données
        Set RS = Server.CreateObject("ADODB.Recordset")
        SQL= "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
        RS.Open SQL,Connect,1,2,1	

        RS("uPassword") = pass
        RS("uMail")     = Request.Form("mail")
	
        RS.UpdateBatch
        RS.Close
        Set RS = Nothing

        Connect.Close
        Set Connect = Nothing
      
        Response.redirect "modif_infos.asp?msg_conn=!+Modification+OK+!"
      End if


      SQL = "SELECT * FROM USER WHERE uMail='" & Request.Form("mail") & "'"
      SET rSC = Connect.Execute(SQL)

      'adresse mail ne lui appartient pas, message erreur
      if NOT rSC.EOF then

        if lcase(Request.Form("mail")) = rSC("uMail") then
          Response.redirect "modif_infos.asp?msg_conn=!+Cette+adresse+email+est+déjà+enregistrée+!"
        end if
      end if


      Connect.Close
      Set Connect=Nothing


      %>
      <!--#include file="../auth/connect.asp"-->
      <!--#include file="../include/fonctions.inc.asp"-->
      <%

      pass = encrypttext(Request.Form("pass1"),"password")

      'Modification des données
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
      RS.Open SQL,Connect,1,2,1	
      
      RS("uPassword") = pass
      RS("uMail") = Request.Form("mail")
	
      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Connect.Close
      Set Connect = Nothing
		
      Response.redirect "modif_infos.asp?msg_conn=!+Modification+OK+!"


    Case "profil" :

      'test le sexe et date nais.
      if Request.Form("sx") = "" OR Request.Form("ladate") = "" then
        Response.redirect "modif_infos.asp?msg_conn2=!+Les+champs+suivis+de+*+sont+obligatoires+!&#aaa"
      end if
      
      'newsletter
      if Request.Form("ns") = ""  then
        newsletter = false
      else
        newsletter = true
      end if
      
      'description
      if Request.Form("ds") = ""  then
        des = "-"
      else
        des = Request.Form("ds")
      end if

      comments = Replace(des, "<", "")
      comments = Replace(des, "'", "&#39")
      comments = Replace(des, ">", "")

      'enlève le (http://)
      fldLien = Request.Form("url")

      if Lcase(Left(fldLien,7))="http://" then
        fldLien= Right(fldLien,(Len(fldLien)-7))
      end if  


      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      'Modification des données
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
      RS.Open SQL,Connect,1,2,1	

      RS("uNom")        = Request.Form("nm")
      RS("uPrenom")     = Request.Form("pre")
      RS("uEtat_civil") = Request.Form("et")
      RS("uSexe")       = Request.Form("sx")
      RS("uDate_naiss") = Request.Form("ladate")
      RS("uVille")      = Request.Form("vil")
      RS("uDescription")= comments
      RS("uUrl")        = fldLien
      RS("uMsn")        = Request.Form("msn")
      RS("uNewsletter") = newsletter
      RS("uStatus")     = true
      

      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Connect.Close
      Set Connect = Nothing
		
      Response.redirect "modif_infos.asp?msg_conn2=!+Modification+OK+!&#aaa"
      
    Case "avatar" :

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      'Modification des données
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
      RS.Open SQL,Connect,1,2,1	

      RS("uPhoto")        = Request.form("avt")

      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Response.redirect "modif_infos.asp?Lien=2&msg_conn3=!+Votre+avatar+a+été+modifié+!"
      
      
    Case "photo" :

      %>
      <!--#include file="../upload.asp"-->
      <%
      
      renamefile = TestExisteFichier(session("user") & ".jpg")

      %>
      <!--#include file="../auth/connect.asp"-->
      <%
      
      lien =  "../upload/img/" & session("user") & ".jpg"
      
      'Modification des données
      Set RS = Server.CreateObject("ADODB.Recordset")
      SQL= "SELECT * FROM USER WHERE uLogin='" & session("user") & "'"
      RS.Open SQL,Connect,1,2,1	

      RS("uPhoto")        = lien

      RS.UpdateBatch
      RS.Close
      Set RS = Nothing

      Response.redirect "modif_infos.asp?Lien=1&msg_conn3=!+Votre+photo+a+été+modifié+!"


    Case Else : 'autre choix erreur    Case Else
      Response.redirect "../auth/index.asp"
End select
%>
