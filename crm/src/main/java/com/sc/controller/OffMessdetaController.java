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
	
	
		//������ָ�
		@RequestMapping("/huifu.do")
		
		public ModelAndView huifu(ModelAndView mav,Long did){
			System.out.println("������ָ�"+did);
			OffMessdeta vv = offMessdetaService.getbyid(did);
			System.out.println(vv);
			vv.setMessstate("�Ѳ鿴");
			offMessdetaService.update(vv);
			mav.setViewName("redirect:listlajixiang.do");//�ض���listpage����
			 return mav;
		}
	
	
	
	//�������б�
	@RequestMapping("/listlajixiang.do")
	public ModelAndView listlajixiang(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("�������б�");
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		mav.addObject("p", offMessdetaService.selectlajxiang(pageNum, pageSize, user.getUsersId()));
		mav.setViewName("OFF/lajixiang");// ·��/WEB-INF/OFF/lajixiang.jsp
		return mav;
	}
	
	
	//�����ճ�
		@RequestMapping("/richeng.do")
		public ModelAndView aaa(ModelAndView mav){
			mav.setViewName("OFF/schedule");// ·��/WEB-INF/userslistpage.jsp
			return mav;
		}
	
	
	//ģ����ѯ�ռ���
	@RequestMapping("/sousuod.do")
	public ModelAndView sousuo(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize,
			HttpServletRequest req){
		String starch = req.getParameter("search");
		System.out.println("��������������"+starch);
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		PageInfo<OffMessdeta> dd = offMessdetaService.sousuod(pageNum, pageSize, user.getUsersId(), starch);
		//��ѯlist���Ϸ�ҳ
		mav.addObject("p", dd);
		mav.setViewName("OFF/mailboxs");// ·��/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public OffMessdeta delete(ModelAndView mav,Long did){
		System.out.println("ɾ��");
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		vv.setMessstate("������");
		offMessdetaService.update(vv);
		//this.offMessdetaService.delete(did);
		//mav.setViewName("redirect:listpagedeta.do");//�ض���listpage����
		//return mav;
		return new OffMessdeta();
     }
	
	
	//������ɾ��
	@RequestMapping("/cddel.do")
	@ResponseBody
	public OffMessdeta cddel(ModelAndView mav,Long did){
		System.out.println("������ɾ��");
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		this.offMessdetaService.delete(did);
		mav.setViewName("redirect:listlajixiang.do");//�ض���listpage����
		return new OffMessdeta();
     }
	
	
	//�鿴��Ϣ����
	@RequestMapping("/details.do")
	public ModelAndView details(ModelAndView mav,Long did){
		System.out.println("�鿴��Ϣ����"+did);
		OffMessdeta vv = offMessdetaService.getbyid(did);
		System.out.println(vv);
		vv.setMessstate("�Ѳ鿴");
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
		System.out.println("�鿴�б�-��ҳ");
		mav.addObject("p", offMessdetaService.selectpage(pageNum, pageSize));
		mav.setViewName("OFF/mailbox");// ·��/WEB-INF/userslistpage.jsp
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
		System.out.println("��ʼ���Ͷ���Ϣ"+md);
		this.offMessdetaService.add(md);
		mav.setViewName("redirect:listpage.do");//�ض���listpage����
		return mav;
	}
	
	//�ռ����б�
	@RequestMapping("/listpagedeta.do")
	public ModelAndView listpagedeta(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize){
		System.out.println("�������б�");
		SysUsers user =(SysUsers)this.httpSession.getAttribute("nowuser");
		mav.addObject("p", offMessdetaService.selectdeta(pageNum, pageSize, user.getUsersId()));
		mav.setViewName("OFF/mailboxs");// ·��/WEB-INF/OFF/mailbox.jsp
		return mav;
	}
	
	

}
