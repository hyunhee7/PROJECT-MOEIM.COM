package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.dto.KnowhowCommentDto;
import com.mycompany.myapp.dto.KnowhowDto;
import com.mycompany.myapp.dto.KnowhowTagDto;


public interface KnowhowDao {
	public List<KnowhowDto> getList();
	public List<KnowhowDto> getSearchList(List<Integer> kh_nums);	
	public int insert(KnowhowDto dto);
	public KnowhowDto getDetail(KnowhowDto dtoNum);
	public KnowhowDto getFile(KnowhowDto dtoNum);
	public List<KnowhowTagDto> getTags(KnowhowDto dtoNum);
	public void update(KnowhowDto dto) ;
	public void delete(int kh_num);
	public void cmtInsert(KnowhowCommentDto dto);
	public List<KnowhowCommentDto> getCmts(KnowhowDto dtoNum);
	public List<KnowhowDto> getRecentList();
}
