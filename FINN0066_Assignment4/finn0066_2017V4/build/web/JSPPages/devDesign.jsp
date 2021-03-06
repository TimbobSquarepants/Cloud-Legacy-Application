<%-- 
    Document   : devDesign
    Created on : 29/08/2017, 11:05:51 AM
    Author     : finn0066
--%>

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
    AND comp3732_departments.deptName = ? <sql:param value="Development and Design"/>
</sql:query>


<sql:query var="comp3732_emergency_contacts" dataSource="${database}">
    SELECT * FROM comp3732_emergency_contacts
</sql:query>    



<c:set var="comp3732_employeesDetails" value="${comp3732_employees.rows[0]}"/>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Development and Design</title>
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
                    <li><a href="./management.jsp">Management</a></li>
                    <li><a href="./humanResources.jsp">Human Resrouces</a></li>
                    <li><a href="./finance.jsp">Finance</a></li>
                    <li class="active"><a href="./devDesign.jsp">Development and Design</a></li>
                    <li><a href="./sales.jsp">Sales</a></li>
                    <li><a href="./marketting.jsp">Marketting</a></li>
                    <li><a href="./shipping.jsp">Shipping</a></li>
                </ul>
            </div>
        </nav>


        <div class="container-fluid">
            <h2>Development and Design Employees</h2>
            <p>
                Below you will find information relating to employee's
                who are either in development or design departments positions. Select a tab from below
                to view Employee details and Emergency contact information.
            </p>
        </div>


        <ul class="nav nav-tabs">


            <li>
                <a data-toggle="tab" href="#home">Select an Employee </a>



            </li>

            <li>  <a data-toggle="tab" href="#allEmployee">All Employees </a></li>



        </ul>



        <div class="row tab-content container-fluid ">

            <div class="row tab-content container-fluid">

                <div  id="home" class="tab-pane fade in active">
                    <h1>Look up Employees with Emergency Contact information.</h1>     
                    <p> 
                    <form action="devDesignResponse.jsp">
                        <strong>Select a Employee</strong>
                        <select name="dept_id">
                            <c:forEach var="row" items="${comp3732_employees.rows}">
                                <option value="${row.dept_id}">${row.firstName} ${row.lastName}</option>
                            </c:forEach>
                            <input type="submit" value="submit" name="submit" />
                    </form>
                </div>








                <div id="allEmployee" class="tab-pane fade in ">
                    <c:forEach items = "${comp3732_employees.rows}" var= "employeeList" >

                        <h3>Employee Details</h3>

                        <div class="col-md-2">

                            <dl>
                                <dt class=".text-success">First Name </dt>
                                <dd>${employeeList.firstName}</dd>
                                <dt>Last Name </dt>
                                <dd>${employeeList.lastName}</dd>
                            </dl>


                            <dl>
                                <dt class=".text-success">Email </dt>
                                <dd><a href="mailto:${employeeList.email}">${employeeList.email}</a></dd>
                                <dt>Phone </dt>
                                <dd>${employeeList.telephone}</dd>
                            </dl>
                        </div>
                        <br>

                        <div>

                            <h3>Emergency Contact Details</h3>

                            <c:set var = "employeeName" scope = "session" value = "${employeeList.firstName} ${employeeList.lastName}"/>

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
                                                <dd><a href="mailto:${objectList.contact_email}">${objectList.contact_email}</a></dd>
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
                    </c:forEach>



                </div>



            </div>
        </div>




    </body>


</html>
