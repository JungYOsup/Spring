package com.hk.answerboard.service;

import java.util.List;

import com.hk.answerboard.dtos.AnswerDto;

public interface IAnsService {
	
	//글목록 조회: select 문
			public List<AnswerDto> getAllList();
			
			//글쓰기(새로운글) :insert 문
			public boolean insertBoard(AnswerDto dto);
			
			//글조회수 : update문
			public boolean readCount(int seq);

			//글상세보기 :select 문 
			public AnswerDto getBoard(int seq);
			
			//글 수정하기 : update문
			public boolean updateBoard(AnswerDto dto);

			//글 여러개 삭제하기 : update문 - 트랜젝션 처리
			public boolean mulDelBoard(String[] seq);
			
			//답글달기 : update/insert문 - 트랜젝션처리 
			//답글을 닫기전에 그룹글에서 부모의 step보다 큰 step을 가진 글들에 대해 step을 1씩 증가시켜주고 (update)
			//부모의 글의 step을 1 증가시킨 값을 추가하는 답글에 step에 추가하여 insert 한다.
			public boolean replyBoard(AnswerDto dto);
		
			//ajax처리
			public AnswerDto getBoardAjax(int seq);

}
