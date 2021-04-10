package com.example.board.mapper;

import java.util.List;
import java.util.Map;

import com.example.board.BoardVo;

public interface IBoardMapper 
{
	List<BoardVo> BoardList(Object obj); // 전체 글 리스트
	BoardVo BoardOne(Object obj);		 // 글 한개의 정보 가져오기
	Integer BoardCnt(Object obj);		 // 글 갯수 가져오기
	void BoardInsert(BoardVo obj);		 // 글 작성
	Integer BoardMaxSeq();				 // 새로운 글 작성시 글 번호 + 1
	void BoardStepUpdate(Object obj);	 // 답변을 달게 되면 step / level 이 증가함
	void BoardHitUpdate(Object obj);	 // 조회수 증가
	void BoardUpdate(BoardVo obj);		 // 글 수정
	void BoardDelete(Integer seq);		 // 글 삭제
}
