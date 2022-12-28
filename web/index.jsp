<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css1.css">
    <title>Login</title>
    <style>
    </style>
</head>
<body style="background:white;">
<div style="height:900px;">
    <div style="border:1px solid rgb(1,168,123); background-color:rgb(1,168,123); top:0px; width:100%; height:60px;position:absolute; opacity:0.7; z-index:-1;">
    </div>

    <div style="font-family: calibri; position:absolute; left:30px; top:10px; text-align: center; color:white; font-size:21px; border:2px solid white; height:40px; width:153px; border-radius:5px;">
        <a href="welcome.jsp">
            <div id="bank_logo" style="padding:4px; font-weight:bold; ">Dinkar Bank
            </div>
        </a>
    </div>
    <div>
        <div style="background-color:white; margin-left:auto;margin-right:auto; border-radius:5px; border:1px solid; border-color: rgb(78,105,143); position:absolute; align-content:center; top:160px; left:480px; width:350px;height:220px;text-align:center;padding:10px 20px 30px 20px; opacity:0.7;">
            <div style="background-color:rgb(1,168,123); margin:0px; top:0; left:0; width:100%; height:55px;position:absolute;">
                <p style="font-family: calibri; text-align: center; margin:15px; color:white; font-size:21px;">Login</p>
            </div>
            <br><br><br>&nbsp;
            <form action="ServletLogin1" method="post">
                <input type="text" id="text1" name="username" placeholder="Username"><br><br>
                <input type="password" id="text2" name="password" placeholder="Password" ><br><br>
                <input type="submit" id="submit1" value="Login">
            </form>

        </div>
        <p style="position:absolute; top:420px; left: 585px; text-align: center; color:red; font-family: calibri; font-size:15px; opacity:0.8;"> ${message} </p>
        </div>
</div>
</body>
</html>


