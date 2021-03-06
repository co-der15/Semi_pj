<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>

<link rel="stylesheet" href="/travelMaker/resources/css/common.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="/travelMaker/resources/js/jquery-3.6.0.min.js"></script>
<style>
/* Google Font CDN Link */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}
/* body{
  min-height: 100vh;
  width: 100%;
 /*  background: #c8e8e9; */
/*   display: flex;
  align-items: center;
  justify-content: center;
} */ 
.container{
  width: 85%;
  background: #fff;
  border-radius: 6px;
  padding: 20px 60px 30px 40px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
.container .content{
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.container .content .left-side{
  width: 25%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 15px;
  position: relative;
}
.content .left-side::before{
  content: '';
  position: absolute;
  height: 70%;
  width: 2px;
  right: -15px;
  top: 50%;
  transform: translateY(-50%);
  background: #afafb6;
}
.content .left-side .details{
  margin: 14px;
  text-align: center;
}
.content .left-side .details i{
  font-size: 30px;
/*   color: #3e2093; */
 color:#2e947e;
  margin-bottom: 10px;
}
.content .left-side .details .topic{
  font-size: 18px;
  font-weight: 500;
}
.content .left-side .details .text-one,
.content .left-side .details .text-two{
  font-size: 14px;
  color: #afafb6;
}
.container .content .right-side{
  width: 75%;
  margin-left: 75px;
}
.content .right-side .topic-text{
  font-size: 23px;
  font-weight: 600;
 /*  color: #3e2093; */
   color:#2e947e;
}
.right-side .input-box{
  height: 50px;
  width: 100%;
  margin: 12px 0;
}
.right-side .input-box input,
.right-side .input-box textarea{
  height: 100%;
  width: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  background: #F0F1F8;
  border-radius: 6px;
  padding: 0 15px;
  resize: none;
}
.right-side .message-box{
  min-height: 110px;
}
.right-side .input-box textarea{
  padding-top: 6px;
}
.right-side .button{
  display: inline-block;
  margin-top: 12px;
}
.right-side .button input[type="button"]{
  color: #fff;
  font-size: 18px;
  outline: none;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
 /*  background: #3e2093; */
   background:#2e947e;
  cursor: pointer;
  transition: all 0.3s ease;
}
.button input[type="button"]:hover{
  /* background: #5029bc; */
  background : #25593b;
}

@media (max-width: 950px) {
  .container{
    width: 90%;
    padding: 30px 40px 40px 35px ;
  }
  .container .content .right-side{
   width: 75%;
   margin-left: 55px;
}
}
@media (max-width: 820px) {
  .container{
    margin: 40px 0;
    height: 100%;
  }
  .container .content{
    flex-direction: column-reverse;
  }
 .container .content .left-side{
   width: 100%;
   flex-direction: row;
   margin-top: 40px;
   justify-content: center;
   flex-wrap: wrap;
 }
 .container .content .left-side::before{
   display: none;
 }
 .container .content .right-side{
   width: 100%;
   margin-left: 0;
 }
}


</style>
</head>
<body>


<%@ include file="../common/banner.jsp" %>
	<%@ include file="/views/common/sidebar.jsp" %>  
	
	
	 <div class="container">
    <div class="content">
      <div class="left-side">
        <div class="address details">
          <i class="fas fa-map-marker-alt"></i>
          <div class="topic">Address</div>
          <div class="text-one">Teheran-ro 10-gil, Gangnam-gu,</div>
          <div class="text-two">Seoul, Republic of Korea</div>
        </div>
        <div class="phone details">
          <i class="fas fa-phone-alt"></i>
          <div class="topic">Phone</div>
          <div class="text-one">+888-502-3333</div>
          <div class="text-two">+0096-3434-5678</div>
        </div>
        <div class="email details">
          <i class="fas fa-envelope"></i>
          <div class="topic">Email</div>
          <div class="text-one">codinglab@gmail.com</div>
          <div class="text-two">info.codinglab@gmail.com</div>
        </div>
      </div>
      <div class="right-side">
        <div class="topic-text">Contact Us</div>
        <p>   travel maker에 대한 깊은 관심에 감사드립니다. <br />
        서비스에 대한 문의, 불만, 제안, 칭찬과 격려사항을 알려주세요.
                <br />운영 시간(평일 09:00~18:00)</p>
      <form action="#">
        <div class="input-box">
          <input type="text" placeholder="성함 " required>
        </div>
        <div class="input-box">
          <input type="text" placeholder="답변 받으실 이메일" required>
        </div>
        <div class="input-box message-box">
   <input type="textarea" placeholder="내용을 입력해주세요." required> 
        </div>
        <div class="button">
          <input type="button" value="작성 완료" onclick="myFunction()">
          <script>
function myFunction() {
  alert("등록 완료!");
}
</script>
          
        </div>
      </form>
    </div>
    </div>
  </div>

<!-- 	<div id="container">
        <div class="content">
          <div class="visualArea2 inquiryBg">
            <div class="inner" style="padding-bottom:0px;">
              <h1 class="titDep1">Contact Us</h1>
              <p class="subCopy">
                travel maker에 대한 깊은 관심에 감사드립니다. 서비스에 대한
                문의, 불만, 제안, 칭찬과 격려사항을 알려주세요.<br />
                주말 및
                공휴일 등 운영 시간(평일 09:00~18:00)외에 접수해 주신 내용은<br /> 
                잘 보관하였다가 CS center 운영 시작 후
                신속히 답변드리겠습니다.
              </p>
            </div>
          </div>
          <div id="div1">
          visualArea end
          <div class="contArea">
            <ul class="tabType01">
              <li data-title="문의" data-desc="문의하기">
                <a
                  href="javascript:page(1);"
                  role="button"
                  aria-selected="true"
                  >문의하기</a
                >
              </li>
              선택 된 태그에 aria-selected="true" 추가
              <li>
                <a href="javascript:page(2);" role="button">답변보기</a>
              </li>
            </ul>
            <div class="faq-form-warp">
              
              <div class="qna-form-area">
                <table class="qna-form">
                  <colgroup>
                    <col style="width: 139px">
                    <col style="width: 432px">
                    <col style="width: 165px">
                    <col style="width: 432px">
                  </colgroup>
                  <tr>
                    <th scope="row">이름</th>
                    <td>
                      <input class="int w432" type="text" class="input" name="CUST_NM" id="CUST_NM">
                    </td>
                    <th scope="row">연락처</th>
                    <td>
                      <div class="d-flex-row gap-21">
                      	<input type="hidden" name="MOBILE" id="MOBILE">
                        <input class="int w112" type="text" name="MOBILE1" id="MOBILE1" maxlength="4"  onBlur="javascript:isNumAlert('연락처',this);">
                        <span>-</span>
                        <input class="int w112" type="text" name="MOBILE2" id="MOBILE2" maxlength="4"  onBlur="javascript:isNumAlert('연락처',this);">
                        <span>-</span>
                        <input class="int w112" type="text" name="MOBILE3" id="MOBILE3" maxlength="4"  onBlur="javascript:isNumAlert('연락처',this);">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">이메일</th>
                    <td><input class="int w432" type="text" name="EMAIL" id="EMAIL"></td>
                    <th scope="row">비밀번호</th>
                    <td><input class="int w432" type="password" name="CUST_PASSWORD" id="CUST_PASSWORD"></td>
                  </tr>
                  <tr>
                    <th scope="row">제목</th>
                    <td colspan="3">
                      <input class="int w1029" type="text" name="ACPT_TITLE" id="ACPT_TITLE">
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">내용</th>
                    <td colspan="3">
                      <textarea name="ACPT_DESC" id="ACPT_DESC" class="int w1029"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">파일첨부</th>
                    <td colspan="3">
                      <input class="int w587" id="filename" type="text">
                      <label for="FILE_1" class="btn bg-gray">
                        <input type="file" name="FILE_1" id="FILE_1" hidden="true"/>
                        	파일선택
                      </label>
                    </td>
                  </tr>
                </table>
                <p>파일용량: 10MB까지<br>
                  첨부 가능 형식 : JPG, JPEG, JPE, JFIF, GIF, TIF, TIFF, PNG / zip</p>
              </div>
            </div>
            submit button
            <button type="button" id="btnInsert" class="btnMC btnM insertBtn" onclick="insert();">
              문의 등록하기
            </button>         
          
          </div>

          <div class="side-box">
            <span>고객센터</span>
            <strong>080.208.1588</strong>
            <p>평일 09:00 ~ 18:00<br>
            (점심시간 12:00 ~ 13:00)</p>
          </div>
        </div>
      </div>
    </div> -->
    
    
    <br />
    <br />
    <br />
    <%@ include file="/views/common/footer.jsp" %> 
</body>
</html>