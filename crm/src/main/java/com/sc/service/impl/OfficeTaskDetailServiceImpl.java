package com.sc.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.OfficeTaskDetail;
import com.sc.service.OfficeTaskDetailService;
import com.sc.mapper.OfficeTaskAssessmentMapper;
import com.sc.mapper.OfficeTaskDetailMapper;
@Service
public class OfficeTaskDetailServiceImpl implements OfficeTaskDetailService {
     @Autowired 
   OfficeTaskDetailMapper OfficeTaskDetailMapper;
     @Autowired 
     OfficeTaskAssessmentMapper officeTaskAssessmentMapper;
     
	@Override
	public void add(OfficeTaskDetail d) {
		if(d!=null){
			this.OfficeTaskDetailMapper.insert(d);
		}
	}

	@Override
	public void update(OfficeTaskDetail d) {
		if(d!=null&&d.getTaskId()!=null){
			this.OfficeTaskDetailMapper.updateByPrimaryKey(d);
		}
	}

	@Override
	public void delete(OfficeTaskDetail d) {
		if(d!=null&&d.getTaskDetailId()!=null){
			this.OfficeTaskDetailMapper.deleteByPrimaryKey(d.getTaskDetailId());
		}

	}

	@Override
	public OfficeTaskDetail get(BigDecimal did) {
		if(did!=null){
			return this.OfficeTaskDetailMapper.selectByPrimaryKey(did);
		}
		return null;
	}
	public OfficeTaskDetail get1(BigDecimal taskid) {
		if(taskid!=null){
			return this.OfficeTaskDetailMapper.selectByTaskId(taskid);
		}
		return null;
	}

	@Override
	public List<OfficeTaskDetail> select() {
		
		return this.OfficeTaskDetailMapper.selectByExample(null);
	}

	@Override
	public PageInfo<OfficeTaskDetail> selectpage(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<OfficeTaskDetail> list = this.OfficeTaskDetailMapper.selectByExample(null);
		for (OfficeTaskDetail officeTaskDetail : list) {
			BigDecimal taskId=officeTaskDetail.getTaskId();
			officeTaskDetail.setTask(officeTaskAssessmentMapper.selectByPrimaryKey(taskId));
		}
		PageInfo<OfficeTaskDetail> page=new PageInfo<OfficeTaskDetail>(list);
		return page;
	}

}
