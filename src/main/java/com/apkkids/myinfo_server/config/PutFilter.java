package com.apkkids.myinfo_server.config;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.HttpPutFormContentFilter;

/**
 * Created by wxb on 2018/11/16 0016.
 *
 * 解决SpringBoot的Controller不能接收PUT类型参数的问题，前端需要使用
 * form表单提交方式：Content-Type:application/x-www-form-urlencoded
    form表单数据格式：为：param1=111&param2=222 这种开式。

 后端：对象接收：除了：所有请求：都不加@ReqeustBody注解
 参数接收：可以使用：@RequestParam 或者不用。

 * 后端两种方法
 *
 * //使用@bean注解
 @Configuration
 @EnableWebMvc
 public class WebMvcConfig extends WebMvcConfigurerAdapter {
 // 就是这个
 @Bean
 public HttpPutFormContentFilter httpPutFormContentFilter() {
 return new HttpPutFormContentFilter();
 }

 }

 //或者使用：@Component，其实原理都是一样，就是开启：HttpPutFormContentFilter
 @Component
 public class PutFilter extends HttpPutFormContentFilter {
 }
 */

@Component
public class PutFilter extends HttpPutFormContentFilter {
}