package kr.co.hta.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("Category")
@NoArgsConstructor
@AllArgsConstructor
public class Category {

	private String id;
	private String name;
	
	public Category(String id) {
		this.id = id;
	}
}
