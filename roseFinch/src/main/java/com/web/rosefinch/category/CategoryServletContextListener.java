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
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		AutowireCapableBeanFactory factory = context.getAutowireCapableBeanFactory();
		BeanDefinitionRegistry registry = (BeanDefinitionRegistry) factory;
		
		// DB에 접근해서 헤더 카테고리메뉴에 사용할 카테고리 데이터를 조회해 옴
		SqlSession sqlSession = (SqlSession) context.getBean("sqlSession");
		List<CategoryVO> categoryDepth0 = sqlSession.selectList("getSubCategories", new FilterVO(null, 0, null, null));
		Map<String, List<CategoryVO>> categoryDepth1 = new HashMap();
		for(int i=0; i<categoryDepth0.size(); i++) {
			int catCode = categoryDepth0.get(i).getCatCode();
			categoryDepth1.put(String.valueOf(categoryDepth0.get(i).getCatCode()), sqlSession.selectList("getSubCategories", new FilterVO(null, catCode, null, null)));
		}
		
		// 카테고리 데이터를 빈에 담아 관리
		BeanDefinition def = new RootBeanDefinition(CategoryListVO.class);
		MutablePropertyValues properties = def.getPropertyValues();
		properties.addPropertyValue("categoryDepth0", categoryDepth0);
		properties.addPropertyValue("categoryDepth1", categoryDepth1);
		
		registry.registerBeanDefinition("categoryListVO", def);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	
	}

}
