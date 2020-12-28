<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>


<html>
<head>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head>


<body>

    <form action="<%=ORSView.LOGIN_CTL%>" method="post" >
        
        
      
         <%@ include file="Header.jsp"%> 
		
        
        
        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>
            
            
            
           
<jsp:useBean id="frontctl"
class="in.co.sunrays.proj4.controller.FrontController" scope="request">
</jsp:useBean>

<%
String uri = (String) request.getAttribute("URI");
//System.out.print("uri in");
%>
<input type="hidden" name="URI" value="<%=uri%>">
            
            
            
            

        <center>
        
            <h1 align="center">Login</h1>
			<% String mess  = (String)request.getAttribute("message");%>
            <H2>
               <font  color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
               </H2>
               <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%></font>
                <%if(mess!=null){ %>
                <font color="red"><%=request.getAttribute("message")%></font><%} %> <!--<%= mess%> -->
            </H2>
           <%--  <%String path = (String) request.getAttribute("repath"); %>
            <input type ="hidden" value=<%=path!=null ? path : "/WelcomeCtl"%> name="repath"> --%>
        
              <input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

			
            <table align="center" style="margin-left:40%"  style="min-height: 500px">
                <tr>
                    <th align="left">Login Id<font style="color: red">*</font></th>
                    <td><input style="positon:fixed;width: 200px; padding: 3px;" type="text" name="login" placeholder="Enter Your Login-Id"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>">&emsp;&emsp;<font style="position:fixed;"
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr><tr></tr><tr></tr>
                <tr>
                    <th align="left">Password<font style="color: red">*</font></th>
                    <td><input style="width: 200px; padding: 3px;" type="password"  name="password" placeholder="Enter Your Password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>">&emsp;&emsp;<font style="position:fixed;"
                        color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                <td></td>
                    <td> <input  style="width: 90px; padding: 2px;" type="submit" name="operation"
                        value="<%=LoginCtl.OP_SIGN_IN %>"> 
                        <input  style="width: 90px; padding: 2px;" type="submit" name="operation" 
                        value="<%=LoginCtl.OP_SIGN_UP %>"> &nbsp;</td><br>
                </tr>
                <tr></tr>
                <tr>
                <td></td>
                <td> <a href="<%=ORSView.FORGET_PASSWORD_CTL%>" style="margin-left: ;"><b>Forget my password?</b></a>&nbsp;</td>
            </tr>
            </table>
            
    </form>
     <%@ include file="Footer.jsp"%>
</body>
</html>