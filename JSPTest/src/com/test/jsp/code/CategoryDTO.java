package com.test.jsp.code;

public class CategoryDTO {
	private String seq;
	private String name;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CategoryDTO [seq=" + seq + ", name=" + name + "]";
	}
}
