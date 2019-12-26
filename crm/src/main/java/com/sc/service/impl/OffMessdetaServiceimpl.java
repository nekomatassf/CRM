package com.sc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMessdeta;
import com.sc.mapper.OffMessdetaMapper;
import com.sc.mapper.SysUsersMapper;
import com.sc.service.OffMessdetaService;

@Service
public class OffMessdetaServiceimpl implements OffMessdetaService {
	
	@Autowired
	OffMessdetaMapper  offMessdetaMapper;
	@Autowired
	SysUsersMapper  sysUsersMapper;

	@Override
	public void add(OffMessdeta md) {
		offMessdetaMapper.insert(md);

	}

	@Override
	public void update(OffMessdeta md) {
		this.offMessdetaMapper.updateByPrimaryKey(md);

	}

	
	@Override
	public OffMessdeta get(Long did) {
		
		OffMessdeta dmess = this.offMessdetaMapper.details(did);
		System.out.println(dmess);
		System.out.println(dmess.getOffMess());
		
		
		return dmess;
	}

	@Override
	public List<OffMessdeta> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<OffMessdeta> selectpage(Integer pageNum, Integer pageSize) {
		//���÷�ҳ���ݣ���ʼ��ҳ
		PageHelper.startPage(pageNum, pageSize);
		//��ѯ��ǰҳ�ļ�������
		List<OffMessdeta> list = this.offMessdetaMapper.selectByExample(null);
		//��װ��pageinfo����
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
	}

	@Override
	public PageInfo<OffMessdeta> selectdeta(Integer pageNum, Integer pageSize, Long sid) {
		//���÷�ҳ���ݣ���ʼ��ҳ
				PageHelper.startPage(pageNum, pageSize);
				//��ѯ��ǰҳ�ļ�������
				List<OffMessdeta> list = this.offMessdetaMapper.detamess(sid);
				
				for (OffMessdeta md : list) {
					System.out.println("��������"+md);
					System.out.println("����Ϣ"+md.getOffMess());
					System.out.println();
				}
				
				//��װ��pageinfo����
				PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
				
				return page;
	}

	@Override
	public OffMessdeta getbyid(Long did) {
		OffMessdeta d =new OffMessdeta();
		d=this.offMessdetaMapper.selectByPrimaryKey(did);
		
		return this.offMessdetaMapper.selectByPrimaryKey(did);
		
	}

	@Override
	public void delete(Long did) {
		 this.offMessdetaMapper.deleteByPrimaryKey(did);
		
	}

	//ģ����ѯ�ռ���
	@Override
	public PageInfo<OffMessdeta> sousuod(Integer pageNum, Integer pageSize, Long reid, String starch) {
		System.out.println("������id"+reid+"�ؼ���"+starch);
		List<OffMessdeta> list= this.offMessdetaMapper.sousuod(reid, starch);
		
		//��װ��pageinfo����
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
		 
	}

	//�������б�
	@Override
	public PageInfo<OffMessdeta> selectlajxiang(Integer pageNum, Integer pageSize, Long sid) {
		//���÷�ҳ���ݣ���ʼ��ҳ
		PageHelper.startPage(pageNum, pageSize);
		//��ѯ��ǰҳ�ļ�������
		List<OffMessdeta> list = this.offMessdetaMapper.lajixiang(sid);
		
		//��װ��pageinfo����
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
	}

	

	

}
