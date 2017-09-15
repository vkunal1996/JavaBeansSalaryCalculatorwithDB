<%-- 
    Document   : AdminPanel
    Created on : Sep 13, 2017, 11:43:54 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminPanel</title>
        <style>
            #body
            {
                
                height:660px;
                width:1340px;
                background-color: aqua;
                background-image:url("images/mainBackground.jpg");
                margin-left: auto;
                margin-right: auto;
            }
            #mainheading
            {
                color:darkblue;
                font-family: fantasy;
                font-size: 50px;
            }
            th.header
            {
                text-align: left;
                font-family: sans-serif;
                font-size: 20px;
            }
            #button
            {
                width:90px;
                background: cyan;

                border-color: cyan;
            }
       </style>
    </head>
    <body id="body">
    <center><h1 id="mainheading">Choose Options</h1></center>
    <div>
            <%
                try{
               Connection cn;
               PreparedStatement st;
               ResultSet rs;
               String sql;
               String url;
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                
                url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Salary;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                String uname=request.getParameter("user");
                String pass=request.getParameter("password");
                HttpSession s1=request.getSession(true);
               
               
                
                sql="Select * from AdminPanel where Username=? and Password=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setString(1,uname);
                st.setString(2,pass);
                rs=st.executeQuery();
                rs.last();
                    if(rs.getRow()==0)
                    {
                        out.println("<center>"
                                + "<h2> User does not exists </center>");
                        out.println(uname);
                        out.println(pass);
                    }
                        else
                            {
                                out.println("<center>"
                                        + "<table>"
                                        + "<tr>"
                                        + "<th class='header'>Calculate and Insert</th>"
                                        + "<td><form action='EmployeeInfo.html' method=post><input type='submit' value='Calc and Ins' id='button'></form></td>"
                                        +"<th class='header'>View Details</th>"
                                        + "<td><form action='EmployeeDetails.html' method=post><input type='submit' value='View Details' id='button'></form></td>");
                                        
                            }
                
                
            }catch(Exception e){out.println(e);}
            %>
            
            
    </div>
    <center>
                <form>
                    <input type='submit' value='logut' formaction='index.html' id='button'>
                </form>
    </center>
    </body>
</html>
