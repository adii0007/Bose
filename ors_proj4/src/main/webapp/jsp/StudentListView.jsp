<%@page import="in.co.sunrays.proj4.model.StudentModel"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page import="in.co.sunrays.proj4.controller.StudentListCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.StudentBean"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
<html>
<!-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function checkedAll()
{
	
	var totalElement=document.forms[0].elements.length;
	for(var i=0;i<totalElement;i++){
		var en=document.forms[0].elements[i].name;
		
		if(en!=undefined & en.indexOf("chk_")!=-1)
		{	
			document.forms[0].elements[i].checked=document.frm.chk_all.checked;
		 
		}		
	}
}
function check(){
	var en=document.forms[0].elements[4].name;
	if(en!=undefined & en.indexOf("chk_")!=-1)
	{	
		document.forms[0].elements[4].checked=document.frm.chk_all.unchecked;
	}	
}
</script>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head> -->


<head>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" />
<title>Student list Page</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>


</head>



<%@include file="Header.jsp"%>
<body>

	
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.StudentBean" scope="request"></jsp:useBean>
	<jsp:useBean id="collBean" class="in.co.sunrays.proj4.bean.CollegeBean" scope="request"></jsp:useBean>
	<center>
		<h1>Student List</h1>

			<h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			
			<font color="green"><%= ServletUtility.getSuccessMessage(request) %></font>
			</h3>	
			
			
		<form action="<%=ORSView.STUDENT_LIST_CTL%>" name="frm" method="post">
		<%List list = ServletUtility.getList(request); %>
		<%if(list.size()!=0) { %>
		<%List collList = (List)request.getAttribute("collList"); %>
			<table width="100%">
				<tr>
					<td align="center">
						<label>College : </label><%=HTMLUtility.getList("collegeid", String.valueOf(bean.getCollegeId()), collList, "College") %>&emsp;
						<label> FirstName :</label> <input style="width: 200px; padding: 5px;" type="text" name="firstName" placeholder="Enter First Name"
						value="<%=ServletUtility.getParameter("firstName", request)%>">&emsp;
						<label>LastName :</label> <input style="width: 200px; padding: 5px;" type="text" name="lastName" placeholder="Enter Last Name"
						value="<%=ServletUtility.getParameter("lastName", request)%>">&emsp;
						
						<input style="padding: 2px; width: 90px;" type="submit" name="operation"
						value="<%=StudentListCtl.OP_SEARCH%>">&emsp;
						<input style="padding: 2px; width: 90px;" type="submit" name="operation" value="<%=StudentListCtl.OP_RESET%>">
				</tr>
			</table>
			<br>
			
			<table border="1" width="100%">
				
				<tr>
					<th style="width: 100px"><input type="checkbox"
						id="select_all" name="ids">Select All</th>
					<th>S.No.</th>
					<th>College Name</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date Of Birth</th>
					<th>Mobile No</th>
					<th>Email ID</th>
					<th>Edit</th>
				</tr>
				
				<%	StudentModel model = new StudentModel();
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					StudentBean sbean = null;
					Iterator<StudentBean> it = list.iterator();

					while (it.hasNext()) {

						sbean = it.next();
				%>
				
				<tr align="center">
				 	<td><input type="checkbox" class="checkbox" name="ids" value="<%=sbean.getId() %>"></td>
					<td><%=index++%></td>
					<td><%=sbean.getCollegeName()%></td>
					<td><%=sbean.getFirstName()%></td>
					<td><%=sbean.getLastName()%></td>
					<td><%=sbean.getDob()%></td>
					<td><%=sbean.getMobileNo()%></td>
					<td><%=sbean.getEmail()%></td>
					<td><a href="StudentCtl?id=<%=sbean.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
		
			
			<table width="100%">
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td><input style="padding: 2px; width: 90px;" type="submit" name="operation" value="<%=StudentListCtl.OP_PREVIOUS%>" <%if(pageNo==1){ %>disabled="disabled"<%} %>></td>
					<td align="left"><input style="padding: 2px; width: 90px;" type="submit" name="operation" value="<%=StudentListCtl.OP_NEW%>"></td>
					<td></td>
					<td align="center"><input style="padding: 2px; width: 90px;" type="submit" name="operation" value="<%=StudentListCtl.OP_DELETE%>" <%if(list.size()==0){ %>disabled="disabled"<%} %>></td>
					
					<td align="right"><input style="padding: 2px; width: 90px;" type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEXT%>" <%if(pageSize > list.size() || model.nextPK()-1 == sbean.getId()){ %>disabled="disabled"<%} %>></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"><input
				type="hidden" name="pageSize" value="<%=pageSize%>">

		<%}else{ %>
		<input style="padding: 5px; width: 100px;" type="submit" name="operation" value="<%=StudentListCtl.OP_BACK%>"> 
		<%} %>
		</form>
		
		<%@ include file="Footer.jsp"%>
	</center>

</body>
</html>