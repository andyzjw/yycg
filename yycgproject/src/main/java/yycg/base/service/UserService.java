package yycg.base.service;

import java.util.List;

import yycg.base.pojo.po.Sysuser;
import yycg.base.pojo.po.Usergys;
import yycg.base.pojo.po.Userjd;
import yycg.base.pojo.po.Useryy;
import yycg.base.pojo.vo.ActiveUser;
import yycg.base.pojo.vo.SysuserCustom;
import yycg.base.pojo.vo.SysuserQueryVo;

public interface UserService {

	/**用户登录验证*/
	public ActiveUser checkUser(String userid,String pwd) throws Exception;
	/**单位名称查询*/
	public String checkCompanyBySysid(String sysid,String groupid) throws Exception;
	
	/** 分页查询 */
	List<SysuserCustom> findSysuserList(SysuserQueryVo sysuserQueryVo) throws Exception;

	/** 查询总数 */
	int findSysuserCount(SysuserQueryVo sysuserQueryVo) throws Exception;

	/** 添加用户 */
	public void insertSysuser(SysuserCustom sysuserCustom) throws Exception;

	/** 查询用户是否存在 */
	public Sysuser findSysuserByuserid(String userId) throws Exception;

	/** 查询JD单位是否存在 */
	public Userjd findUserjdByMC(String mc) throws Exception;

	/** 查询yy单位是否存在 */
	public Useryy findUseryyByMC(String mc) throws Exception;

	/** 查询gys单位是否存在 */
	public Usergys findUsergysByMC(String mc) throws Exception;

	/** 删除用户 */
	public void delectSysuser(String id) throws Exception;

	/** 修改用户 */
	/**
	 * 
	 * <p>
	 * Title: updateSysuser
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param id
	 *            修改用户的id
	 * @param sysuserCustom
	 *            修改用户信息，表单提交的数据
	 * @throws Exception
	 */
	public void updateSysuser(String id, SysuserCustom sysuserCustom) throws Exception;
	public SysuserCustom findSysuserById(String id) throws Exception;
	
}
