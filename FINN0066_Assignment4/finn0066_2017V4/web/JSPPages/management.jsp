<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://rds-mysql-generico.c1mxhcdlrmia.ap-southeast-2.rds.amazonaws.com:3306/generico_database?zeroDateTimeBehavior=convertToNull"
                   user="admin"
                   password="password"
                   />


<sql:query var="comp3732_employees" dataSource="${database}">
    SELECT * FROM comp3732_departments, comp3732_employees 
    WHERE comp3732_employees.emp_id = comp3732_departments.emp_idfk 
    AND comp3732_departments.dept_id = ? <sql:param value="1"/>
</sql:query>


<sql:query var="comp3732_emergency_contacts" dataSource="${database}">
    SELECT * FROM comp3732_emergency_contacts
</sql:query>    



<c:set var="comp3732_employeesDetails" value="${comp3732_employees.rows[0]}"/>



<%-- 
    Document   : management
    Created on : 29/08/2017, 11:12:54 AM
    Author     : finn0066
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>









        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp">Home</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="./management.jsp">Management</a></li>
                    <li><a href="./humanResources.jsp">Human Resrouces</a></li>
                    <li><a href="./finance.jsp">Finance</a></li>
                    <li><a href="./devDesign.jsp">Development and Design</a></li>
                    <li><a href="./sales.jsp">Sales</a></li>
                    <li><a href="./marketting.jsp">Marketting</a></li>
                    <li><a href="./shipping.jsp">Shipping</a></li>
                </ul>
            </div>
        </nav>







        <div class="container">
            <h2>Management Employees</h2>
            <p>
                Below you will find information relating to employee's
                who are in management positions. Select a tab from below
                to view Employee details and Emergency contact information.
            </p>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">${comp3732_employeesDetails.firstName} ${comp3732_employeesDetails.lastName} </a></li>
            </ul>


            <div class="row">
                <div class="container-fluid">
                    <div id="home" class="tab-pane fade in active">
                        <h3>Employee Details</h3>
                        <div class="col-md-2">
                            <dl>
                                <dt class=".text-success">First Name </dt>
                                <dd>${comp3732_employeesDetails.firstName}</dd>
                                <dt>Last Name </dt>
                                <dd>${comp3732_employeesDetails.lastName}</dd>
                            </dl>
                        

                        <dl>
                            <dt class=".text-success">Email </dt>
                            <dd><a href="mailto:${comp3732_employeesDetails.email}">${comp3732_employeesDetails.email}</a></dd>
                            <dt>Phone </dt>
                            <dd>${comp3732_employeesDetails.telephone}</dd>
                        </dl>
                        </div>
                        <br>
                        
                        <div>
                        
                            <h3>Emergency Contact Details</h3>

                            <c:set var = "employeeName" scope = "session" value = "${comp3732_employeesDetails.firstName} ${comp3732_employeesDetails.lastName}"/>

                            <c:forEach items = "${comp3732_emergency_contacts.rows}" var= "objectList" >

                                <core:if test = "${objectList.employee_name eq employeeName}">
                                    <dl>
                                        <dt class=".text-success">Full Name </dt>
                                        <dd><c:out value = "${objectList.contact_name}"/></dd>

                                        <c:choose> 
                                            <c:when test = "${objectList.contact_email eq null}">
                                                <dt>Email </dt>
                                                <dd>No Email Address Provided</dd>
                                            </c:when>
                                            <c:otherwise>
                                                <dt>Email </dt>
                                                <dd><a href="mailto: ${objectList.contact_email}">${objectList.contact_email}</a></dd>
                                            </c:otherwise>
                                        </c:choose>
                                                
                                                
                                               <c:choose> 
                                            <c:when test = "${objectList.contact_phone eq null}">
                                                <dt>Phone Number </dt>
                                                <dd>No Phone Number Provided</dd>
                                            </c:when>
                                            <c:otherwise>
                                                <dt>Phone Number </dt>
                                                <dd>${objectList.contact_phone}</dd>
                                            </c:otherwise>
                                        </c:choose>
                                                
                                                </core:if> 

                        </c:forEach>   
                                    </dl>
                                </div>



                    </div>

                </div>



            </div>
        </div>


    </body>
</html>
