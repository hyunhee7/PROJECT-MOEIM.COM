package com.mycompany.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.dao.KnowhowTagDao;
import com.mycompany.myapp.dto.KnowhowDto;
import com.mycompany.myapp.dto.KnowhowTagDto;

@Service
public class KnowhowTagServiceImpl implements KnowhowTagService {

	@Autowired
	private KnowhowTagDao knowhowTagDao;	
	
	@Override
	public void insert(KnowhowDto dto) {
		String[] tags = dto.getTags();       

        for(int i=0;i<tags.length;i++) {
        	KnowhowTagDto tagDto = new KnowhowTagDto();
        	tagDto.setTag_kh_num(dto.getKh_num());
            tagDto.setTag_name(tags[i]);
            System.out.println("tagName"+tagDto.getTag_name());
        	knowhowTagDao.insert(tagDto);
        }	
	}
	
	@Override
	public void update(KnowhowDto dto) {
		String[] tags = dto.getTags();       
		KnowhowTagDto tagDto = new KnowhowTagDto();

        for(int i=0;i<tags.length;i++) {

        	String tag_name = tags[i];
    		tagDto.setTag_name(tag_name);
        	tagDto.setTag_kh_num(dto.getKh_num());
        	boolean exist = knowhowTagDao.findTag(tagDto);
        	System.out.println("exist:"+exist);
        	if(exist) {
        		continue;
        	}else {
                System.out.println("tagName"+tagDto.getTag_name());
            	knowhowTagDao.insert(tagDto);
        	}
        }	
        
        // 이전에 추가한 Tag를 지운 경우 
        
	}	

}
