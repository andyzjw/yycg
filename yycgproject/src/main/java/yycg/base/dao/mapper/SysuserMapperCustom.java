package yycg.base.dao.mapper;

import java.util.List;

import yycg.base.pojo.vo.SysuserCustom;
import yycg.base.pojo.vo.SysuserQueryVo;

public interface SysuserMapperCustom {
	/**分页查询*/
	List<SysuserCustom> findSysuserList(SysuserQueryVo sysuserQueryVo) throws Exception;
	/**查询总数*/
	int findSysuserCount(SysuserQueryVo sysuserQueryVo) throws Exception;
	
}
