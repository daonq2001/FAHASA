package dev.daonq.dal;

import java.sql.ResultSet;

import dev.daonq.entity.Customer;

public class CustomerDal {

    public Customer getPassword(String Email) {
        try {
            String sql = "SELECT * FROM Customers WHERE Email = '" + Email + "';";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            Customer customer = null;
            while (rs.next()) {
                customer = getCustomer(rs);
            }
            DBHelper.closeConnection();
            return customer;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    private Customer getCustomer(ResultSet rs) {
        try {
            Customer c = new Customer();
            c.setAddress(rs.getString("Email"));
            c.setAddress(rs.getString("Address"));
            c.setID(rs.getInt("ID"));
            c.setName(rs.getString("Name"));
            c.setPassword(rs.getString("Password"));
            c.setPhone(rs.getString("Phone"));
            return c;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}