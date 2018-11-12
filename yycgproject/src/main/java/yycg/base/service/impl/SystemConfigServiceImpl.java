package yycg.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import yycg.base.dao.mapper.DictinfoMapper;
import yycg.base.pojo.po.Basicinfo;
import yycg.base.pojo.po.Dictinfo;
import yycg.base.pojo.po.DictinfoExample;
import yycg.base.pojo.po.DictinfoExample.Criteria;
import yycg.base.service.SystemConfigService;

public class SystemConfigServiceImpl implements SystemConfigService {
	
	@Autowired
	private DictinfoMapper dictinfoMapper;
	
	/**根据数据字典typecode获取字典明细信息*/
	@Override
	public List<Dictinfo> findDictinfoByType(String typecode) throws Exception {
		
		DictinfoExample example = new DictinfoExample();
		Criteria criteria = example.createCriteria();
		 criteria.andTypecodeEqualTo(typecode);
		List<Dictinfo> list =dictinfoMapper.selectByExample(example);
		
		return list;
	}
	
	/**根据typeocde和dictcode获取单个字典明细*/
	@Override
	public Dictinfo findDictinfoByDictcode(String typecode, String dictcode) throws Exception {
		
		return null;
	}
	/**根据id获取系统配置信息*/
	@Override
	public Basicinfo findBasicinfoById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
