<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c10e4a48ec6793986fa9e465f242a813"></script>
</head>
<body>
<!-- (1) 지도가 담길 영역-->
     <p id="arduino"></p> <!-- 가져온 arduino값 화면에 출력(3초마다 갱신됨) -->
 	<!-- 이 값을 지도 api 위도,경도 값에 대입 -->
 	<!-- 현재위치 추적 페이지 / 마커로 위치 계속 찍어주면댐 -->
 	<!-- 비동기 통신으로 잘 실행댈지 모르게씀 -->
 	
    <div id="map" style="width:500px;height:400px;"></div>
    
    <script>
        //(2) 지도 생성
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(35.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        //(3) 마커 생성
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(35.450701, 126.570667);
												 //아두이노에서 가져온 값 들어갈 위치
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    

        var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            position: iwPosition,
            content: iwContent
        });

        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, marker); 

	//페이지 로드완료시 3초마다 지속적으로 testMethod호출
	$(document).ready(function(){
		setInterval(function() {testMethod()}, 3000);
		setInterval(function() {alarm()}, 3000)
	 })
 	
	 let result = null;
	 
	//arduino값을 가진 controller 메서드 호출
	function testMethod(){
		$.ajax({
			url : "test2",
			type : "get",
			datatype : "String",
			success : function(res){
				result = res;
				document.getElementById("arduino").innerHTML = res;
			},
			error : function(){
			
			}
		})
	} // TODO -> 위도 경도 값 같이 보낼텐데, 파싱 어떻게? => res.substr(0,9)=위도, res.substr(10)=경도
			
	function alarm(){
		$.ajax({
			url : "^%$%$^#WE",
			type : "post",
			datatype : "int",
			success : function(res){ 
				
			},
			error : function(){
				
			}
		})
	}

</script>
</body>
</html>