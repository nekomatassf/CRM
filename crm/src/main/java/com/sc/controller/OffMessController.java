package com.sc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMess;
import com.sc.entity.OffMessdeta;
import com.sc.entity.SysUsers;
import com.sc.service.OffMessService;
import com.sc.service.OffMessdetaService;
import com.sc.service.SysUsersService;

@Controller
@RequestMapping("/offmessctrl")
public class OffMessController {
	
	@Autowired
	OffMessService offMessService;
	@Autowired
	SysUsersService sysUsersService;
	@Autowired
	OffMessdetaService offMessdetaService;
	@Autowired
	HttpSession httpSession;
	
	
	
	
	//����
	@RequestMapping("/sousuo.do")
	public ModelAndView sousuo(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize,
			HttpServletRequest req){
		String starch = req.getParameter("search");
		System.out.println("��������������"+starch);
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		PageInfo<OffMess> dd = offMessService.sousuo(pageNum, pageSize,user.getUsersName(), starch);
		
		for (OffMess x : dd.getList()) {
			System.out.println("��"+x+"\n");
			System.out.println("jian"+x.getMessid());
			System.out.println("��"+offMessService.selectdeta1(x.getMessid())+"\n");
			x.setOffMessdeta(offMessService.sousuod(x.getMessid()));	
		}
		//��ѯlist���Ϸ�ҳ
		mav.addObject("p", dd);
		mav.setViewName("OFF/mailbox");// ·��/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	/*//�ظ��ʼ�
	@RequestMapping("/reply.do")
	public ModelAndView reply(ModelAndView mav,String sender){
		System.out.println("�����ظ�ҳ�棡"+sender);
		mav.addObject("sender", sender);
		mav.setViewName("OFF/reply");
		return mav;
	}*/
	
	//�鿴��Ϣ����
		@RequestMapping("/details.do")
		public ModelAndView details(ModelAndView mav,Long mid){
			System.out.println("�鿴��Ϣ����"+mid);
			List<OffMess> list = offMessService.mdetail(mid);
			for (OffMess m : list) {
				System.out.println(m.getOffMessdeta());
			}
			
			mav.addObject("list", list);
			mav.setViewName("OFF/m_detail");
			return mav;
		}
	
	
	
	@RequestMapping("/listpage.do")
	public ModelAndView listpage(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("�������Ϣ����������");
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		
		
		PageInfo<OffMess> dd = offMessService.selectdeta(pageNum, pageSize,user.getUsersName());
		
		List<Long> reid=new ArrayList();
		
		for (OffMess x : dd.getList()) {
			/*System.out.println("��"+x+"\n");
			System.out.println("jian"+x.getMessid());
			System.out.println("��"+offMessService.selectdeta1(x.getMessid())+"\n");*/
			x.setOffMessdeta(offMessService.selectdeta1(x.getMessid()));
			
			
			
		}
		
		mav.addObject("p", dd);
		
		mav.setViewName("OFF/mailbox");// ·��/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	
	
	@RequestMapping("/goadd.do")
	public ModelAndView goadd(ModelAndView mav){
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		List<SysUsers> users=this.sysUsersService.selectAllNOSelf(user.getUsersId());
		mav.addObject("users", users);
		
		 for (SysUsers u : users) {
					System.out.println(u);
			}
		mav.setViewName("OFF/mail_compose");
		return mav;
	}
	
	
	@RequestMapping("/add.do")
	public ModelAndView add(ModelAndView mav,MultipartFile upload,HttpServletRequest req,
			OffMess m,Long [] sid) throws IllegalStateException, IOException{
		System.out.println("��ʼ���Ͷ���Ϣ"+m);
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		m.setLasttime(new Date());
		m.setSender(user.getUsersName());
		m.setCompanyid(user.getCompanyId());
		this.offMessService.write(m);
		for (Long id : sid) {
			System.out.println(id+" �����߱��");
			OffMessdeta deta = new OffMessdeta();
			deta.setMessid(m.getMessid());
			deta.setReceiverid(id);
			deta.setMessstate("δ�鿴");
	        deta.setLasttime(new Date());
	        offMessdetaService.add(deta);
		}
		mav.setViewName("redirect:listpage.do");//�ض���listpage����
		return mav;
	}
	
	
	
	
	

}
