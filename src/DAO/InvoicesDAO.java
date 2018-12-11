/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Invoices;
import DTO.Tables;
import GiaoDien.QuanLyBan;
import Utilities.DBUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author TRI
 */
public class InvoicesDAO {

    private static InvoicesDAO instance;

    public InvoicesDAO() {
    }

    public static InvoicesDAO getInstance() {
        if (instance == null) {
            instance = new InvoicesDAO();
        }
        return instance;
    }

    public int GetUncheckInvoiceByTableId(int id) {
        Connection con = DBUtility.openConnection();
        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `invoice` WHERE `tables_id` = ? AND `status` = 0");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
//                Invoices invoices = new Invoices(rs.getInt(1), rs.getInt(2), rs.getTimestamp(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Boolean Insert(int id, int accountId) {
        Connection con = DBUtility.openConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("INSERT INTO `invoice`(`account_ID`, `tables_id`, `status`) VALUES ('" + accountId + "','" + id + "',0)");
            if (i > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuanLyBan.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int GetMaxIdInvoice() {
        Connection con = DBUtility.openConnection();
        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT MAX(ID) FROM `invoice`");
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 1;
    }

    public void Update(int id, int totalPrice) {
        Connection con = DBUtility.openConnection();
        try {
            PreparedStatement pstmt = con.prepareStatement("UPDATE `invoice` SET `status`= 1, `total_price` = ? WHERE `ID` = ?");
            pstmt.setInt(1, totalPrice);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
//                int i = pstmt.executeUpdate();
//                if (i > 0) {
//                }
        } catch (SQLException ex) {
            Logger.getLogger(InvoicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
