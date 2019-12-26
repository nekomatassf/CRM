package com.sc.service;


import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sc.entity.SaleKhcontacts;
import com.sc.entity.SaleKhinfo;
import com.sc.entity.SaleKhloss;


public interface SaleService{
	
    //��ϵ��
	public List<SaleKhcontacts>  lxcx(Long id);
	
	//�޸���ϵ��
	public void lxupdate(SaleKhcontacts c);
	
	public void lxadd(SaleKhcontacts c);
	
	public void lxdelete(Long cid);
	
	public PageInfo<SaleKhcontacts> lxselect(Integer pageNum,Integer pageSize);
    //�ͻ���Ϣ
	public PageInfo<SaleKhinfo> select(Integer pageNum,Integer pageSize,SaleKhinfo s);
	//�ͻ���Ϣ�޸�
	public void update(SaleKhinfo s);
	//�ͻ���Ϣ���
	public void add(SaleKhinfo s);
	
	public void delete(Long id);
	
	public PageInfo<SaleKhinfo> lossselect1(Integer pageNum,Integer pageSize,SaleKhinfo s);
	
}