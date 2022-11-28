package kr.co.hta.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Alias("CourseCategory")
public class CourseCategory {

	private int courseNo;
	private Category category;
	
	public CourseCategory(int courseNo, String categoryId) {
		this.courseNo = courseNo;
		this.category = new Category(categoryId);
	}
}
