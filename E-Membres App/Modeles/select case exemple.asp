
<a href="test.asp?lien=mod_ajout">ajouter des nouvelles donn�es</a> <b>|</b>
<a href="test.asp?lien=mod_dep">les d�partements</a> <b>|</b>
<a href="test.asp?lien=session">fermer la session</a> 

Select Case Request.QueryString("lien")

    Case "mod_ajout" :

    Case "mod_dep" :
 

    Case Else


End select
%>