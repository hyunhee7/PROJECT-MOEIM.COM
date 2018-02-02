package com.mycompany.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.dto.ProjPostTagDto;



@Repository
public class PostTagDaoImp implements PostTagDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ProjPostTagDto dto) {
		session.insert("projPostTag.insert", dto);
	}
	
}
