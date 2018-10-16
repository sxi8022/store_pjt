package com.web.rosefinch.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.rosefinch.category.vo.CategoryListVO;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.vo.FilterVO;

@WebListener
public class CategoryServletContextListener implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// DB 연결이라면 초기화 코딩, 객체 컨텍스트 담기
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		AutowireCapableBeanFactory factory = context.getAutowireCapableBeanFactory();
		BeanDefinitionRegistry registry = (BeanDefinitionRegistry) factory;
		
		SqlSession sqlSession = (SqlSession) context.getBean("sqlSession");
		FilterVO filterVO = new FilterVO(null, 1, null, null);
		List<CategoryVO> categoryDepth0 = sqlSession.selectList("getSubCategories", filterVO);
		Map<String, List<CategoryVO>> categoryDepth1 = new HashMap();
		for(int i=0; i<categoryDepth0.size(); i++) {
			int catCode = categoryDepth0.get(i).getCatCode();
			filterVO = new FilterVO(null, catCode, null, null);		
			categoryDepth1.put(String.valueOf(categoryDepth0.get(i).getCatCode()), sqlSession.selectList("getSubCategories", filterVO));
		}
		
		CategoryListVO categoryList = new CategoryListVO(categoryDepth0, categoryDepth1);
		BeanDefinition def = new RootBeanDefinition(CategoryListVO.class);
		MutablePropertyValues properties = def.getPropertyValues();
		properties.addPropertyValue("categoryDepth0", categoryDepth0);
		properties.addPropertyValue("categoryDepth1", categoryDepth1);
		
		registry.registerBeanDefinition("categoryListVO", def);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// DB 연결이라면 해제 코딩, 객체라면 할 일 없음.
		// 컨텍스트가 소멸된다는 것은, 모든 어플리케이션이 소멸되고 DB연결도 자동으로 끊겨야 함
	}

}
