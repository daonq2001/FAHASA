package dev.daonq.bl;

import java.util.ArrayList;

import dev.daonq.dal.OrderDal;
import dev.daonq.entity.Order;

public class OrderBl {
    OrderDal dal = new OrderDal();

    public ArrayList<Order> getListOrderByCustomerID(int CustomerID) {
        try {
            ArrayList<Order> listOrders = dal.getListOrderByCustomerID(CustomerID);
            if (listOrders != null) {
                return listOrders;
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    public Boolean insertOrder(int CustomerID, Double thanhtien) {
        return dal.insertOrder(CustomerID, thanhtien);
    }
    public Order getOrderByCustomerID(int CustomerID) {
        return dal.getOrderByCustomerID(CustomerID);
    }
}