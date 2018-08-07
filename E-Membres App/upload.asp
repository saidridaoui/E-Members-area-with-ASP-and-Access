

<%

'*****************************************************
'* fonction qui permet de tester si le fichier existe
'*****************************************************
Function TestExisteFichier(NouveauNom)

    'définition du chemin absolu au fichier
    Set FSO = Server.CreateObject("Scripting.FileSystemObject")
    nom_fich = NouveauNom
    chemin_fichier = Server.MapPath((".") & "\..\upload\img\" & NouveauNom)

    'test de son existence
    if FSO.FileExists(chemin_fichier) then

      Set FSO = Server.CreateObject("Scripting.FileSystemObject")
      nom_fich = NouveauNom
      set filePt = FSO.GetFile(Server.MapPath((".") & "\..\upload\img\" & NouveauNom))

      filePt.Delete 'efface fichier
      
      Set FSO = Nothing


      Set Myobj = Server.CreateObject("Scripting.FileSystemObject")
      Set ChopFichier = Myobj.GetFile(Server.MapPath(".") & "\..\upload\" & GetFileName("file1"))
      ChopFichier.Move(Server.MapPath((".") & "\..\upload\img\" & NouveauNom))

      Set Myobj = Nothing
      Set ChopFichier = Nothing

    else

      Set Myobj = Server.CreateObject("Scripting.FileSystemObject")
      Set ChopFichier = Myobj.GetFile(Server.MapPath(".") & "\..\upload\" & GetFileName("file1"))
      ChopFichier.Move(Server.MapPath((".") & "\..\upload\img\" & NouveauNom))

      Set Myobj = Nothing
      Set ChopFichier = Nothing

    end If

    Set FSO = Nothing
    
End Function


'*****************************************************
'* fonction qui permet de recup le nom du fichier
'*****************************************************

Function GetFileName(aField)
    Dim x2, i
    x = Instr(requestData, rLine & "Content-Disposition: form-data; name=" & Chr(34) & aField & Chr(34))
    x = Instr(x, requestData, "filename=" & Chr(34))
    x2 = Instr(x, requestData, vbCrLf)
    For i = x2 To x Step -1
        If Mid(requestData,i,1) = "\" Then
            x = i - 9
            Exit For
        End If
    Next
    GetFileName = Mid(requestData, x+10, x2-(x+11))
End Function

'*****************************************************
'* exemple pour recup value d'un champ supplementaire
'*****************************************************

Function GetName(aField)
    Dim x,x1,x2
    x = Instr(requestData, rLine & "Content-Disposition: form-data; name=" & Chr(34) & aField & Chr(34))
    if x<>"0" then 
     x2 = Instr(x, requestData, vbCrLf) 'debut ligne qui contient CR (sur x)
     x = Instr(x2+1, requestData, vbCrLf) 'cherche debut value
     x1 = Instr(x+3, requestData, vbCrLf) 'cherche fin value
     GetName = Mid(requestData, x,x1-x)
    else
     GetName =  aField & " : not found" 
    end if
End Function

'*****************************************************
'* fonction qui permet de recup le data du fichier 
'*****************************************************

Function GetFileData(aField)
    Dim x2
    x = Instr(requestData, rLine & "Content-Disposition: form-data; name=" & Chr(34) & aField & Chr(34))
    x = Instr(x, requestData, vbCrLf)
    x = Instr(x+1, requestData, vbCrLf)
    x = Instr(x+1, requestData, vbCrLf) + 2
    x2 = Instr(x, requestData, Left(rLine,Len(rLine)-2))
    GetFileData = Mid(requestData, x+2, x2-x-4)
End Function

'*****************************************************
' fonction qui permet de recup le content-type 
'*****************************************************

Function GetContentType(aField)
    Dim x,x2
    x = Instr(requestData, rLine & "Content-Disposition: form-data; name=" & Chr(34) & aField & Chr(34))
    x = Instr(x, requestData, "Content-Type:")
    x2 = Instr(x, requestData, vbCrLf)
    GetContentType = Mid(requestData, x+13, x2-(x+13))
End Function


'*****************************************************
' test si le formulaire est validé
'*****************************************************

if Request.TotalBytes <> 0 then

 'recup des donnees du formulaire
 RequestBin = Request.BinaryRead(Request.TotalBytes)



'taille du fichier 90Ko
 if LenB(RequestBin) < 900000 then
 'convertion unicode vers ascii
 For i = 1 To LenB(RequestBin) 
  requestData = requestData & Chr(AscB(MidB(RequestBin, i, 1))) 
 Next
  
 'recup de la signature (hash)  
 rLine = Left(requestData, Instr(requestData,vbCrLf)+1)
 filename = Server.MapPath(".") & "\..\upload\" & GetFileName("file1")
 
 'creation du fichier
 Set FSO = Server.CreateObject("Scripting.FileSystemObject")
 Set TS = FSO.CreateTextFile(filename, True, False)
 TS.Write GetFileData("file1")
 TS.Close
 
   'response.write "fichier enregistrer sur : " & filename
 else
   Response.redirect "modif_infos.asp?Lien=1&msg_conn3=!+Taille+limité+à+100Ko+!"
 end if
 

end if


%>

