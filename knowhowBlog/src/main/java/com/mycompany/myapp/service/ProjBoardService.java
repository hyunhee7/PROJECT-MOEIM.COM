package com.mycompany.myapp.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.dto.ProjBoardDto;

public interface ProjBoardService {
	public void insert(ProjBoardDto dto,HttpServletRequest request);
	public ModelAndView list();
}
