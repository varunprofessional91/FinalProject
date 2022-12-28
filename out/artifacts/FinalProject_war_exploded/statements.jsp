<%@ page import="java.util.*" %>
<%@ page language="java" import="servletpackage.User" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="jdk.jfr.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css1.css">
    <title>Statements</title>
    <style>
        tr, td, th {position:relative; text-align: center; text-align: -moz-center; text-align: -webkit-center;}
    </style>
</head>
<body style="background:white;">
<%
    if (session != null) {
        if (session.getAttribute("username") != null) {
            String name = (String) session.getAttribute("username");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

%>
<div style="height:900px;">
    <div style="border:1px solid rgb(1,168,123); background-color:rgb(1,168,123); top:0px; width:100%; height:60px;position:absolute; opacity:0.7; z-index:-1;">
    </div>

    <div style="font-family: calibri; position:absolute; left:30px; top:10px; text-align: center; color:white; font-size:21px; border:2px solid white; height:40px; width:153px; border-radius:5px;">
        <a href="welcome.jsp">
            <div id="bank_logo" style="padding:4px; font-weight:bold; ">Dinkar Bank
            </div>
        </a>
    </div>
    <div style="left:1200px; top:12px; position:absolute;z-index: 5;">
        <form action="LogOut1" method="post">
            <input type="submit" value="Logout" id="submit2">
        </form>
    </div>
<%
            ArrayList<User> list = (ArrayList<User>) request.getAttribute("usersList");

    if(list == null)
    {
%>
    <div>
        <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:160px; left:480px; width:350px;height:250px;text-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
            <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:55px;position:absolute;">
                <p style="font-family: calibri; text-align: center; margin:15px; color:white; font-size:21px;">Statements</p>
            </div>
            <br><br><br>&nbsp;
            <form action="Statements1" method="post">
                <p>Fr Date      : <input type="date" id="text1" name="fromdate" ><br><br></p>
                <p>To Date      : <input type="date" id="text2" name="todate" ><br></p>
                <input type="submit" id="submit1" value="View">
            </form>

        </div>
        <p style="position:absolute; top:115px; left: 630px; text-align: center; color:red; font-family: calibri; font-size:15px; opacity:0.8;"> ${message} </p>
    </div>

        <%
           }
        else
            {
            %>
    <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:100px; left:300px; width:700px;height:auto; ext-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
        <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:30px; position:absolute;">
            <p style="font-family: calibri; text-align: center; margin:5px; color:white; font-size:15px;">Account Statments</p>
        </div>
        <center>

    <%
        list = (ArrayList<User>) request.getAttribute("usersList");
        %>
        <table>
            <tr id="tb1"><th>Date</th>
                <th>Accname</th>
                <th>AccNo</th>
                <th>Transactions</th>
                <th>Amount</th>
                <th> Acc Balance</th>
            </tr><br><br>
        <%
        for(User user : list) {
    %>


          <tr id="tb2">
              <td><% out.println(user.getDate()); %></td>
              <td><% out.println(user.getAccname()); %></td>
              <td><% out.println(user.getAccno()); %></td>
              <td><% out.println(user.getTransactions()); %></td>
              <td><% out.println(user.getAmt()); %></td>
              <td><% out.println(user.getBalance()); %></td>

          </tr>
            <% } %>
            <br><br>
        </table>
        </center>
        <% } %>

    </div>

<%--</div>--%>
</body>
</html>
