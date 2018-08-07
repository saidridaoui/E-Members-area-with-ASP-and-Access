<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Nom    : Ridaoui
' Prénom : Said
'
' Description : USER
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            Select Case Request.QueryString("A2")

              Case "refuser" :

                %>
                <!--#include file="../auth/connect.asp"-->
                <%
                Set RS = Server.CreateObject("ADODB.Recordset")
                SQL= "SELECT * FROM USER WHERE uLogin='" & Request.QueryString("ulog") & "' "
                RS.Open SQL,Connect,1,2,1	
	
                RS("uStatus") = False
          
	        RS.UpdateBatch
                RS.Close
                Set RS = Nothing

                Connect.Close
                Set Connect = Nothing
                
                Response.Redirect "admin.asp?A=user"
                
              Case "accepter" :

                %>
                <!--#include file="../auth/connect.asp"-->
                <%
                Set RS = Server.CreateObject("ADODB.Recordset")
                SQL= "SELECT * FROM USER WHERE uLogin='" & Request.QueryString("ulog") & "' "
                RS.Open SQL,Connect,1,2,1	
	
                RS("uStatus") = True

	        RS.UpdateBatch
                RS.Close
                Set RS = Nothing

                Connect.Close
                Set Connect = Nothing
                
                Response.Redirect "admin.asp?A=user"

            End select
%>
