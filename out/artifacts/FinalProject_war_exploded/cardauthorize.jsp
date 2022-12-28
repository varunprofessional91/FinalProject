<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css1.css">
    <title>Transactions</title>
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

<center>

<div>


    <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:100px; left:300px; width:700px;height:440px;text-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
        <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:30px; position:absolute;">
            <p style="font-family: calibri; text-align: center; margin:5px; color:white; font-size:15px;">Credit Card Authorize</p>

        </div>
        <div style="margin:50px;">


                <br>


                <form action="CardAuthorize1" method="post">

                    <p>Acc Name    : <input type="text" id="text2" name="accname" ><br></p>

                    <p>Card No.&nbsp;&nbsp;      : <input type="text" id="text1" name="cardno"><br></p>

                    <p>Cvv No. &nbsp;&nbsp;&nbsp;   : <input type="text" id="text4" name="cvvno" ><br></p>

                    <p>Amt Limit    : <input type="text" id="text3" name="amt" ><br></p>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                <input type="submit" id="submit1" value="Authorize">
                </form>

        </div>
    </div>
</div>
<p style="position:absolute; top:57px; left: 630px; text-align: center; color:red; font-family: calibri; font-size:15px; opacity:0.7;"> ${message} </p>
</div>
</center>


</div>
</body>
</html>
