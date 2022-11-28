package kr.co.hta.criteria;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Alias("CourseCriteria")
public class CourseCriteria {

	private String categoryId;		// 카테고리
	private List<String> tags;		// 태그
	private List<String> pays;		// 가격
	private List<String> grades;	// 등급
	private String sort;			// 정렬방식
}
