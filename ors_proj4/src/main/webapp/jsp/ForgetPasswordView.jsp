<%@page import="in.co.sunrays.proj4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<body>

	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">.
	<link rel="stylesheet" type="text/css" href="../js/jquery-ui.css"></link>

		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<center>
		
			<h1>Forgot your password?</h1>
			<input type="hidden" name="id" value="<%=bean.getId()%>">



			<table aling = "center">
				<lable>Submit your email address and we'll send you
				password.</lable>
				
				<H2><font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font></H2>
				
				<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			
			</table>
		          <table align="center">
                <tr>
                    <th align="left">Login Id<font style="color: red">*</font></th>
                    <td><input style="positon:fixed;width: 200px; padding: 3px;" type="text" name="login" placeholder="Enter Your Login-Id"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>">&emsp;&emsp;<font style="position:fixed;"
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr><tr></tr><tr></tr>
                <tr>
                </tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                <td></td>
                    <td> <input  style="width: 90px; padding: 2px;" type="submit" name="operation"
                        value="<%=ForgetPasswordCtl.OP_GO %>"> 
                        <input  style="width: 90px; padding: 2px;" type="submit" name="operation" 
                        value="<%=ForgetPasswordCtl.OP_RESET %>"> &nbsp;</td><br>
                </tr>
                <tr></tr>
				</table>
				<br>
				<table>
				
			
				</table>
				
				
			
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>