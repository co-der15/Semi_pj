<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.web.board.model.vo.*, java.util.*"%>
    
<% 
    Board b = (Board)request.getAttribute("board"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="/travelMaker/resources/css/common.css">
<link rel="stylesheet" href="/travelMaker/resources/css/mapApi.css">
<link rel="stylesheet" href="/travelMaker/resources/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
	.{
	font-family: "Poppins" , "sans-serif";
	}
	
	.outer{
		width:1000px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	.board_wrap{
		border: 10px solid #00ad8e;
	}
	
	#content {
		width:800px;
		height:230px;
	}
	td{
		width:800px;
	}
	
	#titleImg {
		width:700px;
		height:400px;
	}
	
	#board_view_wrap{
		border-radius: 30%;
	}
	
	#mappan{
	font-size:3px;
	}
	
</style>
</head>
<body>
	
	<%@ include file="../common/banner.jsp" %>
	<%@ include file="/views/common/sidebar.jsp" %>  

		<div class="board_wrap">
        <div class="board_view_wrap" >
            <div class="board_view">
                <div class="title">
                    <%= b.getBtitle() %>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><%= b.getBwriter() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%= b.getBdate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%= b.getBcount() %></dd>
                    </dl>
                    <dl>
                    	<dt>첨부파일</dt>
                    	<dd><a href="/travelMaker/resources/boardUploadFiles/<%=b.getBoardfile() %>" download>
							<%=b.getBoardfile() %>
							</a></dd>
                    </dl>
                </div>
                <div class="cont">
                	<div id="ImgfileArea">
							<% if (b.getBoardfile() != null) { %>
			                	<img id="titleImg" src="<%= request.getContextPath() %>/resources/boardUploadFiles/<%= b.getBoardfile() %>">							
							<% } else { %>
								
							<% } %>
							</div>
                    <table width="800px" >
                        <tr>
                            
                        </tr>
                        			
                        <tr>
                            <td colspan="3">
                               <p id="content"><%= b.getBcontent() %></p>
                            </td>
                        </tr>
                        
                        <tr>           
                            <td height="400" width="600px" valign="top" style="padding:5px; ">
                            <p id="mapan">* 지도에 근처 맛집과 명소를 검색해보세요!</p>
                            <div class="map_wrap">
						    <div id="map" style="width:840px; height:400px; position:relative;overflow:hidden;"></div>
						    <div id="menu_wrap" class="bg_white">
						        <div class="option" >
						            <div>
						                <form onsubmit="searchPlaces(); return false;">
						                    키워드 : <input type="text" value="" id="keyword" size="15"> 
						                    <button type="submit">검색하기</button> 
						                </form>
						            </div>
						        </div>
						        <hr><hr />
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
							</div>
						
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8e5a15139620f45946a5bebf22726ef&libraries=services"></script>
						<script>
						// 마커를 담을 배열입니다
						var markers = [];
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
						        level: 13 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 지도에 확대 축소 컨트롤을 생성한다
						var zoomControl = new kakao.maps.ZoomControl();

						// 지도의 우측에 확대 축소 컨트롤을 추가한다
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places();  
						
						// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({zIndex:1});
						
						// 키워드로 장소를 검색합니다
						searchPlaces();
						
						// 키워드 검색을 요청하는 함수입니다
						function searchPlaces() {
						
						    var keyword = document.getElementById('keyword').value;
						
						    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
						    ps.keywordSearch( keyword, placesSearchCB); 
						}
						
						// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
						    if (status === kakao.maps.services.Status.OK) {
						
						        // 정상적으로 검색이 완료됐으면
						        // 검색 목록과 마커를 표출합니다
						        displayPlaces(data);
						
						        // 페이지 번호를 표출합니다
						        displayPagination(pagination);
						
						    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
						
						        alert('검색 결과가 존재하지 않습니다.');
						        return;
						
						    } else if (status === kakao.maps.services.Status.ERROR) {
						
						        alert('검색 결과 중 오류가 발생했습니다.');
						        return;
						
						    }
						}
						
						// 검색 결과 목록과 마커를 표출하는 함수입니다
						function displayPlaces(places) {
						
						    var listEl = document.getElementById('placesList'), 
						    menuEl = document.getElementById('menu_wrap'),
						    fragment = document.createDocumentFragment(), 
						    bounds = new kakao.maps.LatLngBounds(), 
						    listStr = '';
						    
						    // 검색 결과 목록에 추가된 항목들을 제거합니다
						    removeAllChildNods(listEl);
						
						    // 지도에 표시되고 있는 마커를 제거합니다
						    removeMarker();
						    
						    for ( var i=0; i<places.length; i++ ) {
						
						        // 마커를 생성하고 지도에 표시합니다
						        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
						            marker = addMarker(placePosition, i), 
						            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
						
						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        bounds.extend(placePosition);
						
						        // 마커와 검색결과 항목에 mouseover 했을때
						        // 해당 장소에 인포윈도우에 장소명을 표시합니다
						        // mouseout 했을 때는 인포윈도우를 닫습니다
						        (function(marker, title) {
						            kakao.maps.event.addListener(marker, 'mouseover', function() {
						                displayInfowindow(marker, title);
						            });
						
						            kakao.maps.event.addListener(marker, 'mouseout', function() {
						                infowindow.close();
						            });
						
						            itemEl.onmouseover =  function () {
						                displayInfowindow(marker, title);
						            };
						
						            itemEl.onmouseout =  function () {
						                infowindow.close();
						            };
						        })(marker, places[i].place_name);
						
						        fragment.appendChild(itemEl);
						    }
						
						    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
						    listEl.appendChild(fragment);
						    menuEl.scrollTop = 0;
						
						    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						    map.setBounds(bounds);
						}
						
						// 검색결과 항목을 Element로 반환하는 함수입니다
						function getListItem(index, places) {
						
						    var el = document.createElement('li'),
						    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
						                '<div class="info">' +
						                '   <h5>' + places.place_name + '</h5>';
						
						    if (places.road_address_name) {
						        itemStr += '    <span>' + places.road_address_name + '</span>' +
						                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
						    } else {
						        itemStr += '    <span>' +  places.address_name  + '</span>'; 
						    }
						                 
						      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
						                '</div>';           
						
						    el.innerHTML = itemStr;
						    el.className = 'item';
						
						    return el;
						}
						
						// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
						function addMarker(position, idx, title) {
						    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
						        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
						        imgOptions =  {
						            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
						        },
						        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
						            marker = new kakao.maps.Marker({
						            position: position, // 마커의 위치
						            image: markerImage 
						        });
						
						    marker.setMap(map); // 지도 위에 마커를 표출합니다
						    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
						
						    return marker;
						}
						
						// 지도 위에 표시되고 있는 마커를 모두 제거합니다
						function removeMarker() {
						    for ( var i = 0; i < markers.length; i++ ) {
						        markers[i].setMap(null);
						    }   
						    markers = [];
						}
						
						// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
						function displayPagination(pagination) {
						    var paginationEl = document.getElementById('pagination'),
						        fragment = document.createDocumentFragment(),
						        i; 
						
						    // 기존에 추가된 페이지번호를 삭제합니다
						    while (paginationEl.hasChildNodes()) {
						        paginationEl.removeChild (paginationEl.lastChild);
						    }
						
						    for (i=1; i<=pagination.last; i++) {
						        var el = document.createElement('a');
						        el.href = "#";
						        el.innerHTML = i;
						
						        if (i===pagination.current) {
						            el.className = 'on';
						        } else {
						            el.onclick = (function(i) {
						                return function() {
						                    pagination.gotoPage(i);
						                }
						            })(i);
						        }
						
						        fragment.appendChild(el);
						    }
						    paginationEl.appendChild(fragment);
						}
						
						// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
						// 인포윈도우에 장소명을 표시합니다
						function displayInfowindow(marker, title) {
						    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
						
						    infowindow.setContent(content);
						    infowindow.open(map, marker);
						}
						
						 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
						function removeAllChildNods(el) {   
						    while (el.hasChildNodes()) {
						        el.removeChild (el.lastChild);
						    }
						}
						 
						 
						</script>    
						</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="bt_wrap">
                <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo'">메뉴로 돌아가기</button>
			<% if(m != null && m.getUserId().equals(b.getBwriter())){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/updateView.bo?bno='+<%=b.getBno()%>">수정하기</button>
			<% } %>
            </div>
        </div>
    </div>
	<br />
	<br />
	<br />
	

	<%@ include file="../common/footer.jsp" %>	

</body>
</html>