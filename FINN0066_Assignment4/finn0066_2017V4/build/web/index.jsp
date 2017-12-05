<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Generico</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            html {
                position: relative;
                min-height: 100%;
            }
        </style>
    </head>

    <body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand active" href="index.jsp">Generico</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="./JSPPages/management.jsp">Management</a></li>
                <li><a href="./JSPPages/humanResources.jsp">Human Resrouces</a></li>
                <li><a href="./JSPPages/finance.jsp">Finance</a></li>
                <li><a href="./JSPPages/devDesign.jsp">Development and Design</a></li>
                <li><a href="./JSPPages/sales.jsp">Sales</a></li>
                <li><a href="./JSPPages/marketting.jsp">Marketting</a></li>
                <li><a href="./JSPPages/shipping.jsp">Shipping</a></li>
                
                            </ul>
                        </div>
                        </nav>
                        <div class="jumbotron text-center">
                            <h1>Welcome To Generico.</h1>      
                            <p>Click on the video below for instructions on how to use this site.</p>
                        </div>

                        <div class="container-fluid article text-center well-lg  ">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/7u-HMqsPaQ4" frameborder="0" allowfullscreen></iframe>
                        </div>
                        <footer class="container-fluid bg-4 text-center">
                            <p></p>
                            <p>Payroll System made by Programming Solutions <a href="https://www.w3schools.com">www.enterUrl.com</a></p> 
                        </footer>

                        </body>
                        </html>
