package yycg.base.process.exception;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import yycg.base.process.result.ExceptionResultInfo;
import yycg.base.process.result.ResultInfo;

/**
 * 全局异常处理器
 * 
 * @author administrator
 *
 */
public class ExceptionResolverCustom implements HandlerExceptionResolver {

	/**json转换器*/
	// 将异常信息传唤成json
	private HttpMessageConverter<ExceptionResultInfo> jsonMessageConverter;

	/** 前端控制器调用此方法执行异常处理，handler执行的action类就包装了一个方法（对应url的方法） */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// 异常输出
		ex.printStackTrace();
		// 转换成springmvc底层对象（）
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		// 取出方法
		Method method = handlerMethod.getMethod();

		// 判断方法是否返回json
		// 只要方法上有responsebody注解表示返回json
		// 查询method是否有responsebody注解
		ResponseBody responseBody = AnnotationUtils.findAnnotation(method, ResponseBody.class);

		// 需要json数据
		if (responseBody != null) {
			// 将信息转换为json输出
			return this.resolveJsonException(request, response, handlerMethod, ex);
		}
		// string类型，即action返回的是jsp页面
		// 解析异常
		ExceptionResultInfo exceptionResultInfo = resolveException(ex);

		// 转向异常页面显示
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exceptionResultInfo", exceptionResultInfo.getResultInfo());
		modelAndView.setViewName("/base/error");// 此处为逻辑视图名
		return modelAndView;
	}

	/** 异常信息解析 */
	private ExceptionResultInfo resolveException(Exception ex) {
		if (ex instanceof ExceptionResultInfo) {
			return (ExceptionResultInfo) ex;
		}
		// 如果是系统或者其他异常
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setType(resultInfo.TYPE_RESULT_FAIL);
		resultInfo.setMessage("未知错误");
		return new ExceptionResultInfo(resultInfo);

	}

	/** 将异常信息转json输出 */
	private ModelAndView resolveJsonException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// 交给异常信息解析类进行解析
		ExceptionResultInfo exceptionResultInfo = resolveException(ex);
		HttpOutputMessage outputMessage = new ServletServerHttpResponse(response);
		try {
			jsonMessageConverter.write(exceptionResultInfo, MediaType.APPLICATION_JSON, outputMessage);
		} catch (HttpMessageNotWritableException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return new ModelAndView();
	}

	public HttpMessageConverter<ExceptionResultInfo> getJsonMessageConverter() {
		return jsonMessageConverter;
	}

	public void setJsonMessageConverter(HttpMessageConverter<ExceptionResultInfo> jsonMessageConverter) {
		this.jsonMessageConverter = jsonMessageConverter;
	}
}
