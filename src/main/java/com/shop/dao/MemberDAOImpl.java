package com.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.vo.MemberVO;
@Repository
public class MemberDAOImpl implements IF_MemberDAO{
   
   private static String mapperQuery= "com.shop.dao.IF_MemberDAO";
   
   
   @Inject
   private SqlSession sqlSession;

   @Override
   public void insertOne(MemberVO mvo) throws Exception {
      // TODO Auto-generated method stub
      sqlSession.insert(mapperQuery+".insertOne",mvo);
      
   }

@Override
public int idCheck(String mid) throws Exception{
	// TODO Auto-generated method stub
	return sqlSession.selectOne(mapperQuery+".idCheck",mid);
}

@Override
public MemberVO memberLogin(MemberVO mvo) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectOne(mapperQuery+".memberLogin",mvo);
}


@Override
public void memberUpdate(MemberVO mvo) throws Exception {
   // TODO Auto-generated method stub
   System.out.println(mvo.getMname()+"----dao단 멤버수정");
   sqlSession.update(mapperQuery+".memberUpdate",mvo);
}

@Override
public MemberVO selectOne(String mid) throws Exception {
   // TODO Auto-generated method stub
   return sqlSession.selectOne(mapperQuery+".selectOne",mid);
}

@Override
public void memDel(String mid) throws Exception {
   // TODO Auto-generated method stub
   System.out.println(mid+"----dao단 멤버삭제");
   sqlSession.delete(mapperQuery+".memDel",mid);
}   
     

   
}