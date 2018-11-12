package yycg.base.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import yycg.base.dao.mapper.SysuserMapper;
import yycg.base.dao.mapper.SysuserMapperCustom;
import yycg.base.dao.mapper.UsergysMapper;
import yycg.base.dao.mapper.UserjdMapper;
import yycg.base.dao.mapper.UseryyMapper;
import yycg.base.pojo.po.Sysuser;
import yycg.base.pojo.po.SysuserExample;
import yycg.base.pojo.po.SysuserExample.Criteria;
import yycg.base.pojo.po.Usergys;
import yycg.base.pojo.po.UsergysExample;
import yycg.base.pojo.po.Userjd;
import yycg.base.pojo.po.UserjdExample;
import yycg.base.pojo.po.Useryy;
import yycg.base.pojo.po.UseryyExample;
import yycg.base.pojo.vo.ActiveUser;
import yycg.base.pojo.vo.SysuserCustom;
import yycg.base.pojo.vo.SysuserQueryVo;
import yycg.base.process.context.Config;
import yycg.base.process.result.ExceptionResultInfo;
import yycg.base.process.result.ResultInfo;
import yycg.base.process.result.ResultUtil;
import yycg.base.service.UserService;
import yycg.util.MD5;
import yycg.util.UUIDBuild;

public class UserServiceImpl implements UserService{

	//注入 mapper
	@Autowired
	private SysuserMapper sysuserMapper;
	@Autowired
	private UserjdMapper userjdMapper;
 	@Autowired
	private UseryyMapper useryyMapper;
	@Autowired
	private UsergysMapper usergysMapper;
	
	@Autowired
	private SysuserMapperCustom sysuserMapperCustom;
	
	/*@Override
	public Sysuser findSysuserById(String id) throws Exception {
		//调用mapper查询用户信息
		return sysuserMapper.selectByPrimaryKey(id);

	}*/
	/** 分页查询用户 */
	@Override
	public List<SysuserCustom> findSysuserList(SysuserQueryVo sysuserQueryVo) throws Exception {
		return sysuserMapperCustom.findSysuserList(sysuserQueryVo);
	}

	/**查询总数*/
	@Override
	public int findSysuserCount(SysuserQueryVo sysuserQueryVo) throws Exception {
		return sysuserMapperCustom.findSysuserCount(sysuserQueryVo);
	}
	
