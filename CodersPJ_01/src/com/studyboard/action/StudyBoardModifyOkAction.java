package com.studyboard.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StudyBoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직
		
		StudyBoardDTO dto = new StudyBoardDTO();
		
		
		 //파일 업로드 시 설정 내용
	      //1.파일 저장 경로 지정
	      String saveFolder = "C:\\Users\\user1\\git\\Coders_Project\\CodersPJ_01\\WebContent\\study_upload";
	      
	      
	      
	      //2.첨부파일 크기 지정
	      int fileSize = 10 * 1024 * 1024;   //10MB
	      
	      //3.MultipartRequest 객체 생성
	      //  ==> 파일을 업로드하기 위한 객체 생성
	      MultipartRequest multi = new MultipartRequest(
	            request,       //일반적인 request 객체
	            saveFolder,    //첨부파일이 저장될 경로
	            fileSize,       //업로드할 첨부파일의 최대 크기
	            "UTF-8",      //문자 인코딩 방식
	            new DefaultFileRenamePolicy());   //파일 이름이 같은 경우 중복되지 않게 설정하는 생성자
	      
	      String study_title = 
	      multi.getParameter("study_title").trim();
	      
	      String studyboard_cont = 
	      multi.getParameter("study_cont").trim();
	      
	      int study_people = Integer.parseInt(multi.getParameter("study_people").trim());
	      String study_start = multi.getParameter("study_start").trim();
	      String study_end = multi.getParameter("study_end").trim();
	
	      
	      File studyboard_file = multi.getFile("study_file");
	      
	      //히든으로 넘어온 값 받아주기
	      int studyboard_no = 
	      Integer.parseInt(multi.getParameter("study_no").trim());
	      
	      //첨부파일이 존재하지 않은 경우
			if (studyboard_file != null) {
				String study_file = multi.getFilesystemName("study_file");
				dto.setStudy_file(study_file);
			}
			
	      dto.setStudy_num(studyboard_no);
	      dto.setStudy_title(study_title);
	      dto.setStudy_cont(studyboard_cont);
	      dto.setStudy_people(study_people);
	      dto.setStudy_start(study_start);
	      dto.setStudy_end(study_end);
	         
	      StudyBoardDAO dao = StudyBoardDAO.getInstance();
	      
	      int res = dao.modifyStudyboard(dto);
	      
	      
	      ActionForward forward = new ActionForward();
	      
	     PrintWriter out = response.getWriter();
	     
	     if(res > 0) {
	    	  forward.setRedirect(true);
	    	  forward.setPath("studyBoard_content.do?no="+studyboard_no);
	     
	     }else {
	    	  out.println("<script>");
	    	  out.println("alert('실패')");
	    	  out.println("history.back()");
	    	  out.println("</script>");
	      }
		return forward;
	}

}