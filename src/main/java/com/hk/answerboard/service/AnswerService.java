package com.hk.answerboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.answerboard.daos.IAnswerDao;
import com.hk.answerboard.dtos.AnswerDto;

@Service
public class AnswerService implements IAnsService{

	@Autowired
	private IAnswerDao answerDao;
	
	@Override
	public List<AnswerDto> getAllList() {
		// TODO Auto-generated method stub
		return answerDao.getAllList();
	}

	@Override
	public boolean insertBoard(AnswerDto dto) {
		// TODO Auto-generated method stub
		return answerDao.insertBoard(dto);
	}

	@Override
	public boolean readCount(int seq) {
		// TODO Auto-generated method stub
		return answerDao.readCount(seq);
	}

	@Override
	public AnswerDto getBoard(int seq) {
		// TODO Auto-generated method stub
		return answerDao.getBoard(seq);
	}

	@Override
	public boolean updateBoard(AnswerDto dto) {
		// TODO Auto-generated method stub
		return answerDao.updateBoard(dto);
	}
	
	@Transactional
	@Override
	public boolean mulDelBoard(String[] seq) {
		// TODO Auto-generated method stub
		return answerDao.mulDelBoard(seq);
	}

	@Transactional
	@Override
	public boolean replyBoard(AnswerDto dto) {
		int count =0;
		answerDao.replyBoardUpdate(dto.getSeq());
		count = answerDao.replyBoardInsert(dto);
		return count>0?true:false;
	}

	@Override
	public AnswerDto getBoardAjax(int seq) {
		return null;
	}
	
	

}
