package com.kh.web.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.web.notice.model.service.NoticeService;
import com.kh.web.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/update.no")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService service = new NoticeService();
		
		// 1. JSP 에서 multipart 로 전송했는지 확인
		if( ! ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("error-msg", "multipart 전송이 아닙니다!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 2. 전송받을 최대 크기
		// 10MB
		int maxSize = 1024 * 1024 * 10;
		
		// 3. 저장할 폴더 위치 
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/noticeUploadFiles";
		// ** 해당 위치에 폴더가 미리 만들어져 있어야 한다!
		
		// 4. 파일 처리를 위한 multipart 객체 선언
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8",
														new DefaultFileRenamePolicy());
		
		// 5. 서비스 처리
		// 5-1. 기본 전송값(파일 X)
		int nno = Integer.parseInt(mre.getParameter("nno"));
		String title = mre.getParameter("title");
		String content = mre.getParameter("content");
		
		// 5-2. 파일 전송(전송 후 보낸 파일 이름)
		String filename = mre.getFilesystemName("file");
		
		// 5-3. 이전 정보 확인
		Notice n = service.updateView(nno);
		
		if(filename != null && filename.length() > 0) {
			if(n.getNoticefile() != null) {
				// 이전 파일 -> 새 파일 (교체)
				File originFile = new File(savePath + "/" + n.getNoticefile());
				
				boolean check = originFile.delete();
				
				System.out.println("이전 파일 삭제 여부 : " + check);
			}
			
			// 새 파일 등록
			n.setNoticefile(filename);
		}
		n.setNtitle(title);
		n.setNcontent(content);
		
		// 6. 변경사항이 담긴 n 를 들고 서비스로 출발!
		int result = service.updateNotice(n);
		
		if( result > 0 ) {
			response.sendRedirect("selectList.no"); // 게시글 목록
		} else {
			request.setAttribute("error-msg", "게시글 수정 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
