<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
</head>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx51365b973fc14a1990eeb179b36326df"></script>
<body onload="initTmap();">
<script type="text/javascript">

    function initTmap(){
        // map 생성
        // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
        var map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
            width : "100%", // 지도의 넓이
            height : "400px" // 지도의 높이
        });
    };



    function resOpenPopup(status){ //출발지 팝업
        if(status == 's'){
        var pop = window.open("/test/tour/popup","resPopup","width=1100,height=900, scrollbars=yes, resizable=yes");
        }else if(status == 'e'){
            var pop = window.open("/test/tour/popup","resPopup","width=1100,height=900, scrollbars=yes, resizable=yes");
        }else{
            var pop = window.open("/test/tour/popup","resPopup","width=1100,height=900, scrollbars=yes, resizable=yes");
        }

    }
    function pop(resArr){
        console.log(resArr);
    }


    function setResList(resArr){
        if($("#noRes").length > 0) $("#noRes").remove();

        for(var i=0; i<resArr.length; i++){

            var trCnt = $("#resTb tbody tr").length;
            $("#resTb tbody").append($("#resTr").html());
            var lastTr = $("#resTb tbody tr:last");
            $(lastTr).attr("id","tr_"+resArr[i].rf_idx);
            $(lastTr).find("td[name='taxonIDName']").append(resArr[i].taxonIDName);
            $(lastTr).find("td[name='rf_code_fbcc']").append(resArr[i].rf_code_fbcc);
            $(lastTr).find("td[name='r_comm_scname']").append(resArr[i].r_comm_scname);
            $(lastTr).find("td[name='r_comm_cname']").append(resArr[i].r_comm_cname);
        }
    }

    function trRemove(ths){
        var $tr = $(ths).parents("tr");
        $tr.remove();
    }



</script>


    <h2>투어 등록</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="no" value="${TourDto.no}">

        <input name="title" type="text" value="<c:out value="${TourDto.title}"/> " placeholder="  제목을 입력해 주세요."><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요."></textarea><br>
        <div class="text-center">
            <a href="javascript:void(0);" onclick="resOpenPopup('s');return false;" >출발지</a>
        </div>
        <div>
            <span>출발지</span><br>
            <span></span>
            <input type = "text" id="start_name" value="">
        </div>
        <div class="text-center">
            <a href="javascript:void(0);" onclick="resOpenPopup('e');return false;" class="btn btn-dark btn-lg">중간지점</a>
        </div>
        <div class="text-center">
            <a href="javascript:void(0);" onclick="resOpenPopup('w');return false;" class="btn btn-dark btn-lg">도착지</a>
        </div>



        <div id="boradBtn">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        </div>
    </form>

    <div id="map_div">

    </div>


</body>
</html>
