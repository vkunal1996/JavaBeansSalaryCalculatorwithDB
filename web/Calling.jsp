<%-- 
    Document   : Calling
    Created on : Sep 14, 2017, 9:09:56 AM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            #body
            {
                
                height:660px;
                width:1340px;
                background-color: aqua;
                background-image: url(images/mainBackground.jpg);
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
        </style>
        <title>Details Of Employee</title>
    </head>
    <body id="body">
    <center><h1 id="mainheading">Employee Details</h1></center>
    <div>
        
        <center>
                <jsp:useBean id="obj" class="myCalculation.Calculation">
            <jsp:setProperty name="obj" property="*"/>
            <table border="2">
                <tr><th>Employee Id: </th><td><jsp:getProperty name="obj" property="id"/></td></tr>
            <tr><th>Employee Name: </th><td><jsp:getProperty name="obj" property="name"/></td></tr>
            <tr><th>Employee Designation:</th><td> <jsp:getProperty name="obj" property="designation"/></td></tr>
            <tr><th>Employee Contact:</th><td> <jsp:getProperty name="obj" property="contact"/></td></tr>
            <tr><th>Employee Email: </th><td><jsp:getProperty name="obj" property="email"/></td></tr>
            <tr><th>Employee Basic Salary:</th><td><jsp:getProperty name="obj" property="salary"/></td></tr>
            <tr><th>Employee HRA:</th><td><jsp:getProperty name="obj" property="hra"/></td></tr>
           <tr><th> Employee TA: </th><td><jsp:getProperty name="obj" property="ta"/></td></tr>
          <tr><th>  Employee DA:</th><td><jsp:getProperty name="obj" property="da"/></td></tr>
          <tr><th>  Employee IT:</th><td><jsp:getProperty name="obj" property="it"/></td></tr>
          <tr><th>  Employee PF:</th><td><jsp:getProperty name="obj" property="pf"/></td></tr>
         <tr><th>   Employee Total Salary:</th><td><jsp:getProperty name="obj" property="salaryTDS"/></td></tr>
         <tr><th colspan="2" align="center">Result : <jsp:getProperty name="obj" property="msg"/></th><tr>
         <tr><td colspan="2" align="center"><form><input type="hidden" name="user" value="admin"><input type="hidden" name="password" value="admin"><input type="submit" value="Home" formaction="AdminPanel.jsp"></form></td></tr>
         </table>
         
           
            
        </jsp:useBean>
        </center>
    </div>
        
    </body>
</html>
