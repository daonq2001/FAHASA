package dev.daonq.bl;

import dev.daonq.dal.CustomerDal;
import dev.daonq.entity.Customer;

public class CustomerBl {
    CustomerDal dal = new CustomerDal();
    
    public Customer getPassword(String Email){
        return dal.getPassword(Email);
    }
}