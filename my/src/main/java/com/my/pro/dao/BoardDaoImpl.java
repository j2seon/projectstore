package com.my.pro.dao;


import com.my.pro.domain.BoardDto;
import com.my.pro.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    SqlSession session;

    private static String namespace = "com.my.pro.dao.BoardMapper.";


    @Override
    public int insert(BoardDto dto) throws Exception{
        return session.insert(namespace+"insert",dto);
    }

    public List<BoardDto> selectPage(Map map)throws Exception{
        return session.selectList(namespace+"selectPage",map);

    }

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage",sc);
    }

    @Override
    public int searchResultCount(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCount",sc);
    }

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt",cnt);
        map.put("bno",bno);
        return session.update(namespace+"updateCommentCnt", map);
    }

    @Override
    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }
    @Override
    public BoardDto select(Integer bno)throws Exception{
        return session.selectOne(namespace+"select",bno);
    }

    @Override
    public List<BoardDto> selectAll()throws Exception{
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(Integer bno, String writer) throws Exception{
        Map map = new HashMap();
        map.put("bno",bno);
        map.put("writer",writer);
        return session.delete(namespace+"delete",map);
    }

    @Override
    public int update(BoardDto dto) throws Exception{
        return session.update(namespace+"update",dto);
    }

    @Override
    public int increaseViewCnt(Integer bno){
        return session.update(namespace+"increaseViewCnt",bno);
    }



}
