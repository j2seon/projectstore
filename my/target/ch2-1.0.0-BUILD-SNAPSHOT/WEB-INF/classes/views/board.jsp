<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : loginId}"/>
<c:set var="RegisterLink" value="${loginId==''? '/register/add' : ''}"/>
<c:set var="Registercheck" value="${loginId=='' ? 'Sign Up' : 'My Cart'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BOARD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        #commstart{
            margin-bottom: 50px;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .container{
            margin-bottom: 30px;
        }



        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
            display: inline-block;
            margin-top: 5px;
            text-decoration: none;
        }
        .btn:hover {
            text-decoration: underline;
        }

        .sidbtn{
            position:fixed;
            top:0px;
            left:20px;

        }
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 30px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }

        .navbar {
            width: 100%;
            background-color: #ffff;
            overflow: auto;
        }
        .navbar a {
            float: right;
            padding: 22px;
            color:black;
            text-decoration: none;
            font-size: 17px;
        }

        .navbar a:hover {
            background-color: #04AA6D;
        }

        .active  {
            /* background-color: #04AA6D; */
        }

        @media screen and (max-width: 500px) {
            .navbar a {
                float: none;
                display: block;
            }
        }
        #modify-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #modify-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        ul {
            border:  1px solid rgb(235,236,239);
            border-bottom : 0;
        }
        li {
            background-color: #f9f9fa;
            list-style-type: none;
            border-bottom : 1px solid rgb(235,236,239);
            padding : 18px 18px 0 18px;
            position: relative;
        }
        .comment-bott, .up_date{
            font-size:9pt;
            color : rgb(97,97,97);
            padding: 8px 0 8px 0;
        }

        .comment-bott > a {
            color : rgb(97,97,97);
            text-decoration: none;
            margin : 0 6px 0 0;
        }

        #comment-writeForm {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
        }
        #sendBtn, #writeRepBtn, #writeRepCan {
            color : #009f47;
            background-color: #e0f8eb;
            text-decoration: none;
            padding :5px;
            border-radius: 5px;
            border: none;
            margin: 3px;
        }


    </style>
</head>
<body>
<div class="navbar">
  <a class="active" href="<c:url value='${loginOutLink}'/>"><i class="fa fa-fw fa-user"></i>${loginOut}</a>
  <a href="<c:url value='${RegisterLink}'/>">${Registercheck}</a>
  <a href="#"><i class="fa fa-fw fa-home"></i>My Page</a>
  <a class="logo" style="margin-right: 18%; padding: 15px;" href="<c:url value='/'/>"><img src="./image/logo_w.png"></a>
</div>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="<c:url value="/product/list"/>">Product</a>
  <a href="<c:url value="/board/list"/>">Board</a>
  <a href="#">Contact</a>
  <a href="<c:url value="/product/add"/>">Add</a>
</div>

<%--<!--??????-->--%>
<span class="sidbtn" style="font-size:40px;cursor:pointer"onclick="openNav()">&#9776;</span>


<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("????????? ????????? ?????????????????????. ?????? ????????? ?????????.");
    if(msg=="MOD_ERR") alert("????????? ????????? ?????????????????????. ?????? ????????? ?????????.");
