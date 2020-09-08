package dev.daonq.bl;

import java.util.ArrayList;

import dev.daonq.dal.OrderDal;
import dev.daonq.entity.Order;

public class OrderBl {
    OrderDal dal = new OrderDal();

    public ArrayList<Order> getListOrderByCustomerID(int CustomerID) {
        return  dal.getListOrderByCustomerID(CustomerID);
    }

    public Boolean insertOrder(int CustomerID) {
        return dal.insertOrder(CustomerID);
    }

    public Order getOrderByCustomerID(int CustomerID) {
        return dal.getOrderByCustomerID(CustomerID);
    }

    public Boolean updateStatus(int stt, int id){
        return dal.updateStt(stt, id);
    }
}