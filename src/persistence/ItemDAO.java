package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.ItemVO;
import domain.PageVO;

public class ItemDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;

	private Connection getConnection() {
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
			return ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int[] getPrice(int bid, int hid, int sid) {
		con = getConnection();
		int[] price = new int[3];
		int cnt = 0;

		String sql = "SELECT itemPrice FROM shopTBL "
				+ "WHERE itemId = ? or itemId = ? or ItemId = ? "
				+ "ORDER BY itemTypeId ASC";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, hid);
			pstmt.setInt(3, sid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				price[cnt++] = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return price;
	}

	public PageVO getPage() {

		con = getConnection();
		PageVO vo = new PageVO();

		String sql = "SELECT count(*) FROM shopTBL";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int total = rs.getInt(1) / 6 + 1;
				int end = total < 10 ? total : 10;
				vo.setTotalPage(total);
				vo.setCurPage(1);
				vo.setStartPage(1);
				vo.setEndPage(end);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return vo;
	}

	public ArrayList<ItemVO> itemSelectPage(int page, int limit) {
		con = getConnection();
		ArrayList<ItemVO> list = new ArrayList<>();

		String sql = "SELECT itemId, itemTypeId, itemTypeName," + "itemName, itemDetail, itemPrice, itemImgPath "
				+ "FROM shopTBL order by itemId asc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * 6);
			pstmt.setInt(2, 6);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ItemVO vo = new ItemVO();

				vo.setItemId(rs.getInt(1));
				vo.setItemTypeId(rs.getInt(2));
				vo.setItemTypeName(rs.getString(3));
				vo.setItemName(rs.getString(4));
				vo.setItemDetail(rs.getString(5));
				vo.setItemPrice(rs.getInt(6));
				vo.setItemImgPath(rs.getString(7));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	public ArrayList<ItemVO> itemAll() {
		con = getConnection();
		ArrayList<ItemVO> list = new ArrayList<>();

		String sql = "SELECT * FROM shopTBL";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ItemVO vo = new ItemVO();

				vo.setItemId(rs.getInt(1));
				vo.setItemTypeId(rs.getInt(2));
				vo.setItemTypeName(rs.getString(3));
				vo.setItemName(rs.getString(4));
				vo.setItemDetail(rs.getString(5));
				vo.setItemPrice(rs.getInt(6));
				vo.setItemImgPath(rs.getString(7));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	public ItemVO selectItem(int itemId) {
		con = getConnection();
		ItemVO vo = new ItemVO();

		String sql = "SELECT * FROM shopTBL WHERE itemId = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setItemId(rs.getInt(1));
				vo.setItemTypeId(rs.getInt(2));
				vo.setItemTypeName(rs.getString(3));
				vo.setItemName(rs.getString(4));
				vo.setItemDetail(rs.getString(5));
				vo.setItemPrice(rs.getInt(6));
				vo.setItemImgPath(rs.getString(7));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return vo;
	}
}