	/**查询用户是否存在*/
	public Sysuser findSysuserByuserid(String userId) throws Exception {
		SysuserExample example = new SysuserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userId);
		List<Sysuser> list = sysuserMapper.selectByExample(example);
		if(list != null && list.size()==1) {
			return list.get(0);
		}
		return null;
	}
	
	/**查询JD单位是否存在*/
	public Userjd findUserjdByMC(String mc) throws Exception {
		UserjdExample example = new UserjdExample();
		UserjdExample.Criteria criteria = example.createCriteria();
		criteria.andMcEqualTo(mc);
		List<Userjd> list =userjdMapper.selectByExample(example);
		if(list != null && list.size()==1) {
			return list.get(0);
		}
		return null;
	}
	/**查询yy单位是否存在*/
	public Useryy findUseryyByMC(String mc) throws Exception {
		UseryyExample example = new UseryyExample();
		UseryyExample.Criteria criteria = example.createCriteria();
		criteria.andMcEqualTo(mc);
		List<Useryy> list =useryyMapper.selectByExample(example);
		if(list != null && list.size()==1) {
			return list.get(0);
		}
		return null;
	}
	/**查询gys单位是否存在*/
	public Usergys findUsergysByMC(String mc) throws Exception {
		UsergysExample example = new UsergysExample();
		UsergysExample.Criteria criteria = example.createCriteria();
		criteria.andMcEqualTo(mc);
		List<Usergys> list =usergysMapper.selectByExample(example);
		if(list != null && list.size()==1) {
			return list.get(0);
		}
		return null;
	}
	
	/**添加用户*/
	@Override
	public void insertSysuser(SysuserCustom sysuserCustom) throws Exception {
		//1. 判断用户是否存在
		Sysuser sysuser = findSysuserByuserid(sysuserCustom.getUserid());
		
		String sysid= null;
		if(sysuser==null) {
			ResultInfo resultInfo = new ResultInfo();
			boolean flag =false;//判断是否有异常
			//2.判断单位是否存在，如果存在相应的对象为null
			if("1".equals(sysuserCustom.getGroupid())||"2".equals(sysuserCustom.getGroupid())) {
				Userjd userjd = findUserjdByMC(sysuserCustom.getSysmc());
				if(userjd==null) {
					flag=true;
				}else {
					sysid=userjd.getId();
				}
			}else if("3".equals(sysuserCustom.getGroupid())) {
				Useryy useryy = findUseryyByMC(sysuserCustom.getSysmc());
				if(useryy==null) {
					flag=true;
				}else {
					sysid = useryy.getId();
				}
			}else if("4".equals(sysuserCustom.getGroupid())) {
				Usergys usergys = findUsergysByMC(sysuserCustom.getSysmc());
				if(usergys==null) {
					flag=true;
				}else {
					sysid = usergys.getId();
				}
			}
			//如果有异常抛出
			if(flag) {
				/*resultInfo.setMessage("单位不存在");
				resultInfo.setType(resultInfo.TYPE_RESULT_FAIL);
				throw new ExceptionResultInfo(resultInfo);*/
				throw new ExceptionResultInfo(ResultUtil.createFail(Config.MESSAGE, 213, null));
			}
			
		}else {
			/*ResultInfo resultInfo = new ResultInfo();*/
			/*resultInfo.setMessage("账号已存在");
			resultInfo.setType(resultInfo.TYPE_RESULT_FAIL);*/
			//ResultUtil.throwExcepion(ResultUtil.createFail("resources.messages", 101, null));
			throw new ExceptionResultInfo(ResultUtil.createFail(Config.MESSAGE, 213, null));
		}
		//设置主键
		sysuserCustom.setId(UUIDBuild.getUUID());
		//设置单位id
		sysuserCustom.setSysid(sysid);
		//密码加密
		sysuserCustom.setPwd(new MD5().getMD5ofStr(sysuserCustom.getPwd()));
		//新建用户
		sysuserMapper.insert(sysuserCustom);
		
	}
	
	/**删除用户*/
	@Override
	public void delectSysuser(String id) throws Exception {
		//如果修改用户名，则判断一下是否存在
		//1.先查询此用户
		System.out.println("服务层"+id);
		Sysuser user= findSysuserById(id);
		System.out.println(user);
		if(user==null) {
		  //没有此用户
			throw new ExceptionResultInfo(ResultUtil.createFail(Config.MESSAGE, 212, null));
		}
		//执行删除
		sysuserMapper.deleteByPrimaryKey(id);
	}
	/**修改用户*/
	@Override
	public void updateSysuser(String id, SysuserCustom sysuserCustom) throws Exception {
		//非空校验。。。
		//修改用户账号不允许暂用别人的账号
		//如果判断账号修改了
		//页面提交的账号可能是用户修改的账号
		String userid_page = sysuserCustom.getUserid();
		//数据库中的账号是用户原始账号
				//通过id查询数据库
		Sysuser sysuser = sysuserMapper.selectByPrimaryKey(id);
		if(sysuser == null){
			//抛出异常
			//找不到要修改用户信息
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 213, null));
		}
		//用户原始账号(数据库中的)
		String userId = sysuser.getUserid();
		
		if(!userid_page.equals(userId)){
			//通过页面提交的账号查询数据库，如果查到说明暂用别人的账号
			Sysuser sysuser_1 = this.findSysuserByuserid(userid_page);
			if(sysuser_1!=null){
				//说明暂用别人的账号
				ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 213, null));
			}
		}
		
		//根据页面提交的单位名称查询单位id
				String groupid = sysuserCustom.getGroupid();//用户类型
				String sysmc = sysuserCustom.getSysmc();//页面输入的单位名称
				String sysid = null;//单位id
				if(groupid.equals("1") || groupid.equals("2")){
					//监督单位
					//根据单位名称查询单位信息findUserjdByMC
					Userjd userjd = this.findUserjdByMC(sysmc);
					if(userjd==null){
						//抛出异常，可预知异常
						ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
					}
					sysid = userjd.getId();
				}else if(groupid.equals("3")){
					//卫生室
					//根据单位名称查询单位信息
					Useryy useryy = this.findUseryyByMC(sysmc);
					if(useryy==null){
						//抛出异常，可预知异常
						ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
					}
					sysid = useryy.getId();
				}else if(groupid.equals("4")){
					//供货商
					//根据单位名称查询单位信息
					Usergys usergys = this.findUsergysByMC(sysmc);
					if(usergys==null){
						//抛出异常，可预知异常
						ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
					}
					sysid = usergys.getId();
				}
		
				//密码修改
				//如果从页面提交的密码值为空说明用户不修改密码，否则 就需要对密码进行加密存储
				String pwd_page = sysuserCustom.getPwd().trim();
				String pwd_md5 = null;
				if(pwd_page!=null && !pwd_page.equals("")){
					//说明用户修改密码了
					pwd_md5 = new MD5().getMD5ofStr(pwd_page);
				}
				
				
				//设置更新用户信息
				//调用mapper更新用户
				//使用updateByPrimaryKey更新，要先查询用户
				
				Sysuser sysuser_update = sysuserMapper.selectByPrimaryKey(id);

				sysuser_update.setUserid(sysuserCustom.getUserid());
				sysuser_update.setUsername(sysuserCustom.getUsername());
				sysuser_update.setUserstate(sysuserCustom.getUserstate());
				if(pwd_md5!=null){
					sysuser_update.setPwd(pwd_md5);
				}
				sysuser_update.setGroupid(sysuserCustom.getGroupid());
				sysuser_update.setSysid(sysid);//单位id
				sysuserMapper.updateByPrimaryKey(sysuser_update);
				
	}
	
	@Override
	public SysuserCustom findSysuserById(String id) throws Exception {
		
		//从数据库查询用户
		Sysuser sysuser  =sysuserMapper.selectByPrimaryKey(id);
		
		//根据sysid查询单位名称
		String groupid = sysuser.getGroupid();
		String sysid = sysuser.getSysid();//单位id
		//查询根据groupid到相应的表中查询单位名称
		String sysmc =this.checkCompanyBySysid(sysid, groupid);
		
		SysuserCustom sysuserCustom = new SysuserCustom();
		
		//将sysuser中数据设置到sysuserCustom
		BeanUtils.copyProperties(sysuser, sysuserCustom);
		
		sysuserCustom.setSysmc(sysmc);//单位名称
		
		return sysuserCustom;
	}
	
	/**用户登录查询*/
	@Override
	public ActiveUser checkUser(String userId, String pwd) throws Exception {
		//检验用户是否存在
		Sysuser sysuser = this.findSysuserByuserid(userId);
		//不存在
		if(sysuser == null) {
			throw new ExceptionResultInfo(ResultUtil.createFail(Config.MESSAGE, 101, null));
		}
		//获取验证密码，页面的密码需要加密在比较
		String pwd_db = sysuser.getPwd();//md5密文
		String pwd_page=new MD5().getMD5ofStr(pwd);
		if(!pwd_db.equalsIgnoreCase(pwd_page)) {
			//用户密码错误
			throw new ExceptionResultInfo(ResultUtil.createFail(Config.MESSAGE, 114, null));
		}
		//构建用户信息
		ActiveUser activeUser = new ActiveUser();
		activeUser.setUserid(userId);
		activeUser.setUsername(sysuser.getUsername());
		activeUser.setGroupid(sysuser.getGroupid());
		activeUser.setSysid(sysuser.getSysid());// 单位id（重要）
		
		String sysmc =this.checkCompanyBySysid(activeUser.getSysid(), activeUser.getGroupid());
		activeUser.setSysmc(sysmc);
		
		return activeUser;
	}
	
	/**单位名称查询*/
	public String checkCompanyBySysid(String sysid,String groupid) throws Exception{
		String sysmc  =null;
		if(groupid.equals("1") || groupid.equals("2")){
			//监督单位
			//根据单位id查询单位信息
			Userjd userjd = userjdMapper.selectByPrimaryKey(sysid);
			if(userjd==null){
				//抛出异常，可预知异常
				ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
			}
			sysmc = userjd.getMc();
		}else if(groupid.equals("3")){
			//卫生室
			//根据单位id查询单位信息
			Useryy useryy = useryyMapper.selectByPrimaryKey(sysid);
			if(useryy==null){
				//抛出异常，可预知异常
				ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
			}
			sysmc = useryy.getMc();
		}else if(groupid.equals("4")){
			//供货商
			//根据单位id查询单位信息
			Usergys usergys = usergysMapper.selectByPrimaryKey(sysid);
			if(usergys==null){
				//抛出异常，可预知异常
				ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 217, null));
			}
			sysmc = usergys.getMc();
		}
		return sysmc;
	}
	
}
