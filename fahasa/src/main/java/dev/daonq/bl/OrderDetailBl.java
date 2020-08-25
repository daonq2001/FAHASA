package dev.daonq.bl;

import java.util.ArrayList;

import dev.daonq.dal.OrderDetailDal;
import dev.daonq.entity.OrderDetail;

public class OrderDetailBl {
    OrderDetailDal dal = new OrderDetailDal();

    public ArrayList<OrderDetail> getListOrderDetailByOrderID(int OrderID) {
        try {
            ArrayList<OrderDetail> listOrderDetails = dal.getListOrderDetailByOrderID(OrderID);
            if (listOrderDetails != null) {
                return listOrderDetails;
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    public Boolean insertOrderDetail(OrderDetail orderDetail) {
        return dal.insertOrderDetail(orderDetail);
    }
}