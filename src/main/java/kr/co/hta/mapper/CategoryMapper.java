package kr.co.hta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hta.vo.Category;

@Mapper
public interface CategoryMapper {

	List<Category> getAllCategories();
	Category getCategoryById(String categoryId);
}
