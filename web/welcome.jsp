<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css1.css">
    <title>Welcome</title>
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


<div>
    <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:100px; left:300px; width:700px;height:440px;text-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
        <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:30px; position:absolute;">
            <p style="font-family:calibri; text-align: center; margin:5px; color:white; font-size:15px;">User Profile</p>
        </div>
        <div>
                <center>
                    <form action="accinfo.jsp" method="post">
                <ul style="list-style-type: none; margin: 0; padding: 0;">
                    <br>
                    <br>
                    <a href="create_account.jsp"><li>Create Account</li></a>
                    <a href="transactions.jsp"><li>Transactions</li></a>

                    <input type="submit" value="Account Info" id="infobtn">


                    <a href="statements.jsp"><li>Account Statements</li></a>
                    <a href="cardauthorize.jsp"><li>Credit Card Authorization</li></a>
                    <li><a href="">Apply For Credit Card</a></li>
                    <li><a href="">Change Pin</a></li>
                    <li><a href="">Help</a></li>

                </ul>
                    </form>
                </center>
        </div>
    </div>
</div>
<p style="position:absolute; top:57px; left: 630px; text-align: center; color:red; font-family: calibri; font-size:15px; opacity:0.7;"> ${message} </p>
</div>
</div>


</body>
</html>



