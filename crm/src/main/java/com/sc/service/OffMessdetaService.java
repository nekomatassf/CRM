package com.sc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import com.sc.entity.OffMessdeta;

public interface OffMessdetaService {
	
			//���
			public void add(OffMessdeta md);
			
			//�޸�
		    public void update(OffMessdeta md);
		    
		    //
		    public OffMessdeta getbyid(Long did);
		    
		    //ɾ��
		    public void delete(Long did);
		    
		    //��ȡ
		    public OffMessdeta get(Long did);
		    
		    //��ѯ��
		    public List<OffMessdeta> select();
		    
		
		//��ѯ�б�-��ҳ
		 public PageInfo<OffMessdeta> selectpage(Integer pageNum,Integer pageSize);
		 
		//��ѯ�б�-��ҳ
		 public PageInfo<OffMessdeta> selectdeta(Integer pageNum,Integer pageSize,Long sid);
		 
		 
		//������
		 public PageInfo<OffMessdeta> selectlajxiang(Integer pageNum,Integer pageSize,Long sid);
		 
		 //ģ����ѯ�ռ���
		 public PageInfo<OffMessdeta> sousuod(Integer pageNum,Integer pageSize,Long reid,String starch);
		 
		 
}
