<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="zipcode-layer">
</div>
<script>
    function ZipCode(chooseAfter, returnFunction) {
        var $zipcodeLayer = $("#zipcode-layer");
        function init() {
            new daum.Postcode({
                oncomplete : search,
                width : "100%",
                height : "100%",
                maxSuggestItems : 5
            }).embed(document.getElementById("zipcode-layer"));
            
            var width = 380;
            if ($.resources.isPc) {
                width = 418;
            }
            var height = 480;
            var borderWidth = 1;
            $zipcodeLayer.css({
                "width" : width + "px",
                "height" : height + "px",
                "border" : borderWidth + "px solid",
                "left" : (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + "px",
                "top" : (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + "px"
            });
        }
        function search(data) {
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                    extraAddr = " (" + extraAddr + ")";
                }
            }

            var object = new Object();
            object.zipcode = data.zonecode;
            object.addr = addr + " " + extraAddr;
            object.roadAddress = data.roadAddress + " " + extraAddr;
            object.jibunAddress = data.jibunAddress;
            chooseAfter();
            returnFunction(object);
            $zipcodeLayer.hide();
        }
        function zipCodeShow() {
            init();
            $zipcodeLayer.show();
        }
        zipCodeShow();
    }
</script>