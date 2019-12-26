package com.sc.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.entity.SaleKhinfo;
import com.sc.entity.SaleKhloss;
import com.sc.service.SaleKhLossService;
import com.sc.service.SaleService;

@Controller
@RequestMapping("/SalekhlossController")
public class SaleKhLossController {
	
	@Autowired
	SaleKhLossService saleKhLossService;
	
	@RequestMapping("/list1.do")
	public ModelAndView list1(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="10")Integer pageSize,
			SaleKhloss l,
			String iscg){
		
		mav.addObject("p", saleKhLossService.lossselect(pageNum, pageSize, l));
		if(iscg!=null){
			mav.addObject("iscg", "yes");
		}
		mav.setViewName("wlq/khloss");
		
		return mav;
	}
	
	@RequestMapping("/lossupdate.do")
	public ModelAndView lxjlupdate(ModelAndView mav,
			HttpServletRequest req,
			Long id,
			SaleKhloss l){
		System.out.println(l);
		l.setLastModified(new Date());
		this.saleKhLossService.lossupdate(l);
		this.saleService.delete(id);
		mav.setViewName("redirect:list.do");//重定向到list方法
		return mav;		
	}
	
	@RequestMapping("/lossdelete.do")
	public ModelAndView fkdelete(ModelAndView mav,
			Long lossid){
		System.out.println("删除用户！"+lossid);
		this.saleKhLossService.lossdelete(lossid);
		mav.setViewName("redirect:list.do");//重定向到list方法
		return mav;
	}
	
	@Autowired
	SaleService saleService;
	
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="10")Integer pageSize,
			SaleKhinfo s,
			String iscg){
		
		mav.addObject("p", saleService.lossselect1(pageNum, pageSize,s));
		if(iscg!=null){
			mav.addObject("iscg", "yes");
		}
		mav.setViewName("wlq/khloss");
		
		return mav;
	}
	
	@RequestMapping("/losshuifu.do")
	public ModelAndView losshuifu(ModelAndView mav,
			HttpServletRequest req,
			Long id){
		
		System.out.println(id);
		SaleKhinfo  s =this.saleKhLossService.idselect(id);
		s.setUserState("正在合作");
		s.setLastModified(new Date());
		this.saleKhLossService.losshuifu(s);
		mav.setViewName("redirect:list.do");//重定向到list方法
		return mav;		
	}

}