</script>
<div class="container">
        <h2 class="writing-header">????????? ${mode=="new" ? "?????????" : "??????"}</h2>
        <form id="form" class="frm" action="" method="post">
            <input type="hidden" name="bno" value="${boardDto.bno}">

            <input name="title" type="text" value="<c:out value="${boardDto.title}"/> " placeholder="  ????????? ????????? ?????????." ${mode=="new" ? "" : "readonly='readonly'"}><br>
            <textarea name="content" rows="20" placeholder=" ????????? ????????? ?????????." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/> </textarea><br>

            <c:if test="${mode eq 'new'}">
                <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> ??????</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> ?????????</button>
            </c:if>
            <c:if test="${boardDto.writer eq loginId}">
                <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> ??????</button>
                <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> ??????</button>
            </c:if>
            <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> ??????</button>
        </form>

    <div id="commstart">
        <div id="comment-writeForm">
            comment : <textarea name="comment" placeholder="????????? ???????????????"></textarea><br>
            <button id="sendBtn" type="button">SEND</button>
            <button id="modBtn" style="display: none"  type="button">MOD</button>
        </div>
        <div id="commentList">
        </div>
        <div id="relyForm" style="display: none">
            <textarea  name="replyComment"placeholder="????????? ???????????????"></textarea>
            <button id="writeRepBtn" type="button">??????</button>
            <button id="writeRepCan" type="button">??????</button>
        </div>

        <div id="modalWin" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>
                    <h2>  ?????? ??????</h2>
                    <div id="modify-writebox">
                    <div class="commenter commenter-writebox"><i class="fa fa-user-circle" aria-hidden="true"></i></div>
                            <div class="modify-writebox-content">
                                <textarea name="comm" id="comm" cols="30" rows="5" placeholder="????????? ???????????????"></textarea>
                            </div>
                        <div id="modify-writebox-bottom">
                            <div class="register-box">
                                <a href="#" class="btn" id="btn-write-modify">??????</a>
                            </div>
                        </div>
                    </div>
                </p>
            </div>
         </div>
    </div>
</div>

