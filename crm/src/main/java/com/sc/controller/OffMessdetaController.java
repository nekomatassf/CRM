package com.sc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMessdeta;
import com.sc.entity.SysUsers;
import com.sc.service.OffMessdetaService;

@Controller
@RequestMapping("/offmessdetactrl")
public class OffMessdetaController {
	
	@Autowired
	OffMessdetaService offMessdetaService;
	@Autowired
	HttpSession httpSession;
	
	
		//垃圾箱恢复
		@RequestMapping("/huifu.do")
		
		public ModelAndView huifu(ModelAndView mav,Long did){
			System.out.println("垃圾箱恢复"+did);
			OffMessdeta vv = offMessdetaService.getbyid(did);
			System.out.println(vv);
			vv.setMessstate("已查看");
			offMessdetaService.update(vv);
			mav.setViewName("redirect:listlajixiang.do");//重定向到listpage方法
			 return mav;
		}
	
	
	
	//垃圾箱列表
	@RequestMapping("/listlajixiang.do")
	public ModelAndView listlajixiang(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("垃圾箱列表");
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		mav.addObject("p", offMessdetaService.selectlajxiang(pageNum, pageSize, user.getUsersId()));
		mav.setViewName("OFF/lajixiang");// 路径/WEB-INF/OFF/lajixiang.jsp
		return mav;
	}
	
	
	//个人日程
		@RequestMapping("/richeng.do")
		public ModelAndView aaa(ModelAndView mav){
			mav.setViewName("OFF/schedule");// 路径/WEB-INF/userslistpage.jsp
			return mav;
		}
	
	
	//模糊查询收件箱
	@RequestMapping("/sousuod.do")
	public ModelAndView sousuo(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize,
			HttpServletRequest req){
		String starch = req.getParameter("search");
		System.out.println("进入搜索方法！"+starch);
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		PageInfo<OffMessdeta> dd = offMessdetaService.sousuod(pageNum, pageSize, user.getUsersId(), starch);
		//查询list集合分页
		mav.addObject("p", dd);
		mav.setViewName("OFF/mailboxs");// 路径/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public OffMessdeta delete(ModelAndView mav,Long did){
		System.out.println("删除");
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		vv.setMessstate("垃圾箱");
		offMessdetaService.update(vv);
		//this.offMessdetaService.delete(did);
		//mav.setViewName("redirect:listpagedeta.do");//重定向到listpage方法
		//return mav;
		return new OffMessdeta();
     }
	
	
	//垃圾箱删除
	@RequestMapping("/cddel.do")
	@ResponseBody
	public OffMessdeta cddel(ModelAndView mav,Long did){
		System.out.println("垃圾箱删除");
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		this.offMessdetaService.delete(did);
		mav.setViewName("redirect:listlajixiang.do");//重定向到listpage方法
		return new OffMessdeta();
     }
	
	
	//查看消息详情
	@RequestMapping("/details.do")
	public ModelAndView details(ModelAndView mav,Long did){
		System.out.println("查看消息详情"+did);
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		vv.setMessstate("已查看");
		offMessdetaService.update(vv);
		OffMessdeta mdeta = this.offMessdetaService.get(did);
		mav.addObject("m", mdeta);
		mav.setViewName("OFF/mail_detail");
		return mav;
	}
	
	
	@RequestMapping("/listpage.do")
	public ModelAndView listpage(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("查看列表-分页");
		mav.addObject("p", offMessdetaService.selectpage(pageNum, pageSize));
		mav.setViewName("OFF/mailbox");// 路径/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	@RequestMapping("/goadd.do")
	public ModelAndView goadd(ModelAndView mav){
		mav.setViewName("OFF/mail_compose");
		return mav;
	}
	
	@RequestMapping("/add.do")
	public ModelAndView add(ModelAndView mav,MultipartFile upload,HttpServletRequest req,
			OffMessdeta md) throws IllegalStateException, IOException{
		System.out.println("开始发送短消息"+md);
		this.offMessdetaService.add(md);
		mav.setViewName("redirect:listpage.do");//重定向到listpage方法
		return mav;
	}
	
	//收件箱列表
	@RequestMapping("/listpagedeta.do")
	public ModelAndView listpagedeta(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("垃圾箱列表");
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		mav.addObject("p", offMessdetaService.selectdeta(pageNum, pageSize, user.getUsersId()));
		mav.setViewName("OFF/mailboxs");// 路径/WEB-INF/OFF/mailbox.jsp
		return mav;
	}
	
	

}
