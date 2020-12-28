<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.CollegeModel"%>
<%@page import="in.co.sunrays.proj4.model.UserModel"%>
<%@page import="in.co.sunrays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>

<head>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" />
<title>College list Page</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>


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
		var en = document.forms[0].elements[3].name;
		if (en != undefined & en.indexOf("chk_") != -1) {
			document.forms[0].elements[3].checked = document.frm.chk_all.unchecked;
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head> -->
<body>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
	<%@include file="Header.jsp"%>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CollegeBean"
		scope="request"></jsp:useBean>
	<center>
		<h1>College List</h1>
		<h3>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h3>



		<form action="<%=ORSView.COLLEGE_LIST_CTL%>" name="frm" method="POST">
			<%
				List list = ServletUtility.getList(request);
				List collegeList = (List) request.getAttribute("collegeList");
			%>
			<%
				if (list.size() != 0) {
			%>
			<table width="100%">
				<tr>
					<td align="center"><label> Name : </label><%=HTMLUtility.getList("collegeId", String.valueOf(bean.getId()), collegeList, "College")%>&emsp;
						<label>City :</label> <input style="padding: 3px; width: 200px;"
						type="text" name="city" placeholder="Enter City"
						value="<%=ServletUtility.getParameter("city", request)%>">&emsp;
						<input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=CollegeListCtl.OP_SEARCH%>">
						&emsp;<input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=CollegeListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<table border="2" width="100%">
				<tr>
					<th style="width: 100px"><input type="checkbox"
						id="select_all" name="ids">Select All</th>
					</th>
					<th>S.No.</th>
					<th>Name</th>
					<th>Address</th>
					<th>State</th>
					<th>City</th>
					<th>PhoneNo</th>
					<th>Edit</th>
				</tr>

				<%
					CollegeModel model = new CollegeModel();
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						int index = ((pageNo - 1) * pageSize) + 1;

						CollegeBean cBean = null;
						Iterator<CollegeBean> it = list.iterator();
						while (it.hasNext()) {

							cBean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" class="checkbox" name="ids"
						value="<%=cBean.getId()%>">
					<td><%=index++%></td>
					<td><%=cBean.getName()%></td>
					<td><%=cBean.getAddress()%></td>
					<td><%=cBean.getState()%></td>
					<td><%=cBean.getCity()%></td>
					<td><%=cBean.getPhoneNo()%></td>
					<td><a href="CollegeCtl?id=<%=cBean.getId()%>">Edit</a></td>
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
					<%
						if (pageNo == 1) {
					%>
					<td><input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=CollegeListCtl.OP_PREVIOUS%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td><input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=CollegeListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>

					<td align="left"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation" value="<%=CollegeListCtl.OP_NEW%>"></td>

					<td></td>

					<td align="center"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation"
						value="<%=CollegeListCtl.OP_DELETE%>" <%if (list.size() == 0) {%>
						disabled="disabled" <%}%>></td>

					<%
						if (pageSize > list.size() || model.nextPK() - 1 == cBean.getId()) {
					%>
					<td align="right"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation" value="<%=CollegeListCtl.OP_NEXT%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation" value="<%=CollegeListCtl.OP_NEXT%>"></td>
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
			<input style="padding: 2px; width: 90px;" type="submit"
				name="operation" value="<%=CollegeListCtl.OP_BACK%>">
			<%
				}
			%>
		</form>

	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>