package com.sc.service;

import java.util.List;

import com.sc.entity.SaleKhfeedback;
import com.sc.entity.SaleKhrecord;

public interface SalekhlxjkService {
	//联系记录
	
	public List<SaleKhrecord>  lxjlcx(Long cid);
	
	public void lxjlupdate(SaleKhrecord r);
	
	public void lxjladd(SaleKhrecord r);
	
	public void lxjldelete(Long lxid);
	
	//客户反馈
	public List<SaleKhfeedback>  fkcx(Long id);
	
	public void fkadd(SaleKhfeedback f);
	
	public void fkdelete(Long id);
	
	public void fkupdate(SaleKhfeedback f);

}
