package com.hk.answerboard.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogExecute {
	
	
	public void before(JoinPoint join) //JoinPoin 클래스는 대문자인걸로 import
	{
		Logger log = LoggerFactory.getLogger(join.getTarget()+"");
		log.debug("시작");
		log.info("----------시작----------");
		
	}
	
	public void afterReturning(JoinPoint join) {
		
		Logger log =LoggerFactory.getLogger(join.getTarget()+"");
		log.debug("끝");
		log.info("----------끝----------");
	}
	
	public void daoError(JoinPoint join) {
		
		Logger log =LoggerFactory.getLogger(join.getTarget()+"");
		log.debug("에러"+join.getArgs());
		log.debug("에러"+join.toString());
	}

	
}