<script>
    <c:if test="${mode ne 'new'}">
    let bno = <c:out value="${boardDto.bno}"/>;
    </c:if>
    let showList = function (bno) {
        $.ajax({
            type:'GET',       // ?????? ?????????
            url: '/pro/comments?bno='+ bno,  // ?????? UURI
            success : function(result){
                $("#commentList").html(toHTML(result));
            },
            error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
        }); // $.ajax()
    }



    $(document).ready(function() {
        let formCheck = function() {
            let form = document.getElementById("form");
            if($('input[name=title]').val().trim()=='') {
                alert("????????? ????????? ?????????.");
                form.title.focus();
                return false;
            }
            if(form.content.length==0) {
                alert("????????? ????????? ?????????.");
                form.content.focus();
                return false;
            }
            return true;
        }

        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');
            // 1. ?????? ????????????, ?????? ????????? ??????
            if(isReadonly=='readonly') {
                $(".writing-header").html("????????? ??????");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> ??????");
                return;
            }
            // 2. ?????? ????????????, ????????? ????????? ????????? ??????
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("????????? ?????????????????????????")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>"
        });

        showList(bno);

        $("#sendBtn").click(function () {
            let comment = $("textarea[name=comment]").val();
            if (comment.trim() == '') {
                alert("????????? ??????????????????");
                $("textarea[name=comment]").focus();
                return;
            }
            $.ajax({
                type: 'POST',       // ?????? ?????????
                url: '/pro/comments?bno=' + bno,  // ?????? URI
                headers: {"content-type": "application/json"}, // ?????? ??????
                data: JSON.stringify({bno: bno, comment: comment}),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                success: function () {
                    alert("?????????????????????.");       // result??? ????????? ????????? ?????????
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // ????????? ???????????? ???, ????????? ??????
            }); // $.ajax()
            $("input[name=comment]").val('');
        });

        $("#commentList").on("click",".replyBtn",function() {
            // 2.?????? ????????? ??? ????????????????????? ?????? ?????? ????????? ????????? ????????????
            $("#relyForm").appendTo($(this).parent());
            //1.????????? ????????? ?????? ?????????. //?????? ??????????????? ???????????? ????????????
            $("#relyForm").css("display","block");
        });

        $("#writeRepCan").click(function (){
            $("#relyForm").css("display","none");
        });


        $("#writeRepBtn").click(function(){
            let comment=$("textarea[name=replyComment]").val();
            let pcno = $(".replyBtn").attr("data-pcno");
            if(comment.trim()==''){
                alert("????????? ??????????????????");
                $("input[name=replyComment]").focus();
                return;
            }
            $.ajax({
                type:'POST',       // ?????? ?????????
                url: '/pro/comments?bno='+bno,  // ?????? URI
                headers : { "content-type": "application/json"}, // ?????? ??????
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment }),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                success : function(result){
                    alert(result);       // result??? ????????? ????????? ?????????
                    showList(bno);
                },
                error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
            }); // $.ajax()
            $("#relyForm").css("display","none");
            $("textarea[name=replyComment]").val('');
            $("#relyForm").appendTo("body");
        });



        $("#commentList").on("click",".delBtn",function(){
            let cno= $(this).attr("data-cno");
            let bno= $(this).attr("data-bno");
            $.ajax({ //???????????? ????????? ???????????? ?????????~f
                type:'DELETE',       // ?????? ?????????
                url: '/pro/comments/'+cno+'?bno='+ bno,  // ?????? URI
                success : function(){//???????????? ????????? ??????????????????.
                    alert("?????????????????????.")
                    showList(bno);
                },
                error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
            }); // $.ajax()
        });

        $("#commentList").on("click",".modBtn",function() {
            let cno = $(this).attr("data-cno");
            let comment = $("#com-comment").text();
            let bno = $(this).attr("data-bno");
            let pcno = $(this).attr("data-pcno");
            let commenter = $("#com-commenter").text();

            $("#modalWin .commenter").text(commenter);
            $("#modalWin textarea").text(comment);
            $("#btn-write-modify").attr("data-cno", cno);
            $("#btn-write-modify").attr("data-pcno", pcno);
            $("#btn-write-modify").attr("data-bno", bno);

            // ???????????? ?????? ????????? ????????????.
            $("#modalWin").css("display","block");
        });

        $("#btn-write-modify").click(function(){
            let comment = $("textarea[name=comm]").val();
            let cno = $("#btn-write-modify").attr("data-cno");
            $.ajax({
                type:'PATCH',       // ?????? ?????????
                url: '/pro/comments/'+cno,  // ?????? URI
                headers : { "content-type": "application/json"}, // ?????? ??????
                data : JSON.stringify({cno:cno, comment:comment }),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                success : function(result){
                    alert(result);       // result??? ????????? ????????? ?????????
                    showList(bno);
                },
                error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
            }); // $.ajax()
        });

        $(".close").click(function(){
            $("#modalWin").css("display","none");
        });

    });

    let toHTML = function (comments) {
        let tmp = "<ul>";

        comments.forEach(function (comment){
            tmp +='<li data-cno='+comment.cno
            tmp +=' data-pcno='+comment.pcno
            tmp +=' data-bno='+comment.bno +'>'
            if(comment.cno!=comment.pcno){
            tmp += '<div style="background-color: azure" id="com-commenter" name="commenter" class="commenter"><i class="fa fa-user-circle" aria-hidden="true"></i>&ensp;'+comment.commenter+'?????? ??????</div>'
            tmp += '<div id="com-comment" name="comment" class="comment">'+comment.comment+'</div>'
            }else{
            tmp += '<div id="com-commenter" name="commenter" class="commenter"><i class="fa fa-user-circle" aria-hidden="true"></i>&ensp;'+comment.commenter+'</div>'
            tmp += '<div id="com-comment" name="comment" class="comment">'+comment.comment+'</div>'
            }
            // tmp += '<div id="com-comment" name="comment" class="comment">'+comment.comment+'</div>'
            tmp += '<div class="comment-bott">'
            tmp +='<a href="#" class="delBtn" data-cno='+comment.cno
            tmp +=' data-pcno='+comment.pcno
            tmp +=' data-bno='+comment.bno +'>??????</a>'
            tmp +='<a href="#" class="modBtn" data-cno='+comment.cno
            tmp +=' data-pcno='+comment.pcno
            tmp +=' data-bno='+comment.bno +'>??????</a>'
            tmp +='<a href="#" class="replyBtn" data-cno='+comment.cno
            tmp +=' data-pcno='+comment.pcno
            tmp +=' data-bno='+comment.bno +'>??????</a>'
            tmp += '<span class="up_date">'+comment.up_date+'</span>'
            tmp +='</div>'
            tmp += '</li>'
        })
        return tmp+"</ul>"
    }




</script>
</body>
</html>