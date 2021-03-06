<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        * { box-sizing:border-box; }
        form {
            width:400px;
            height:600px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }
        .input-field {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }
        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        .title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }

        .sns-chk {
            margin-top : 5px;
        }
    </style>
    <title>Register</title>
</head>
<body>
<form action="<c:url value="/register/add"/>" method="POST" onsubmit="return formCheck(this)">
    <div class="title">Register</div>
    <div id="msg" class="msg"><form:errors path="id"/></div>
    <label for="">?????????</label>
    <input class="input-field" type="text" name="id" placeholder="8~12????????? ?????????????????? ?????? ??????">
    <label for="">????????????</label>
    <input class="input-field" type="text" name="pwd" placeholder="8~20????????? ?????????????????? ?????? ??????">
    <label for="">??????</label>
    <input class="input-field" type="text" name="name" placeholder="?????????">
    <label for="">?????????</label>
    <input class="input-field" type="email" name="email" placeholder="jjs@gmail.co.kr">
    <label for="">Phone Number</label>
    <input class="input-field" type="text" name="phone" placeholder="01011111111">
    <label for="">??????</label>
    <input class="input-field" type="text" name="address" placeholder="????????? ?????????">
    <button type="submit">?????? ??????</button>
    </form>
<script>
    function formCheck(frm) {
        var msg ='';
        if(frm.id.value.length<3) {
            setMessage('id??? ????????? 3??????????????? ?????????.', frm.id);
            return false;
        }
        if(frm.pwd.value.length<8 ||frm.pwd.value.length>20){
            setMessage('??????????????? ????????? 8?????? 20????????????????????????.')
            return false;
        }
        if(frm.name.value.length<1){
            setMessage('????????? ??????????????????')
            return false;
        }
        if(frm.email.value.length<1){
            setMessage("???????????? ????????? ?????? ??????????????????")
            return false;
        }
        if(frm.phone.value.length<1) {
            setMessage("????????? ????????? ??????????????????")
            return false;
        }
        if(frm.address.value.length<1) {
            setMessage("????????? ??????????????????")
            return false;
        }
        alert("????????? ???????????? ???????????????.");

        return true;
    }

    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

        if(element) {
            element.select();
        }
    }


</script>



</body>
</html>