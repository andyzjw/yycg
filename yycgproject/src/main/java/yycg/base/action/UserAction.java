package yycg.base.action;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import yycg.base.pojo.po.Dictinfo;
import yycg.base.pojo.vo.SysuserCustom;
import yycg.base.pojo.vo.SysuserQueryVo;
import yycg.base.process.context.Config;
import yycg.base.process.exception.ExceptionResolverCustom;
import yycg.base.process.result.DataGridResultInfo;
import yycg.base.process.result.ExceptionResultInfo;
import yycg.base.process.result.ResultInfo;
import yycg.base.process.result.ResultUtil;
import yycg.base.process.result.SubmitResultInfo;
import yycg.base.service.SystemConfigService;
import yycg.base.service.UserService;
import yycg.util.PageAssistant;

@Controller
@RequestMapping("/user")
public class UserAction {
	@Resource
	private UserService userService;
	 @Resource
	private SystemConfigService systemConfigService; 
	
		/**用户查询页面*/
		@RequestMapping("/queryuser")
		public String queryuser(Model model)throws Exception{
			//将页面所需要的数据取出，传到页面
			List<Dictinfo> list  = systemConfigService.findDictinfoByType("s01");
			model.addAttribute("groupList", list);
			
			return "/base/user/queryuser";
		}
		/**用户添加页面*/
		@RequestMapping("/insertsysuser")
		public String insertsysuser() {
			
			return "/base/user/addUser";
		}
		
		/**删除用户*/
		@RequestMapping("deletesysuser")
		public @ResponseBody SubmitResultInfo deleteSysuser(String id) throws Exception{
			System.out.println("action层"+id);
			userService.delectSysuser(id);
			
			//return new SubmitResultInfo(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
			return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
		}
		
		/**添加用户*/
		@RequestMapping("submitsysuser")
 		public @ResponseBody SubmitResultInfo addsysuersubmit(SysuserQueryVo sysuserQueryVo)throws Exception{
			
			/*String message="操作成功！";
			int type=0;//代表成功
*/			
			/*ResultInfo resultInfo=new ResultInfo();
			resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			resultInfo.setMessage("操作成功！");*/
			
			/*try {*/
			//添加用户
				userService.insertSysuser(sysuserQueryVo.getSysuserCustom());
			/*} catch (Exception e) {
				e.printStackTrace();*/
				/*message= e.getMessage();
				type=1;//代表失败了
*/				
			/*	
				if(e instanceof ExceptionResultInfo) {
					//抛出的是系统自定义异常
					resultInfo = ((ExceptionResultInfo) e).getResultInfo();
				}else {
					//重新构造“未知错误”异常
					resultInfo = new ResultInfo();
					resultInfo.setType(resultInfo.TYPE_RESULT_FAIL);
					resultInfo.setMessage("未知错误！");
				}
				
			}*/
		/*	Map<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("message", message);*/
				
		/*	SubmitResultInfo  submitResultInfo = new SubmitResultInfo(resultInfo);
			return submitResultInfo;*/
			return new SubmitResultInfo(ResultUtil.createSuccess(Config.MESSAGE, 906, null));//也可以使用ResultUtil里的方法创建
		} 
		
		/**查询*/
		//用户查询页面的结果集
		//最终DataGridResultInfo通过@ResponseBody将java对象转成json
		@RequestMapping("/queryuser_result")
		public @ResponseBody DataGridResultInfo queryuser_result(SysuserQueryVo sysuserQueryVo,//查询条件存放
				int page,//当前页码
				int rows//行数（每页显示多少）
				)throws Exception {
			System.out.println("页码"+page);
			System.out.println("行数"+rows);
			
		//非空校验
		sysuserQueryVo = sysuserQueryVo != null?sysuserQueryVo:new SysuserQueryVo();
			
		//分页助手设置
		PageAssistant<SysuserCustom> pa = new PageAssistant<>();
		System.out.println("总共有"+userService.findSysuserCount(sysuserQueryVo));
		pa.setCount(userService.findSysuserCount(sysuserQueryVo));
		pa.setCurrPage(page);
		pa.setPageSize(rows);
		
		sysuserQueryVo.setPa(pa);
		
		List<SysuserCustom> list =userService.findSysuserList(sysuserQueryVo);
		for(SysuserCustom s :list) {
			System.out.println(s);
		}
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setTotal(pa.getCount());
		dataGridResultInfo.setRows(list);
		
		return dataGridResultInfo;
	}
	
		//修改用户页面
		@RequestMapping("/editsysuser")
		public String editsysuser(Model model,String id)throws Exception{
			
			//通过id取出用户信息，传向页面
			SysuserCustom sysuserCustom =  userService.findSysuserById(id);
			model.addAttribute("sysuserCustom", sysuserCustom);
			
			return "/base/user/edituser";
			
		}
		
		//修改用户提交
		@RequestMapping("/editsysusersubmit")
		public @ResponseBody SubmitResultInfo editsysusersubmit(String id,SysuserQueryVo sysuserQueryVo)throws Exception{
			
			userService.updateSysuser(id, sysuserQueryVo.getSysuserCustom());
			
			return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
			
		}
		
		
}
