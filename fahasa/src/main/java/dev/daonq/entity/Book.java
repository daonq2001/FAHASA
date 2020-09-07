package dev.daonq.entity;

public class Book {
    private int id;
    private int numberofPages;
    private Double price;
    private String title;
    private String author;
    private String issuingCompany;
    private String dateofPublication;
    private String dimensions;
    private String coverType;
    private String publishingCompany;
    private String sku;
    private String description;

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getID() {
        return this.id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getNumberofPages() {
        return this.numberofPages;
    }

    public void setNumberofPages(int numberofPages) {
        this.numberofPages = numberofPages;
    }

    public Double getPrice() {
        return this.price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIssuingCompany() {
        return this.issuingCompany;
    }

    public void setIssuingCompany(String issuingCompany) {
        this.issuingCompany = issuingCompany;
    }

    public String getDateofPublication() {
        return this.dateofPublication;
    }

    public void setDateofPublication(String dateofPublication) {
        this.dateofPublication = dateofPublication;
    }

    public String getDimensions() {
        return this.dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public String getCoverType() {
        return this.coverType;
    }

    public void setCoverType(String coverType) {
        this.coverType = coverType;
    }

    public String getPublishingCompany() {
        return this.publishingCompany;
    }

    public void setPublishingCompany(String publishingCompany) {
        this.publishingCompany = publishingCompany;
    }

    public String getSKU() {
        return this.sku;
    }

    public void setSKU(String sku) {
        this.sku = sku;
    }

}