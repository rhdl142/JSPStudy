package com.test.jsp.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CodeDAO {
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;

	public CodeDAO() {
		this.conn = DBUtil.getConnection();
		System.out.println("CodeDAO Connected");
	}

	public ArrayList<CategoryDTO> listCategory() {
		try {

			ArrayList<CategoryDTO> list = new ArrayList<>();

			String sql = "select * from tblCategory order by seq asc";

			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				CategoryDTO dto = new CategoryDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println("CodeDAO.listCategory :" + e.toString());
		}
		return null;
	}

	public int add(CodeDTO dto) {
		try {

			String sql = "insert into tblCode values(code_seq.nextval, ?,?,?,default,?,?)";

			stat = conn.prepareStatement(sql);

			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getCategory());
			stat.setString(4, dto.getId());
			stat.setString(5, dto.getFilename());

			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("CodeDAO.add :" + e.toString());
		}
		return 0;
	}

	public ArrayList<CodeDTO> list() {
		try {
			ArrayList<CodeDTO> list = new ArrayList<>();

			String sql = "select " + "seq, " + "subject, " + "(select name from tblMember where id=c.id) as name, "
					+ "to_char(regdate, 'yyyy-mm-dd') as regdate, "
					+ "(select name from tblCategory where seq = c.category) as categoryName " + "from tblCode c "
					+ "order by seq desc";

			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				CodeDTO dto = new CodeDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setCategoryName(rs.getString("categoryName"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}

			return list;
		} catch (Exception e) {
			System.out.println("CodeDAO.list :" + e.toString());
		}
		return null;
	}

	public CodeDTO get(String seq) {
		try {
			CodeDTO dto = new CodeDTO();

			String sql = "select " + "    c.*, " + "    (select name from tblMember where id=c.id) as name, "
					+ "    (select name from tblCategory where seq = c.category) as categoryName"
					+ " from tblCode c where seq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);

			rs = stat.executeQuery();

			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setCategoryName(rs.getString("categoryName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setFilename(rs.getString("filename"));

				return dto;
			}
		} catch (Exception e) {
			System.out.println("CodeDAO.get :" + e.toString());
		}
		return null;
	}

	public int edit(CodeDTO dto) {

		try {
			String file = ", filename = ?";

			if (dto.getFilename() != null) {
				file = ", filename = ?";
			}
			String sql = String.format("update tblCode set subject = ?, content = ?, category = ? %s where seq = ?",
					file);

			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getCategory());

			if (dto.getFilename() != null) {
				stat.setString(4, dto.getFilename());
				stat.setString(5, dto.getSeq());
			} else {
				stat.setString(4, dto.getSeq());
			}
			return stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}
	
	public int del(String seq) {

		try {

			String sql = "delete from tblCode where seq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);

			return stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
