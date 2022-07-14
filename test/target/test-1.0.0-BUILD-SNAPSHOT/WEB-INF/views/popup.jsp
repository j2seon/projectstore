<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    var path = "${pageContext.request.contextPath }";
    // $(function(){
    //         $("#check_all").click(function(){
    //             var chk = $(this).is(":checked");
    //             if(chk) $("#resTb input[name='chk_res']").prop('checked', true);
    //             else  $("#resTb input[name='chk_res']").prop('checked', false);
    //         });
    //     });

    function selectItem(){ //체크리스트 없을 경우 유효성 체크
        if($("#resTb input[name='chk_res']:checked").length == 0){
            alert("체크할 리스트를 선택해주세요.");
            return false;
        }

        var resArr = new Array();
        $("#resTb input[name='chk_res']:checked").each(function(index) {
            var organismID = $(this).val();
            var storeDto = new Object();
            $tr = $("#tr_"+organismID);
            storeDto.id = $tr.find("input[name='id']").val();
            storeDto.address = $tr.find("input[name='address']").val();
            storeDto.storeName = $tr.find("input[name='storeName']").val();
            storeDto.lat = $tr.find("input[name='lat']").val();
            storeDto.lon = $tr.find("input[name='lon']").val();
            storeDto.good = $tr.find("input[name='good']").val();
            storeDto.reg_date = $tr.find("input[name='reg_date']").val();
            storeDto.corps = $tr.find("input[name='corps']").val();
            storeDto.eat = $tr.find("input[name='eat']").val();
            storeDto.mainMenu = $tr.find("input[name='mainMenu']").val();
            storeDto.holiday = $tr.find("input[name='holiday']").val();
            storeDto.mainimg = $tr.find("input[name='mainimg']").val();
            storeDto.post_num = $tr.find("input[name='post_num']").val();
            storeDto.master = $tr.find("input[name='master']").val();
            storeDto.franchise = $tr.find("input[name='franchise']").val();
            storeDto.gu = $tr.find("input[name='gu']").val();

            resArr.push(storeDto);
        });
        /*window.opener.setResList(resArr);*/
        window.opener.pop(resArr);
        window.close();
    }
</script>
<div>
    <div>
        <div>
            <table id="resTb">
                <caption>LIST</caption>
                <thead>
                <tr>
                    <th>선택</th>
                    <th>번호</th>
                    <th>이름</th>
                    <th>주소</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="result" items="${store}" varStatus="status">
                    <tr id="tr_${result.id}">
                        <input type="hidden" name="id" value="${result.id}" />
                        <input type="hidden" name="address" value="${result.address}" />
                        <input type="hidden" name="storeName" value="${result.storeName}" />
                        <input type="hidden" name="lat" value="${result.lat}" />
                        <input type="hidden" name="lon" value="${result.lon}" />
                        <input type="hidden" name="good" value="${result.good}" />
                        <input type="hidden" name="reg_date" value="${result.reg_date}" />
                        <input type="hidden" name="corps" value="${result.corps}" />
                        <input type="hidden" name="eat" value="${result.eat}" />
                        <input type="hidden" name="mainMenu" value="${result.mainMenu}" />
                        <input type="hidden" name="holiday" value="${result.holiday}" />
                        <input type="hidden" name="mainimg" value="${result.mainimg}" />
                        <input type="hidden" name="post_num" value="${result.post_num}" />
                        <input type="hidden" name="master" value="${result.master}" />
                        <input type="hidden" name="franchise" value="${result.franchise}" />
                        <input type="hidden" name="gu" value="${result.gu}" />


                        <td><input type="checkbox" name="chk_res" value="${result.id}" /></td>
                        <td><c:out value="${status.index+1 }"/></td>
                        <td class="taxonIDName"><c:out value="${result.storeName}"/></td>
                        <td class="scientificName"><c:out value="${result.address}"/></td>
                    </tr>
                </c:forEach>
                <c:if test="${fn:length(store) == 0}">
                    <tr>
<%--                        <td colspan="5"><spring:message code="" text="조회결과가 없습니다." /></td>--%>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <div>
        </div>
        <a href="#" onclick="selectItem();return false;">가게 선택</a>
    </div>
</div>
</div>
</body>
</html>
