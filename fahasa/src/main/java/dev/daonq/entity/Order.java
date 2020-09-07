package dev.daonq.entity;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int customerId;
    private Timestamp date;
    private int status;

    public int getStatus(){
        return status;
    }

    public void setStatus(int status){
        this.status = status;
    }

    public int getID() {
        return this.id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getCustomerID() {
        return this.customerId;
    }

    public void setCustomerID(int customerId) {
        this.customerId = customerId;
    }

    public Timestamp getDate() {
        return this.date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}