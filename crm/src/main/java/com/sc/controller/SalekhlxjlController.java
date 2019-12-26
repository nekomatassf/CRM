package com.sc.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.entity.SaleKhfeedback;
import com.sc.entity.SaleKhrecord;
import com.sc.service.SalekhlxjkService;

@Controller
@RequestMapping("/SalekhlxjlController")
public class SalekhlxjlController {
	@Autowired
	SalekhlxjkService salekhlxjkService;
	
	@RequestMapping("/lxjlcx.do")
	public ModelAndView lxjlcx(ModelAndView mav,
			HttpSession se,
			Long cid,
			String cname){
		if(cid==null){		
			cid=(Long)se.getAttribute("cid");
		}
		if(cname==null){
			cname=(String)se.getAttribute("cname");
		}
		mav.addObject("q", salekhlxjkService.lxjlcx(cid));
		se.setAttribute("cid", cid);
		se.setAttribute("cname", cname);
		mav.setViewName("wlq/lxjl");
		
		return mav;
		
	}
	
	@RequestMapping("/lxjlupdate.do")
	public ModelAndView lxjlupdate(ModelAndView mav,
			HttpServletRequest req,
			SaleKhrecord r){
		r.setLastModified(new Date());
		this.salekhlxjkService.lxjlupdate(r);
		mav.setViewName("redirect:lxjlcx.do");//重定向到list方法
		return mav;		
	}
	
	@RequestMapping("/golxjladd.do")
	public ModelAndView golxadd(ModelAndView mav,
			Long cid){
		mav.addObject("cid",cid);
		mav.setViewName("wlq/lxjladd");
		return mav;
		
	}
	
	@RequestMapping("/lxjladd.do")
	public ModelAndView lxjladd(ModelAndView mav,
			HttpServletRequest req,
			SaleKhrecord r){
		r.setLastModified(new Date());
		this.salekhlxjkService.lxjladd(r);
		mav.addObject("iscg", "yes");
		mav.setViewName("redirect:lxjlcx.do?iscg=yes");
		return mav;
}
	@RequestMapping("/lxjldelete.do")
	public ModelAndView lxjldelete(ModelAndView mav,
			Long lxid){
		System.out.println("删除用户！"+lxid);
		this.salekhlxjkService.lxjldelete(lxid);
		mav.setViewName("redirect:lxjlcx.do");//重定向到list方法
		return mav;
	}
	
	@RequestMapping("/lxjlDeleteSelect.do")
	public ModelAndView lxjlDeleteSelect(ModelAndView mav,
									HttpServletRequest req,
									HttpServletResponse resp){
		
		String[] idsArr = req.getParameterValues("lxid");
		for (String gysIdStr : idsArr) {
			long lxid = Long.parseLong(gysIdStr);
			System.out.println("-------------->"+lxid);
			salekhlxjkService.lxjldelete(lxid);
		}
		
		mav.setViewName("redirect:lxjlcx.do");
		return mav;
	}
	//客户反馈
	@RequestMapping("/fkcx.do")
	public ModelAndView fkcx(ModelAndView mav,
			HttpSession se,
			Long id,
			String name){
		if(id==null){		
			id=(Long)se.getAttribute("id");
		}
		if(name==null){
			name=(String)se.getAttribute("name");
		}
		mav.addObject("q", salekhlxjkService.fkcx(id));
		se.setAttribute("id", id);
		se.setAttribute("name", name);
		mav.setViewName("wlq/khfk");
		
		return mav;
		
	}
	
	@RequestMapping("/fkadd.do")
	public ModelAndView lxjladd(ModelAndView mav,
			HttpServletRequest req,
			SaleKhfeedback f){
		f.setLastModified(new Date());
		this.salekhlxjkService.fkadd(f);
		mav.addObject("iscg", "yes");
		mav.setViewName("redirect:fkcx.do?iscg=yes");
		return mav;

   }
	
	@RequestMapping("/gofkadd.do")
	public ModelAndView gofkadd(ModelAndView mav,
			Long id){
		mav.addObject("id",id);
		mav.setViewName("wlq/fkadd");
		return mav;
		
	}
	
	@RequestMapping("/fkdelete.do")
	public ModelAndView fkdelete(ModelAndView mav,
			Long id){
		System.out.println("删除用户！"+id);
		this.salekhlxjkService.fkdelete(id);
		mav.setViewName("redirect:fkcx.do");//重定向到list方法
		return mav;
	}
	
	@RequestMapping("/fkupdate.do")
	public ModelAndView fkupdate(ModelAndView mav,
			HttpServletRequest req,
			SaleKhfeedback f){
		f.setLastModified(new Date());
		this.salekhlxjkService.fkupdate(f);
		mav.setViewName("redirect:fkcx.do");//重定向到list方法
		return mav;		
	}
	
	
}
