package com.test.jsp.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public MemberDAO() {
		this.conn = DBUtil.getConnection();
		System.out.println("MemberDAO Connected");
	}
	
	public MemberDTO login(MemberDTO dto) {
		try {
			
			String sql = "select  " + 
					"    m.*,  " + 
					"    (select count(*) from tblCode where id=m.id) as cnt " + 
					" from tblMember m " +
					" where id=? and pw=?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getPw());
			
			rs = stat.executeQuery();
			
			if(rs.next()) {
				//반환된 레코드가 있다면 로그인 성공
				dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setLv(rs.getString("lv"));
				dto.setCnt(rs.getString("cnt"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.login :" + e.toString());
		}
		return null;
	}
}
