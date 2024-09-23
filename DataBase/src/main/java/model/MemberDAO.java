package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {

	// 오라클에 접속하는 소스를 작성
	String id = "System";
	String pass = "123456";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Connection con; // 데이터베이스에 접근할 수 있도록 설정
	PreparedStatement pstmt; // 데이터 베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체

	// 데이터 베이스에 접근할 수 있도록 도와주는 메소드
	public void getCon() {
		try {
			// 1. 해당 데이터 베이스를 사용한다고 선언(클래스를 등록=오라클용을 사용)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 해당 데이터 베이스에 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 데이터 베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean) {
		try {
			getCon();
			// 3. 접속 후 쿼리 준비
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			// 쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(sql);
			// ? 에 맞게 데이터 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			// 4. 오라클에서 쿼리를 실행하시오
			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<MemberBean> allSelectMember() {

		Vector<MemberBean> v = new Vector<>();

		// 무조건 데이터 베이스는 예외 처리를 해야 됨
		try {
			// 커넥션 연결
			getCon();
			// 쿼리 준비
			String sql = "select * from member";
			// 쿼리를 실행시켜주는 객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리를 실행 시킨 결과를 리턴해서 받아줌(오라클 테이블의 검색된 결과를 자바 객체에 저장)
			rs = pstmt.executeQuery();
			// 반복문을 사용해서 rs에 저장된 데이터를 추출해야됨
			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return v;
	}

	// 한사람에 대한 정보를 리턴하는 메소드 작성
	public MemberBean oneSelectMember(String id) {
		MemberBean bean = new MemberBean();

		try {
			getCon();
			String sql = "select * from member where id = ?";

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return bean;

	}

	public String getPass(String id) {
		String pass = "";

		try {
			getCon();
			String sql = "select pass1 from member where id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
			// 자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pass;
	}
	
	public void updateMember(MemberBean bean) {
		try {
			getCon();
			String sql = "update member set email=?, tel=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(MemberBean bean) {
		try {
			getCon();
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
