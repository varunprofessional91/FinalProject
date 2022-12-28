<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css1.css">
    <title>Login</title>
    <style>
    </style>
</head>
<body style="height:700px;background:white;">
<%
    if (session != null) {
        if (session.getAttribute("username") != null) {
            String name = (String) session.getAttribute("username");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
%>
<div style="border:1px solid rgb(1,168,123); background-color:rgb(1,168,123); top:0px; width:100%; height:60px;position:absolute; opacity:0.7; z-index:-1;">
</div>

<div style="font-family:calibri; position:absolute; left:30px; top:10px; text-align: center; color:white; font-size:21px; border:2px solid white; height:40px; width:153px; border-radius:5px;">
    <a href="welcome.jsp">
        <div id="bank_logo" style="padding:4px; font-weight:bold; ">Dinkar Bank
        </div>
    </a>
</div>

<p style="font-family:calibri; text-align: center; margin:10px; color:white; top:20px; font-size:30px;"></p>
</div>

<div style="left:1200px; top:12px; position:absolute;z-index: 5;">
    <form action="LogOut1" method="post">
        <input type="submit" value="Logout" id="submit2">
    </form>
</div>

<div>


    <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:100px; left:300px; width:700px;height:440px;text-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
        <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:30px; position:absolute;">
            <p style="font-family: calibri; text-align: center; margin:5px; color:white; font-size:15px;">User Account Info</p>
        </div>

        <div style="margin:50px;">
            <%

            try
            {

                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

                String usr = String.valueOf(session.getAttribute("username"));

                PreparedStatement ps = c.prepareStatement("select * from acc_created where username=? ");
                ps.setString(1, usr);

                PreparedStatement pss = c.prepareStatement("select * from cardno where username=? ");
                pss.setString(1, usr);

                PreparedStatement psss = c.prepareStatement("select * from cvvno where username=? ");
                psss.setString(1, usr);

                String date = "";
                String accno ="";
                String accname ="";
                String dob = "";
                String acctype = "";
                String transactions = "";
                String address = "";
                String cardno = "";
                String cvvno = "";

                ResultSet rs = ps.executeQuery();
                ResultSet rss = pss.executeQuery();
                ResultSet rsss = psss.executeQuery();

                while (rss.next())
                {
                    cardno = rss.getString("cardno");
                }

                while (rsss.next())
                {
                    cvvno = rsss.getString("cvvno");
                }

                while (rs.next())
                {
                    date = rs.getString("date");
                    accno = rs.getString("accno");
                    accname = rs.getString("accname");
                    dob = rs.getString("dob");
                    acctype = rs.getString("acctype");
                    transactions = rs.getString("transaction");
                    address = rs.getString("address");
                }
                %>



            <div style="text-align:center; font-size:17px; font-family:tahoma; opacity:0.7;">

                <center>
            <%
                out.println("Account Created : "+date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account No. :"+ accno+"<br><br><br>");
                out.println("Account Name : "+accname+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date of Birth :"+dob+"<br><br><br>");
                out.println("Account Type : "+ acctype+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deposit Amount :"+transactions+"<br><br><br>");
                out.println("Credit Card No. : "+ cardno+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Card Cvv No. :"+cvvno+"<br><br><br>");
                out.println("Address : "+ address+"<br><br>");
            }

            catch (Exception e)
            {
                e.printStackTrace();
            }
            %>
                </center>
                </div>


        </div>

    </div>
</div>
<p style="position:absolute; top:57px; left: 620px; text-align: center; color:red; font-family: calibri; font-size:15px; opacity:0.7;"> ${message} </p>
</div>


</div>
</body>
</html>