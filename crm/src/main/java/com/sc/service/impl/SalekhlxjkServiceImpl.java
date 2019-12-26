package com.sc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.entity.SaleKhfeedback;
import com.sc.entity.SaleKhfeedbackExample;
import com.sc.entity.SaleKhrecord;
import com.sc.entity.SaleKhrecordExample;
import com.sc.entity.SaleKhrecordExample.Criteria;
import com.sc.mapper.SaleKhfeedbackMapper;
import com.sc.mapper.SaleKhrecordMapper;
import com.sc.service.SalekhlxjkService;
@Service
public class SalekhlxjkServiceImpl implements SalekhlxjkService {
    @Autowired
    SaleKhrecordMapper saleKhrecordMapper;
	
	@Override
	public List<SaleKhrecord> lxjlcx(Long cid) {
		SaleKhrecordExample example = new SaleKhrecordExample();
		Criteria c = example.createCriteria();
		
		if(cid!=null){
			   c.andUserIdEqualTo(cid);
			   return this.saleKhrecordMapper.selectByExample(example);
			}
			return null;		
	}

	@Override
	public void lxjlupdate(SaleKhrecord r) {
		if(r!=null&&r.getContactRecordId()!=null){
			this.saleKhrecordMapper.updateByPrimaryKey(r);
		}
	}

	@Override
	public void lxjladd(SaleKhrecord r) {
		if(r!=null){
			this.saleKhrecordMapper.insert(r);
		}
	}
	
	@Override
	public void lxjldelete(Long lxid) {
		if(lxid!=null){
			this.saleKhrecordMapper.deleteByPrimaryKey(lxid);
		}
	}
	
	 //¿Í»§·´À¡
	@Autowired
	SaleKhfeedbackMapper saleKhfeedbackMapper;
	
	@Override
	public List<SaleKhfeedback> fkcx(Long id) {
		SaleKhfeedbackExample example = new SaleKhfeedbackExample();
		com.sc.entity.SaleKhfeedbackExample.Criteria c = example.createCriteria();
		
		if(id!=null){
			   c.andUserIdEqualTo(id);
			   return this.saleKhfeedbackMapper.selectByExample(example);
			}
			return null;		
	}

	@Override
	public void fkadd(SaleKhfeedback f) {
		if(f!=null){
			this.saleKhfeedbackMapper.insert(f);
			
		}
	}

	@Override
	public void fkdelete(Long id) {
		if(id!=null){
			this.saleKhfeedbackMapper.deleteByPrimaryKey(id);
		}
		
	}

	@Override
	public void fkupdate(SaleKhfeedback f) {
		if(f!=null){
			this.saleKhfeedbackMapper.updateByPrimaryKey(f);
		}
	}



}
