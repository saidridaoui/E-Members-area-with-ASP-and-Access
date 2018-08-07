
<a href="test.asp?lien=mod_ajout">ajouter des nouvelles données</a> <b>|</b>
<a href="test.asp?lien=mod_dep">les départements</a> <b>|</b>
<a href="test.asp?lien=session">fermer la session</a> 

Select Case Request.QueryString("lien")

    Case "mod_ajout" :

    Case "mod_dep" :
 

    Case Else


End select
%>