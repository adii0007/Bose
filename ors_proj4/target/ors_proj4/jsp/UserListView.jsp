<%@page import="in.co.sunrays.proj4.model.UserModel"%>
<%@page import="in.co.sunrays.proj4.model.AppRole"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>


<head>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" />
<title>User list Page</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>

<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head>


<!-- <head>
<script type="text/javascript">
	function checkedAll() {

		var totalElement = document.forms[0].elements.length;
		for (var i = 0; i < totalElement; i++) {
			var en = document.forms[0].elements[i].name;

			if (en != undefined & en.indexOf("chk_") != -1) {
				document.forms[0].elements[i].checked = document.frm.chk_all.checked;

			}
		}
	}
	function check() {
		var en = document.forms[0].elements[4].name;
		if (en != undefined & en.indexOf("chk_") != -1) {
			document.forms[0].elements[4].checked = document.frm.chk_all.unchecked;
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head> -->


<body>

	<%@include file="Header.jsp"%>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
		scope="request"></jsp:useBean>
	<jsp:useBean id="rBean" class="in.co.sunrays.proj4.bean.RoleBean"
		scope="request"></jsp:useBean>

	<center>
		<h1>User List</h1>

		<h3>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
		</h3>
		<h3>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h3>

		<form action="<%=ORSView.USER_LIST_CTL%>" name="frm" method="post">
			<%
				List list = ServletUtility.getList(request);
			%>

			<%
				if (list.size() != 0) {
			%>
			<%
				List roleliList = (List) request.getAttribute("rolelist");
			%>


			<table width="100%">
				<tr>
					<td align="center"><label>Role : </label><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), roleliList, "Role")%>
						&emsp;<label>First Name :</label> <input type="text"
						name="firstName" placeholder="Enter First Name"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
						&emsp; <label>LoginId:</label> <input type="text" name="login"
						placeholder="Enter Login-Id"
						value="<%=ServletUtility.getParameter("login", request)%>">
						&emsp; <input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=UserListCtl.OP_SEARCH%>">&emsp;&emsp;
						<input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=UserListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>

			<table border="2" width="100%">
				<tr align="center">
					<th style="width: 100px"><input type="checkbox" name="ids"
						id="select_all" />Select All</th>
					<th>S.No.</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>LoginId</th>
					<th>Contact No</th>
					<th>Gender</th>
					<th>Role</th>
					<th>DOB</th>
					<th>Edit</th>
				</tr>



				<%
					UserModel model1 = new UserModel();
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						int index = ((pageNo - 1) * pageSize) + 1;

						UserBean ubean = null;
						Iterator<UserBean> it = list.iterator();
						while (it.hasNext()) {
							ubean = it.next();
							RoleModel model = new RoleModel();
							RoleBean roleBean = model.findByPK(ubean.getRoleId());
				%>
				<tr align="center">
					<td><input type="checkbox" class="checkbox" name="ids"
						value="<%=ubean.getId()%>"
   <%if(ubean.getRoleId()==1) {%>
   <%="disabled"%><%} %>>
   </td>

					<td><%=index++%></td>
					<td><%=ubean.getFirstName()%></td>
					<td><%=ubean.getLastName()%></td>
					<td><%=ubean.getLogin()%></td>
					<td><%=ubean.getMobileNo()%></td>
					<td><%=ubean.getGender()%></td>
					<td><%=roleBean.getName()%></td>
					<td><%=ubean.getDob()%></td>

					<%
						if (ubean.getRoleId() == RoleBean.ADMIN) {
					%>
					<td>----</td>
					<%
						} else {
					%>
					<td><a href="UserCtl?id=<%=ubean.getId()%>">Edit</a></td>
					<%
						}
					%>
				</tr>
				<%
					}
				%>
			</table>
			
			<table width="100%">
				<tr>
					<%
						if (pageNo == 1) {
					%>
					<td><input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=UserListCtl.OP_PREVIOUS%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td><input style="padding: 2px; width: 90px" type="submit"
						name="operation" value="<%=UserListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td align="center">&emsp;&emsp;&emsp;&emsp;<input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=UserListCtl.OP_NEW%>"></td>
							<td aling="right"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=UserListCtl.OP_DELETE%>"
						<%if (list.size() == 0) {%> disabled="disabled" <%}%>></td>&emsp;&emsp;&emsp;

					<%
						if (pageSize > list.size() || model1.nextPK() - 1 == ubean.getId()) {
					%>
					&emsp;&emsp;&emsp;<td align="right"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=UserListCtl.OP_NEXT%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input style="padding: 2px; width: 90px"
						type="submit" name="operation" value="<%=UserListCtl.OP_NEXT%>"></td>
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
			<input type="submit" style="padding: 5px; width: 100px;"
				name="operation" value="<%=UserListCtl.OP_BACK%>">
			<%
				}
			%>
		</form>

	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>