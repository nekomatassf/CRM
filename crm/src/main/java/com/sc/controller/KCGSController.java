package com.sc.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sc.entity.JhCgd;
import com.sc.entity.JhCgdxq;
import com.sc.entity.KcCangku;
import com.sc.entity.KcGoods;
import com.sc.entity.SaleSinfo;
import com.sc.entity.SaleSoutOrder;
import com.sc.service.JhCgdService;
import com.sc.service.JhCgdxqService;
import com.sc.service.KcGoodsService;

@Controller
@RequestMapping("/KCGSControllerCtrl")//类的路径
public class KCGSController {//KCGS--库存商品
	
	@Autowired
	KcGoodsService kcGoodsService;

	@Autowired
	JhCgdxqService jhCgdxqService;	
	@Autowired
	JhCgdService  jhCgdService;
	//分页查询--所有
	@RequestMapping("/listPage.do")
	public ModelAndView listPage(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize,KcGoods kcgs){
		
		mav.addObject("p", kcGoodsService.select(pageNum, pageSize,kcgs));
		//跳转到库存商品信息表页面
		mav.setViewName("yjs/selectKCGSPage");
		
		System.out.println("分页--KCGS");
		
		return mav;
	}
	
	//入库
	//入库--
		@RequestMapping("/cgdxqRk.do")
		public ModelAndView rukulistPage(ModelAndView mav,
				@RequestParam(defaultValue="1")Integer pageNum,
				@RequestParam(defaultValue="5")Integer pageSize,
				Long cgdId,KcGoods kcgs,BigDecimal cgXqId){//入库界面
			System.out.println("入库的fffffffffffff采购单id："+cgdId);
			System.out.println("入库的fffffffffffff采购单详情id："+cgXqId);
			
			//开始修改当前采购单详情对象的入库状态
			JhCgdxq cgdxq = this.jhCgdxqService.get(cgXqId);
			System.out.println("cgdxq:"+cgdxq);
			cgdxq.setIsRk("已入库");//入库状态：已入库or未入库
			jhCgdxqService.update(cgdxq);//更新对象，通过对象把入库状态更新			
			//结束修改当前采购单详情对象的入库状态
							
			//开始修改-通过产品编号获取对应库存的数量
			KcGoods kc = kcGoodsService.getGsID(cgdxq.getCpId().longValue());
			System.out.println("kc:"+kc);
			if(kc!=null){
				String kcslstr = kc.getKcNum();//得到库存数量-字符串
				System.out.println("kcslstr:"+kcslstr);
				int kcsl=Integer.parseInt(kcslstr);
				//得到需要入库的产品数量
				Long ruksl= cgdxq.getCpNumber();
				System.out.println("库存数量"+kcsl);
				System.out.println("入库数量"+ ruksl);
				System.out.println("相加值"+(kcsl+ruksl));					
				String sum=String.valueOf(kcsl+ruksl);
				kc.setKcNum(sum);
				kcGoodsService.update(kc);
			}
			//结束修改-通过产品编号获取对应库存的数量
			
			//如果当前采购单下所有的采购单详情都已入库，那么当前采购单状态改为已完成-start
			List<JhCgdxq> list = this.jhCgdxqService.getListByCgdid(cgdId);
			if(list!=null&&list.size()>0){
				System.out.println("编号为"+cgdId+"的采购单有如下详情：");
				int sum=list.size();
				int count=0;
				for (JhCgdxq jhCgdxq : list) {
					if(jhCgdxq.getIsRk()!=null&&jhCgdxq.getIsRk().equals("已入库")){
						count++;
					}
				}
				System.out.println("详情单共"+sum+"个，已入库的有"+count+"个");
				if(sum==count){//如果相等，说明所有详情都已入库，那么就要修改采购单的状态为已完成
					JhCgd jhCgd = jhCgdService.get(cgdId);
					jhCgd.setCgJz("已完成");						
					jhCgdService.update(jhCgd);
				}
			}
			//如果当前采购单下所有的采购单详情都已入库，那么当前采购单状态改为已完成-end
					
			mav.addObject("p", kcGoodsService.select(pageNum, pageSize,kcgs));
			mav.setViewName("yjs/selectKCGSPage");
			return mav;
	    }
			

	    //去添加
		 @RequestMapping("/add.do")//去页面转一圈
		 public ModelAndView addofficeKpi(ModelAndView mav){
			 mav.setViewName("yjs/addKCGSPage");
			 return mav;
		 }
		//真正添加的
		 @RequestMapping("/addKCGS.do")
		 public ModelAndView addKCGS(ModelAndView mav,KcGoods kcgs){
			 kcgs.setLastModifyTime(new Date());
			 System.out.println("添加库存商品信息"+kcgs);
			this.kcGoodsService.add(kcgs);
			 mav.setViewName("redirect:listPage.do");
			 return mav;
			 }
		 
		 //删除
		@RequestMapping("/delete.do")
		public ModelAndView delete(ModelAndView mav, Long kcgs){
			System.out.println("删除库存商品信息！"+kcgs);
			this.kcGoodsService.delete(kcgs);
			mav.setViewName("redirect:listPage.do");//重定向到list方法
			return mav;
		}
		
		//选中删除
				@RequestMapping("/kcgsDeleteSelect.do")
				public ModelAndView kcgsDeleteSelect(ModelAndView mav,
												HttpServletRequest req,
												HttpServletResponse resp){
					
					String[] idsArr = req.getParameterValues("gid");
					System.out.println("------进入删除选中1:>"+idsArr.length);
					for (String gidStr : idsArr) {
						System.out.println("--------进入删除选中2：>"+gidStr);
						Long gid = Long.parseLong(gidStr);
						
						System.out.println("--------进入删除选中3：>"+gid);
						kcGoodsService.delete(gid);
					}
					
					mav.setViewName("redirect:listPage.do");
					return mav;
				}
				
		//修改
		 @RequestMapping("/goupdate.do")
		 public ModelAndView goupdate(ModelAndView mav,Long gid ){
				System.out.println("进入了goupdate");
				mav.addObject("kcgs", kcGoodsService.getGsID(gid));
				mav.setViewName("yjs/updateKCGSPage");
				return mav;
			}
		 @RequestMapping("/update.do")
		 public ModelAndView OfficeKpiupdate(ModelAndView mav,KcGoods kcgs){
			/* kcck.setCangkuLastModifyTime(new Date());*/
			 kcgs.setLastModifyTime(new Date());
			 System.out.println("修改KCGS信息"+kcgs);
			this.kcGoodsService.update(kcgs);
			 mav.setViewName("redirect:listPage.do");
			 return mav;
		 }
		
		
	
}
