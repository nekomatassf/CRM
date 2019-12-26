package com.sc.service;


import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sc.entity.SaleKhcontacts;
import com.sc.entity.SaleKhinfo;
import com.sc.entity.SaleKhloss;


public interface SaleService{
	
    //联系人
	public List<SaleKhcontacts>  lxcx(Long id);
	
	//修改联系人
	public void lxupdate(SaleKhcontacts c);
	
	public void lxadd(SaleKhcontacts c);
	
	public void lxdelete(Long cid);
	
	public PageInfo<SaleKhcontacts> lxselect(Integer pageNum,Integer pageSize);
    //客户信息
	public PageInfo<SaleKhinfo> select(Integer pageNum,Integer pageSize,SaleKhinfo s);
	//客户信息修改
	public void update(SaleKhinfo s);
	//客户信息添加
	public void add(SaleKhinfo s);
	
	public void delete(Long id);
	
	public PageInfo<SaleKhinfo> lossselect1(Integer pageNum,Integer pageSize,SaleKhinfo s);
	
}