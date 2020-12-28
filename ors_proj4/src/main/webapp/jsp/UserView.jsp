<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../js/jquery-ui.css"></link>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd/mm/yy',
			defaultDate : "01/01/1982",
			changeMonth : true,
			changeYear : true,
			yearRange : '-35:-18'
		});
	});
</script>
<!-- <link rel="stylesheet" type="text/css" href="../format.css"></link> -->
</head>
<body>
	<form action="<%=ORSView.USER_CTL%>" method="post">
		<%@ include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("roleList");
		%>

		<center>
			<%
				if (bean.getId() > 0) {
			%>
			<h1>Update User</h1>
			<%
				} else {
			%>
			<h1>Add User</h1>
			<%
				}
			%>
			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>



			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


			<table align="center" style="margin-left: 38%">
				<tr>
					<th align="left">First Name<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="firstName" placeholder="Enter First Name"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
				</tr>
				<tr>
					<th align="left">Last Name<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="lastName" placeholder="Enter Last Name"
						value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
				</tr>
				<tr>
					<th align="left">LoginId<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="login" placeholder="Enter Login-Id"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"
						<%=(bean.getId() > 0) ? "readonly" : ""%>><font
						color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
				</tr>
				<%
					if (bean.getId() > 0 && bean != null) {
				%>
				<tr>
					<td><input type="hidden" name="password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"></td>
					<td><input type="hidden" name="confirmPassword"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<th align="left">Password<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="password"
						name="password" placeholder="Enter Password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
				</tr>
				<tr>
					<th align="left">Confirm Password<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="password"
						name="confirmPassword" placeholder="Re-Enter Password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th align="left">Gender<font style="color: red">*</font></th>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");

							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map, "Gender");
						%> <%=htmlList%><font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
					</td>
				</tr>
				<tr>
					<th align="left">Role<font style="color: red">*</font></th>
					<td><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), l, "Role")%><font
						color="red"> <%=ServletUtility.getErrorMessage("roleId", request)%></font></td>
				</tr>
				<tr>
					<th align="left">Date Of Birth<font style="color: red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="dob" placeholder="Click Here" id="datepicker"
						readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getDob())%>"> <font
						color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>
				<tr>
					<th align="left">Contact No<font color="red">*</font></th>
					<td><input style="width: 200px; padding: 5px;" type="text"
						name="mobileNo" placeholder="Enter Contact No"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<%
					if (bean.getId() > 0) {
				%>
				<th></th>
				<th></th>
				<th></th>
				<tr>

					<th></th>
					<td><input style="width: 90px; padding: 2px;" type="submit"
						name="operation" value="<%=UserCtl.OP_UPDATE%>"> &nbsp;<input
						style="width: 90px; padding: 2px;" type="submit" name="operation"
						value="<%=UserCtl.OP_CANCEL%>"> <%
 	} else {
 %>
				<tr>
					<th></th>
					<td><input style="width: 90px; padding: 2px;" type="submit"
						name="operation" value="<%=UserCtl.OP_SAVE%>"> &nbsp; <input
						style="width: 90px; padding: 2px;" type="submit" name="operation"
						value="<%=UserCtl.OP_RESET%>"></td>
				</tr>
				<%
					}
				%>

			</table>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>