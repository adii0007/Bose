<%@page import="in.co.sunrays.proj4.controller.RoleCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head>
<body>
       <form action ="<%=ORSView.ROLE_CTL%>" method="post">
       <%@ include file ="Header.jsp"%>
       
       <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.RoleBean"
			scope="request"></jsp:useBean>

       <center>
       
       <% 
       
       if(bean.getId() > (0)) {
       
       %>
       <h1>Update role</h1>
       <%
       }  else  {
       %>
       <h1>Add Role</h1>
       <%
       }
       %>
       <H2>
       <font colour = "green"><%=ServletUtility.getSuccessMessage(request)%>
       </font>
       </H2>
       
       <h2> 
       <font colour = "red"><%=ServletUtility.getErrorMessage(request) %>
       </font>          
       </h2>
       
       <input type="hidden" name="id" value="<%=bean.getId()%>">
       
       <input type ="hidden" name="createdby" value="<%=bean.getCreatedBy()%>">
       
       <input type ="hidden" name="modified" value="<%=bean.getModifiedBy()%>">
        
        <table align="center" style="margin-left: 40%">
        
        <tr>
					<th align="left">Name<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="name" placeholder="Enter Name"
						value="<%=DataUtility.getStringData(bean.getName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
				</tr>
				
				
				
				<tr>
					<th align="left">Description<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="description" placeholder="Enter Description"
						value="<%=DataUtility.getStringData(bean.getDescription())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("description", request)%></font></td>
				</tr>
				
				
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<%
					if (bean.getId() > 0) {
				%>

				<tr>
					<th></th>
					<td><input style="width: 90px; padding: 2px;" type="submit"
						name="operation" value="<%=RoleCtl.OP_UPDATE%>"> &nbsp;<input
						style="width: 90px; padding: 2px;" type="submit" name="operation"
						value="<%=RoleCtl.OP_CANCEL%>"> <%
 	} else {
 %>
				<tr>
					<th></th>
					<td><input style="width: 90px; padding: 2px;" type="submit"
						name="operation" value="<%=RoleCtl.OP_SAVE%>"> &nbsp; <input
						style="width: 90px; padding: 2px;" type="submit" name="operation"
						value="<%=RoleCtl.OP_RESET%>"></td>
				</tr>
				<%
					}
				%>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>