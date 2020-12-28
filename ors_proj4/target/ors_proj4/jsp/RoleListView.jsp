<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="in.co.sunrays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<!-- <head>
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
	var en=document.forms[0].elements[2].name;
	if(en!=undefined & en.indexOf("chk_")!=-1)
	{	
		document.forms[0].elements[2].checked=document.frm.chk_all.unchecked;
	}	
}
</script>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head> -->



<head>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" />
<title>Role list Page</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>


</head>

<body>

	<%@include file="Header.jsp"%>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.RoleBean"
		scope="request"></jsp:useBean>

	<center>
		<h1>Role List</h1>
		<h3>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h3>


		<form action="<%=ORSView.ROLE_LIST_CTL%>" name="frm" method="post">
			<%
				List list = ServletUtility.getList(request);
			%>
			<%
				if (list.size() != 0) {
			%>
			<%
				List rolelist = (List) request.getAttribute("roleList");
			%>
			<table width="100%">
				<tr>
					<td align="center"><label>Name : </label><%=HTMLUtility.getList("roleId", String.valueOf(bean.getId()), rolelist, "Name")%>
						&emsp; <input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=RoleListCtl.OP_SEARCH%>"> <input
						style="padding: 2px; width: 90px" type="submit" name="operation"
						value="<%=RoleListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<table border="2" width="100%">
				<tr align="center">
					<th style="width: 100px"><input type="checkbox"
						id="select_all" name="ids">Select All</th>
					<th>S.No.</th>
					<th>Id</th>
					<th>Name</th>
					<th>Descriptiop</th>
					<th>Edit</th>
				</tr>


				<%
					RoleModel model = new RoleModel();
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				RoleBean rBean = null;
				Iterator<RoleBean> it = list.iterator();
				while (it.hasNext()) {
					rBean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" class="checkbox"
						name="ids" value="<%=rBean.getId()%>"
						<%=(bean.getId() == rBean.getId() || rBean.getId() == RoleBean.ADMIN) ? "disabled" : ""%>></td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=rBean.getId()%>
					<td align="center"><%=rBean.getName()%></td>
					<td align="center"><%=rBean.getDescription()%></td>
					<td align="center">
						<%
							if (rBean.getId() != 1) {
						%> <a href="RoleCtl?id=<%=rBean.getId()%>">Edit</a>
					</td>
					<%
						}
					%>
				</tr>

				<%
					}
				%>
			</table>

			<table width="100%">
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
				<tr>
					<%
						if (pageNo == 1) {
					%>
					<td><input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=RoleListCtl.OP_PREVIOUS%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td><input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>

					<td align="left"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=RoleListCtl.OP_NEW%>"></td>

					<td></td>

					<td align="center"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=RoleListCtl.OP_DELETE%>"
						<%if (list.size() == 0) {%> disabled="disabled" <%}%>></td>

					<%
						if (pageSize > list.size() || model.nextPK() - 1 == rBean.getId()) {
					%>
					<td align="right"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=RoleListCtl.OP_NEXT%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=RoleListCtl.OP_NEXT%>"></td>
					<%
						}
					%>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<%
				} else {
			%>
			<input style="padding: 2px; width: 90px" type="submit"
				name="operation" value="<%=RoleListCtl.OP_BACK%>">
			<%
				}
			%>
		</form>

	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>