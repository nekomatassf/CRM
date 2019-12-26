package com.sc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.entity.OOfficePerSche;
import com.sc.entity.SysUsers;
import com.sc.service.HR_PerAgendaService;

@Controller
@Scope("prototype")
@RequestMapping("schedule")
public class HR_ScheduleCtrl {
   
	@Resource
	private HR_PerAgendaService hR_PerAgendaServiceImp;
	@Autowired
	HttpSession httpSession;
	
	
	
	// 涓汉鏃ョ▼鍒楄〃锛堝垎椤垫煡璇級
	@RequestMapping("/list.do") //璇锋眰璺緞鏄痵chedule/list.action
	@ResponseBody
	public List list(OOfficePerSche sche,HttpSession session){
		System.out.println("start:"+sche.getStart()+"-----end:"+sche.getEnd());
		
		
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---start
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		sche.setUid(user.getUsersName());
		sche.setCid(user.getCompanyId().toString());
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---end
		
		System.out.println("=====瀵硅薄淇℃伅list====="+sche);
		List list = hR_PerAgendaServiceImp.getAllSchedule(sche);
		System.out.println(list);
		return list;
	}
	
	
	@RequestMapping("/addsche.do")
	@ResponseBody
	public String addsche(@RequestBody OOfficePerSche sche,HttpSession session){
		System.out.println("=====瀵硅薄淇℃伅add====="+sche);
		System.out.println("=====瀵硅薄淇℃伅session====="+session);
		
		
		
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---start
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		sche.setUid(user.getUsersId().toString());
		sche.setCid(user.getCompanyId().toString());
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---end
		
		sche.setAllDay("0");
		sche.setTopic("dasd");//涓婚鏆傛椂涓�'dasd'
		sche.setLasttime(new Date().toLocaleString());
		
		hR_PerAgendaServiceImp.addSchedule(sche);
		System.out.println("---Id:"+sche.getId());
		
		return sche.getId();
	}
	
	
	@RequestMapping("/updatesche.do")
	@ResponseBody
	public void updatesche(@RequestBody OOfficePerSche sche,HttpSession session){
		System.out.println("=====瀵硅薄淇℃伅update====="+sche);
		
		
		
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---start
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		sche.setUid(user.getUsersId().toString());
		sche.setCid(user.getCompanyId().toString());
		//---闇�瑕佽幏鍙栫敤鎴穒d鍜屽叕鍙竔d---end
		
		sche.setAllDay("0");
		sche.setTopic("dasd");//涓婚鏆傛椂涓�'dasd'
		sche.setLasttime(new Date().toLocaleString());
		
		hR_PerAgendaServiceImp.updateSchedule(sche);
		
	}
	
	@RequestMapping("/deletesche.do")
	@ResponseBody
	public void deletesche(@RequestBody OOfficePerSche sche){
		System.out.println("=====瀵硅薄淇℃伅delete====="+sche);
		hR_PerAgendaServiceImp.delSchedule(sche);
	}
	
	
}
