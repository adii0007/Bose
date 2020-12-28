<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page import="in.co.sunrays.proj4.bean.UserBean"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<html>

<body >
    <form action="<%=ORSView.WELCOME_CTL%>">
        <%@ include file="Header.jsp"%> 
                    <h1 align="Center">
                    <br>
                    <br>
                    <br>
                        <font size="50px;" color="red">Welcome to ORS </font>
                    </h1>
                    
                <br><br><br><br><br><br><br>
                
                    
        
                    <%
                    UserBean beanUserBean = (UserBean) session.getAttribute("user");
                        if (beanUserBean != null) {
                            if (beanUserBean.getRoleId() == RoleBean.STUDENT) {
                    %> 
        
                    <h2 align="Center">
                        <a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your Marksheet </a>
                    </h2>
                     
                      <%
                            }
                        }
                     %> 
                
                </form>
        
         <%@ include file="Footer.jsp"%>
</body>
</html>