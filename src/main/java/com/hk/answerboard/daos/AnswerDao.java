package com.hk.answerboard.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.answerboard.dtos.AnswerDto;

@Repository
public class AnswerDao implements IAnswerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.ansboard.";
	
	@Override
	public List<AnswerDto> getAllList() {
			
				
		return sqlSession.selectList(namespace+"boardlist");
	}

	@Override
	public boolean insertBoard(AnswerDto dto) {
		int count =0;
		count =sqlSession.insert(namespace+"insertboard", dto);
		
		return count>0?true:false;
	}

	@Override
	public boolean readCount(int seq) {
		
		int count =0;
		count = sqlSession.update(namespace+"updatecount", seq);
		
		return count>0?true:false;
	}

	@Override
	public AnswerDto getBoard(int seq) {
						
		return sqlSession.selectOne(namespace+"detailboard", seq);
	}

	@Override
	public boolean updateBoard(AnswerDto dto) {
		int count =0;
		count = sqlSession.update(namespace+"updateboard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean mulDelBoard(String[] seq) {
		Map<String, String[]>map = new HashMap<String,String[]>();
		map.put("seqs", seq);
		int count = sqlSession.update(namespace+"muldelboard",seq);
		
		return count>0?true:false;
	}

	@Override
	public boolean replyBoard(AnswerDto dto) {
		
		return false;
	}

	@Override
	public int replyBoardUpdate(int seq) {
		return sqlSession.update(namespace+"ansupdate", seq);
	}

	@Override
	public  int replyBoardInsert(AnswerDto dto) {
		
		return sqlSession.insert(namespace+"ansinsert", dto);
	}

	@Override
	public AnswerDto getBoardAjax(int seq) {
		return null;
	}
	
	
	
	
}
