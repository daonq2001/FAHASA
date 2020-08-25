package dev.daonq.bl;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.daonq.dal.BookDal;
import dev.daonq.entity.Book;

public class BookBl {
    BookDal dal = new BookDal();

    public ArrayList<Book> getListBook() throws SQLException {
        return dal.getListBook();
    }

    public Book getBookByID(int ID) throws SQLException {
        return dal.getBookByID(ID);
    }

    public ArrayList<Integer> getListID() throws SQLException {
        return dal.getListID();
    }

    public Double getPriceByID(int ID) throws SQLException {
        return dal.getPriceByID(ID);
    }
}