package dev.daonq.dal;

import java.sql.ResultSet;
import java.util.ArrayList;

import dev.daonq.entity.Book;

public class BookDal {

    public ArrayList<Integer> getListID() {
        try {
            ArrayList<Integer> listID = new ArrayList<>();
            String sql = "SELECT ID FROM Books;";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            while (rs.next()) {
                int ID = rs.getInt("ID");
                listID.add(ID);
            }
            return listID;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public Double getPriceByID(int ID) {
        try {
            Double price = 0.0;
            String sql = "SELECT Price FROM Books WHERE ID = " + ID + ";";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            while (rs.next()) {
                price = rs.getDouble("Price");
            }
            return price;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public ArrayList<Book> getListBook() {
        try {
            ArrayList<Book> books = new ArrayList<>();
            String sql = "SELECT ID, Title, Author, Price FROM Books";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            while (rs.next()) {
                Book book = getBook(rs);
                books.add(book);
            }
            return books;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

    }

    public Book getBookByID(int ID) {
        try {
            String sql = "SELECT * FROM Books WHERE ID = " + ID + ";";
            DBHelper.getConnection();
            ResultSet rs = DBHelper.executeQuery(sql);
            Book book = new Book();
            while (rs.next()) {
                book.setID(rs.getInt("ID"));
                book.setTitle(rs.getString("Title"));
                book.setPrice(rs.getDouble("Price"));
                book.setAuthor(rs.getString("Author"));
                book.setIssuingCompany(rs.getString("IssuingCompany"));
                book.setDateofPublication(rs.getString("DateofPublication"));
                book.setDimensions(rs.getString("Dimensions"));
                book.setCoverType(rs.getString("CoverType"));
                book.setNumberofPages(rs.getInt("NumberofPages"));
                book.setPublishingCompany(rs.getString("PublishingCompany"));
                book.setSKU(rs.getString("SKU"));
                book.setDescription(rs.getString("Description"));
            }
            DBHelper.closeConnection();
            return book;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

    }

    private Book getBook(ResultSet rs) {
        try {
            Book book = new Book();
            book.setID(rs.getInt("ID"));
            book.setTitle(rs.getString("Title"));
            book.setPrice(rs.getDouble("Price"));
            book.setAuthor(rs.getString("Author"));
            return book;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}