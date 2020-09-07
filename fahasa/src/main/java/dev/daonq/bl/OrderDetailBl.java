package dev.daonq.bl;

import java.util.ArrayList;

import dev.daonq.dal.OrderDetailDal;
import dev.daonq.entity.OrderDetail;

public class OrderDetailBl {
    OrderDetailDal dal = new OrderDetailDal();

    public ArrayList<OrderDetail> getListOrderDetailByOrderID(int OrderID) {
        return dal.getListOrderDetailByOrderID(OrderID);
    }

    public Boolean insertOrderDetail(OrderDetail orderDetail) {
        return dal.insertOrderDetail(orderDetail);
    }
}