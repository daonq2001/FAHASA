package dev.daonq.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dev.daonq.entity.Order;

public class OrderDal{

    public Boolean updateStt(int stt, int id){
        try {
            Connection con = DBHelper.getConnection();
            DBHelper.executeQuery("SET FOREIGN_KEY_CHECKS = 0");
            String sql = "UPDATE Orders SET Status = ? WHERE ID = ?;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, stt);
            preparedStatement.setInt(2, id);
            Boolean b = preparedStatement.execute();
            DBHelper.executeQuery("SET FOREIGN_KEY_CHECKS = 1;");
            DBHelper.closeConnection();
            return b;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    public Boolean insertOrder(int CustomerID) {
        try {
            Connection con = DBHelper.getConnection();
            DBHelper.executeQuery("SET FOREIGN_KEY_CHECKS = 0;");
            String sql = "INSERT INTO Orders(CustomerID) values (?);";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, CustomerID);
            Boolean b = preparedStatement.execute();
            DBHelper.executeQuery("SET FOREIGN_KEY_CHECKS = 1;");
            DBHelper.closeConnection();
            return b;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    
    public Order getOrderByCustomerID(int CustomerID) {
        try {
            String sql = "SELECT * FROM Orders WHERE CustomerID = " + CustomerID + " ORDER BY ID DESC LIMIT 1;";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            Order order = new Order();
            while (rs.next()) {
                order = getOrder(rs);
            }
            DBHelper.closeConnection();
            return order;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    
    public ArrayList<Order> getListOrderByCustomerID(int CustomerID) {
        try {
            String sql = "SELECT * FROM Orders WHERE CustomerID = " + CustomerID + ";";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            ArrayList<Order> listOrder = new ArrayList<>();
            while (rs.next()) {
                Order order = getOrder(rs);
                listOrder.add(order);
            }
            DBHelper.closeConnection();
            return listOrder;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    private Order getOrder(ResultSet rs) {
        try {
            Order order = new Order();
            order.setID(rs.getInt("ID"));
            order.setCustomerID(rs.getInt("CustomerID"));
            order.setDate(rs.getTimestamp("Date"));
            order.setStatus(rs.getInt("Status"));
            return order;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}