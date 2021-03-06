package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.dto.KnowhowCommentDto;
import com.mycompany.myapp.dto.KnowhowDto;
/* 노하우 Service */
public interface KnowhowService {
    public List<KnowhowDto> list();                                                     /* 노하우 리스트 */
    public List<KnowhowDto> Searchlist(String tag_name);                                /* 노하우 태그별 검색 */
    public int insert(KnowhowDto dto, String id, String realPath);                      /* 노하우 등록 */
    public KnowhowDto detail(int kh_num);                                               /* 노하우 상세보기 */
    public KnowhowDto getFile(int dtoNum);                                              /* 노하우 첨부파일 다운로드 준비 */
    public void update(KnowhowDto dto, int kh_num, String id, String realPath);         /* 노하우 수정 */
    public void delete(int kh_num);                                                     /* 노하우 삭제 */
    public void cmtInsert(KnowhowCommentDto dto);                                       /* 노하우 댓글 등록 */
    public List<KnowhowDto> recentList();                                               /* 노하우 최근 게시물  */
}
