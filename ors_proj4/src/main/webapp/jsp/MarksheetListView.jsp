<%@page import="in.co.sunrays.proj4.model.MarksheetModel"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>

<head>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/logo.png" />
<title>Marksheet list Page</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>


</head>
<body>
	<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.StudentBean"
		scope="request"></jsp:useBean>
	<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
		scope="request"></jsp:useBean>
	<%
		List studentList = (List) request.getAttribute("studentList");
	%>
	<%@include file="Header.jsp"%>
	<center>
		<h1>Marksheet List</h1>
		<h3>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h3>
		<br>
		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" name="frm"
			method="POST">
			<%
				List list = ServletUtility.getList(request);
			%>
			<%
				if (list.size() != 0) {
			%>
			<table width="100%">
				<tr>
					<td align="center"><label style="font-size: 15px">
							Name :</label> <%=HTMLUtility.getList("studentId", String.valueOf(bean.getStudentId()), studentList,
						"Student Name")%> &emsp; <label
						style="width: 200px; padding: 5px;">RollNo :</label> <input
						style="width: 200px; padding: 5px;" type="text" name="rollNo"
						placeholder="Enter Roll Number"
						value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
						<input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=MarksheetListCtl.OP_SEARCH%>">&emsp;
						<input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=MarksheetListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%">
				<tr>
					<th style="width: 100px"><input type="checkbox"
						id="select_all" name="ids">Select All</th>
					<th>S.No</th>
					<th>RollNo</th>
					<th>Name</th>
					<th style="width: 8%;">Physics</th>
					<th style="width: 8%;">Chemistry</th>
					<th style="width: 8%;">Maths</th>
					<th style="width: 8%;">Total</th>
					<th style="width: 8%;">Percentage</th>
					<th style="width: 8%;">Result</th>
					<th style="width: 8%;">Edit</th>
				</tr>

				<%
					MarksheetModel model = new MarksheetModel();
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						int index = ((pageNo - 1) * pageSize) + 1;

					
						Iterator<MarksheetBean> it = list.iterator();

						while (it.hasNext()) {

							bean = it.next();
							int total = bean.getPhysics() + bean.getChemistry() + bean.getMaths();
							float per = total / 3;
				%>
				<tr align="center">
					<td><input type="checkbox" class="checkbox" name="ids"
						value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getPhysics()%></td>
					<td><%=bean.getChemistry()%></td>
					<td><%=bean.getMaths()%></td>
					<td><%=total%></td>
					<td><%=per%>%</td>
					<td><%=DataUtility.result(per, bean.getPhysics(), bean.getChemistry(), bean.getMaths())%></td>
					<td><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
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
						name="operation" value="<%=MarksheetListCtl.OP_PREVIOUS%>"
						disabled="disabled"></td>
					<%
						} else {
					%>
					<td><input style="padding: 2px; width: 90px;" type="submit"
						name="operation" value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td align="left"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEW%>"></td>
					<td></td>
					<td align="center"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_DELETE%>"
						<%if (list.size() == 0) {%> disabled="disabled" <%}%>></td>
					<%
						if (pageSize > list.size() || model.nextPK() - 1 == bean.getId()) {
					%>
					<td align="right"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>" disabled="disabled"></td>
					<%
						} else {
					%>
					<td align="right"><input style="padding: 2px; width: 90px;"
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>"></td>
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
				name="operation" value="<%=MarksheetListCtl.OP_BACK%>">
			<%
				}
			%>
		</form>

	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>