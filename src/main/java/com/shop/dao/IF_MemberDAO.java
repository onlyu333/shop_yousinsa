package com.shop.dao;

import com.shop.vo.MemberVO;

public interface IF_MemberDAO {
   
   public void insertOne(MemberVO mvo) throws Exception;
   public int idCheck(String mid) throws Exception;
   public MemberVO memberLogin(MemberVO mvo) throws Exception;
   public MemberVO selectOne(String mid) throws Exception;
   public void memberUpdate(MemberVO mvo)throws Exception;
   public void memDel(String mid) throws Exception;
}