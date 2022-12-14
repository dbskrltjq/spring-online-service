package kr.co.hta.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.hta.argumentResolver.LoginUserArgumentResolver;
import kr.co.hta.interceptor.LoginCheckInterceptor;

/**
 * <p>WebMvcConfig 클래스는 spring-mvc 관련 설정을 정의하는 클래스다.
 * <p>사용자정의 WebMvcConfig 클래스는 WebMvcConfigurer 인터페이스를 구현한다.
 * <p>WebMvcConfigurer 인터페이스는 아래의 메소드를 포함하고 있다.
 * 		<p>void addInterceptors(InterceptorRegistry registry)
 * 			<p>사용자정의 인터셉터를 등록시키는 메소드다.
 * 		<p>void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers)
 * 			<p>사용자정의 argumentResolver를 등록시키는 메소드다.
 * 
 * @author youna
 *
 */

/*	@Configuration
 * 		- 스프링 컨테이너의 빈으로 등록시키는 어노테이션이다.
 * 		- 이 어노테이션이 정의된 클래스는 자동으로 스캔되어 스프링의 빈으로 등록된다.
 * 		- 이 클래스 안에서 @Bean 어노테이션이 지정된 메소드가 반환하는 객체도 스프링 컨테이너의 빈으로 등록된다.
 * 		예시)
 * 		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
 */
@Configuration	
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor())
				.addPathPatterns("/**")								// 모든 요청에 대해서 인터셉터가 실행된다.
				.excludePathPatterns("/resources/**", "/*.ico");   	// 단, 정적컨텐츠를 요청하는 경우 인터셉터 실행은 제외된다(url요청이 /resources/로 시작하는 요청이 오면 Interceptor가 실행되지 않았으면! )
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		// 내가 생성사용자정의 LoginUserArgumentResolver객체를 등록시킨다.
		resolvers.add(new LoginUserArgumentResolver());
	}
}
