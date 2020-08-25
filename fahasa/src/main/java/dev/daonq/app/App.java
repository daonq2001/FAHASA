package dev.daonq.app;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

import dev.daonq.bl.BookBl;
import dev.daonq.bl.CustomerBl;
import dev.daonq.bl.OrderBl;
import dev.daonq.bl.OrderDetailBl;
import dev.daonq.entity.Book;
import dev.daonq.entity.Customer;
import dev.daonq.entity.Order;
import dev.daonq.entity.OrderDetail;

public class App {
    private static ArrayList<OrderDetail> listOrderDetails = new ArrayList<>();
    private static Scanner sc = new Scanner(System.in);
    private static Boolean Login = false;
    private static Customer customer = new Customer();

    public static void main(String[] args) throws SQLException {
        Scanner sc = new Scanner(System.in);
        String luachon;
        do {
            System.out.printf("\n1. Danh sách Sách.");
            System.out.printf("\n2. Tìm kiếm Sách.");
            System.out.printf("\n3. Giỏ hàng của tôi.");
            System.out.printf("\n4. Đơn hàng của tôi");
            System.out.printf("\n0. Thoát.");
            System.out.printf("\nBạn chọn: ");
            luachon = sc.nextLine();
            switch (luachon) {
                case "1":
                    ArrayList<Book> books = new BookBl().getListBook();
                    ShowBooks(books);
                    break;
                case "2":
                    String luachon2;
                    do {
                        System.out.printf("\n  1. Tìm kiếm Sách theo tên Sách.");
                        System.out.printf("\n  2. Tìm kiếm Sách theo tên Tác Giả.");
                        System.out.printf("\n  0. Trở về menu chính.");
                        System.out.printf("\n  Bạn chọn: ");
                        luachon2 = sc.nextLine();
                        ArrayList<Book> searching;
                        switch (luachon2) {
                            case "1":
                                System.out.printf("\n:  Nhập tên cuốn sách mà bạn muốn tìm: ");
                                String tenSach = sc.nextLine();
                                searching = TimKiemSachTheoTenSach(tenSach);
                                System.out.printf("\n Đã tìm thấy %d kết quả với từ khóa \"%s\"", searching.size(),
                                        tenSach);
                                ShowBooks(searching);
                                break;
                            case "2":
                                System.out.printf("\n:  Nhập tên tác giả mà bạn muốn tìm: ");
                                String tacgia = sc.nextLine();
                                searching = TimKiemTheoTenTacGia(tacgia);
                                System.out.printf("\n Đã tìm thấy %d kết quả với từ khóa \"%s\"", searching.size(),
                                        tacgia);
                                ShowBooks(searching);
                                break;
                            case "0":

                                break;
                            default:
                                System.out.printf("\n  Không tìm thấy kết quả cho \"%s\"", luachon2);
                                break;
                        }

                    } while (!luachon2.equals("0"));
                    break;
                case "3":
                    if (listOrderDetails.size() > 0) {
                        String luachon3;
                        do {
                            XemChiTietGioHang();
                            luachon3 = sc.nextLine();
                            switch (luachon3) {
                                case "U":
                                    System.out.printf(
                                            "\nNhập ID của cuốn sách trong giỏ hàng mà bạn muốn chỉnh sửa số lượng: ");
                                    int ID = Integer.parseInt(sc.nextLine());
                                    if (checkID(ID)) {
                                        for (int i = 0; i < listOrderDetails.size(); i++) {
                                            if (ID == listOrderDetails.get(i).getBookID()) {
                                                System.out.printf("\nNhập số lượng mới: ");
                                                int soluongmoi = Integer.parseInt(sc.nextLine());
                                                if (soluongmoi == 0) {
                                                    listOrderDetails.remove(i);
                                                    System.out.printf("Xóa khỏi giỏ hành thành công!");
                                                    luachon3 = "0";
                                                } else if (soluongmoi > 0) {
                                                    listOrderDetails.get(i).setAmount(soluongmoi);
                                                    System.out.printf("Cập nhật số lượng thành công.");
                                                    luachon3 = "0";
                                                } else if (soluongmoi < 0) {
                                                    System.out.printf(
                                                            "Không thể thêm vào giỏ hàng vì số lượng nhỏ hơn 0.");
                                                }
                                                break;
                                            }
                                        }
                                    } else {
                                        System.out.printf("Không có kết quả phù hợp với ID bạn vừa nhập.");
                                    }
                                    break;
                                case "D":
                                    DatHang();
                                    luachon3 = "0";
                                    break;
                                case "0":

                                    break;
                                default:
                                    break;
                            }
                        } while (!luachon3.equals("0"));
                    } else {
                        System.out.printf("Giỏ hàng trống.");
                    }
                    break;
                case "4":
                if (Login) {
                    DonHangCuaToi();
                } else {
                    if (DangNhap()) {
                        DonHangCuaToi();
                    } else {
                        System.out.printf("\n Sai Email hoặc mật khẩu.");
                    }
                }
                    break;
                case "0":

                    break;
                default:
                    System.out.printf("\n  Không tìm thấy kết quả cho \"%s\"", luachon);
                    break;
            }
        } while (!luachon.equals("0"));
        sc.close();
    }

    private static void InDonHang(ArrayList<OrderDetail> orderDetails, Order order) throws SQLException {
        DecimalFormat formatter = new DecimalFormat("###,###,###.000");
        System.out.printf("\n     HÓA ĐƠN BÁN HÀNG                                                              Ngày: %s", order.getDate());
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | Đơn vị bán hàng  : CÔNG TY TNHH MTV THƯƠNG MẠI AKALI                                                            |");
        System.out.printf("\n     | Mã số thuế       : 0 3 1 2 3 8 8 3 6 3                                                                          |");
        System.out.printf("\n     | Địa chỉ          : 18 Tam Trinh, Hai Bà Trưng, Hà Nội                                                           |");
        System.out.printf("\n     | Điện thoại       : (+84) 987 654 321                                                                            |");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | Họ tên khách hàng: %-92s |", customer.getName().toUpperCase());
        System.out.printf("\n     | Mã số thuế       : %-92s |", "- - - - - - - - - -");
        System.out.printf("\n     | Địa chỉ          : %-92s |", customer.getAddress());
        System.out.printf("\n     | Điện thoại       : %-92s |", customer.getPhone());
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | %-4s | %-60s | %-10s | %-10s | %-15s |", "STT", "Sản phẩm", "Giá", "Số lượng", "Thành tiền");
        System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
        Book l = new Book();
        BookBl bookBL = new BookBl();
        for (int i = 0; i < orderDetails.size(); i++) {
            l = bookBL.getBookByID(orderDetails.get(i).getBookID());
            System.out.printf("\n     | %-4d | %-60s | %-10.3f | %-10d | %-15s |", (i + 1), l.getTitle(), l.getPrice(),
                    orderDetails.get(i).getAmount(),
                    formatter.format(l.getPrice() * orderDetails.get(i).getAmount()));
            System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
        }
        System.out.printf("\n     |                                                                                 Tổng cộng: %-15s |", formatter.format(order.getTotalDue()));
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o\n");
    }

    private static void DonHangCuaToi() throws SQLException {
        OrderDetailBl orderDetailBL = new OrderDetailBl();
        BookBl bookBL = new BookBl();
        ArrayList<Order> listOrders = new OrderBl().getListOrderByCustomerID(customer.getID());
        if (listOrders.size() > 0) {

            DecimalFormat formater = new DecimalFormat("###,###,###.000");
            ArrayList<OrderDetail> orderDetails = null;
            System.out.printf("\n     ĐƠN HÀNG CỦA BẠN");
            System.out.printf("\n     o----------------------------------------------------------------------------------------------------------------------------------------o");
            System.out.printf("\n     | %-5s | %-21s | %-84s | %-15s |", "ID", "Ngày đặt hàng", "Sản phẩm", "Tổng tiền");

            for (int i = 0; i < listOrders.size(); i++) {
                System.out.printf("\n     |----------------------------------------------------------------------------------------------------------------------------------------|");
                orderDetails = orderDetailBL.getListOrderDetailByOrderID(listOrders.get(i).getID());
                String sanpham = "";
                if (orderDetails.size() > 1) {
                    Book book = bookBL.getBookByID(orderDetails.get(0).getBookID());
                    if (book != null) {
                        sanpham = book.getTitle() + " ... và " + (orderDetails.size() - 1) + " sản phẩm khác.";
                    }
                } else if (orderDetails.size() == 1) {
                    Book book = bookBL.getBookByID(orderDetails.get(0).getBookID());
                    if (book != null) {
                        sanpham = book.getTitle();
                    }
                }
                System.out.printf("\n     | %-5d | %-21s | %-84s | %-15s |", listOrders.get(i).getID(),
                        listOrders.get(i).getDate(), sanpham, formater.format(listOrders.get(i).getTotalDue()));
            }
            System.out.printf("\n     o----------------------------------------------------------------------------------------------------------------------------------------o");

            byte check = 0;
            System.out.printf("\n     Nhập ID: ");
            int ID = Integer.parseInt(sc.nextLine());
            for (int i = 0; i < listOrders.size(); i++) {
                if (ID == listOrders.get(i).getID()) {
                    orderDetails = orderDetailBL.getListOrderDetailByOrderID(ID);
                    InDonHang(orderDetails, listOrders.get(i));
                    check = 1;

                    break;
                }
            }
            if (check == 0) {
                System.out.println("     Rất tiếc! Chúng tôi không tìm thấy ID bạn vừa nhập.");

            }
        } else {
            System.out.println("     Lịch sử mua hàng trống.");

        }
    }

    private static void DatHang() throws SQLException {
        if (Login) {
            XuLyHoaDon();
        } else {
            if (DangNhap()) {
                XuLyHoaDon();
            } else {
                System.out.printf("\n Sai Email hoặc mật khẩu.");
            }
        }
    }

    private static void XuLyHoaDon() throws SQLException {
        System.out.printf("Bạn có bao nhiêu tiền?");
        Double tien1 = Double.parseDouble(sc.nextLine());
        Double tien2 = 0.0;
        for (int i = 0; i < listOrderDetails.size(); i++) {
            tien2 += listOrderDetails.get(i).getAmount()
                    * new BookBl().getPriceByID(listOrderDetails.get(i).getBookID());
        }
        if (tien1 >= tien2) {
            OrderBl orderBL = new OrderBl();
            orderBL.insertOrder(customer.getID(), tien2);
            OrderDetailBl orderDetailBL = new OrderDetailBl();
            Order order = orderBL.getOrderByCustomerID(customer.getID());
            for (int i = 0; i < listOrderDetails.size(); i++) {
                listOrderDetails.get(i).setOrderID(order.getID());
                orderDetailBL.insertOrderDetail(listOrderDetails.get(i));
            }
            InHoaDon(tien1, order);
            listOrderDetails.clear();
        }
    }

    private static void InHoaDon(Double tien, Order order) throws SQLException {

        DecimalFormat formatter = new DecimalFormat("###,###,###.000");
        System.out.printf("\n     HÓA ĐƠN BÁN HÀNG                                                              Ngày: %s", order.getDate());
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | Đơn vị bán hàng  : CÔNG TY TNHH MTV THƯƠNG MẠI AKALI                                                            |");
        System.out.printf("\n     | Mã số thuế       : 0 3 1 2 3 8 8 3 6 3                                                                          |");
        System.out.printf("\n     | Địa chỉ          : 18 Tam Trinh, Hai Bà Trưng, Hà Nội                                                           |");
        System.out.printf("\n     | Điện thoại       : (+84) 987 654 321                                                                            |");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | Họ tên khách hàng: %-92s |", customer.getName().toUpperCase());
        System.out.printf("\n     | Mã số thuế       : %-92s |", "- - - - - - - - - -");
        System.out.printf("\n     | Địa chỉ          : %-92s |", customer.getAddress());
        System.out.printf("\n     | Điện thoại       : %-92s |", customer.getPhone());
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | %-4s | %-60s | %-10s | %-10s | %-15s |", "STT", "Sản phẩm", "Giá", "Số lượng", "Thành tiền");
        System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
        Book l = new Book();
        BookBl bookBL = new BookBl();
        for (int i = 0; i < listOrderDetails.size(); i++) {
            l = bookBL.getBookByID(listOrderDetails.get(i).getBookID());
            System.out.printf("\n     | %-4d | %-60s | %-10.3f | %-10d | %-15s |", (i + 1), l.getTitle(), l.getPrice(),
                    listOrderDetails.get(i).getAmount(),
                    formatter.format(l.getPrice() * listOrderDetails.get(i).getAmount()));
            System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
        }
        System.out.printf("\n     |                                                                                 Tổng cộng: %-15s |",
                formatter.format(order.getTotalDue()));
        System.out.printf("\n     |                                                                                 Khách trả: %-15s |",
                formatter.format(tien));
        Double tralai = order.getTotalDue() - tien;
        tralai = Math.abs(tralai);
        System.out.printf("\n     |                                                                                 Trả lại  : %-15s |",
                formatter.format(tralai));
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o\n");
    }

    private static Boolean DangNhap() {
        System.out.printf("\n     ĐĂNG NHẬP\n");
        System.out.printf("     Email   : ");
        String Email = sc.nextLine();
        java.io.Console console = System.console();
        char[] passwordArray = console.readPassword("     Mật khẩu: ");
        String Password = new String(passwordArray);
        Password = MD5(Password);
        Customer c = new CustomerBl().getPassword(Email);
        if (c.getPassword().equals(Password)) {
            customer = c;
            return true;
        } else {
            return false;
        }
    }

    private static void XemChiTietGioHang() throws SQLException {
        DecimalFormat formater = new DecimalFormat("###,###,###.000");
        System.out.printf("\n     GIỎ HÀNG CỦA TÔI");
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     | %-4s | %-60s | %-10s | %-10s | %-15s |", "ID", "Tên sách", "Giá(VNĐ)", "Số lượng",
                "Thành tiền(VNĐ)");
        Book book = null;
        Double thanhtien = 0.0;
        for (int i = 0; i < listOrderDetails.size(); i++) {
            book = new BookBl().getBookByID(listOrderDetails.get(i).getBookID());
            Double tamtinh = book.getPrice() * listOrderDetails.get(i).getAmount();
            System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
            System.out.printf("\n     | %-4d | %-60s | %-10.3f | %-10d | %-15s |", book.getID(), book.getTitle(),
                    book.getPrice(), listOrderDetails.get(i).getAmount(), formater.format(tamtinh));
            thanhtien += book.getPrice() * listOrderDetails.get(i).getAmount();
        }
        System.out.printf("\n     |-----------------------------------------------------------------------------------------------------------------|");
        System.out.printf("\n     |                                                                                 Tổng cộng(VNĐ): %-15s |",
                formater.format(thanhtien));
        System.out.printf("\n     o-----------------------------------------------------------------------------------------------------------------o");
        System.out.printf("\n     U: Chỉnh sửa giỏ hàng.   D: Đặt hàng.   0: Trở về. => ");
    }

    private static ArrayList<Book> TimKiemSachTheoTenSach(String tenSach) throws SQLException {
        tenSach = covertToString(tenSach).toLowerCase();
        ArrayList<Book> books = new BookBl().getListBook();
        ArrayList<Book> searching = new ArrayList<>();
        for (int i = 0; i < books.size(); i++) {
            if (covertToString(books.get(i).getTitle().toLowerCase()).contains(tenSach)) {
                searching.add(books.get(i));
            }
        }
        return searching;
    }

    private static ArrayList<Book> TimKiemTheoTenTacGia(String tacGia) throws SQLException {
        tacGia = covertToString(tacGia).toLowerCase();
        ArrayList<Book> books = new BookBl().getListBook();
        ArrayList<Book> searching = new ArrayList<>();
        for (int i = 0; i < books.size(); i++) {
            if (covertToString(books.get(i).getAuthor().toLowerCase()).contains(tacGia)) {
                searching.add(books.get(i));
            }
        }
        return searching;
    }

    private static String covertToString(String value) {
        try {
            String temp = Normalizer.normalize(value, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
            return pattern.matcher(temp).replaceAll("").replaceAll("đ", "d");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    private static String MD5(String Password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(Password.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private static void ThemSanPhamVaoGioHang(int BookID) throws SQLException {
        System.out.printf("\n  Nhập số lượng sách mà bạn muốn mua: ");
        int soluong = Integer.parseInt(sc.nextLine());
        int a = 0;
        for (int i = 0; i < listOrderDetails.size(); i++) {
            if (listOrderDetails.get(i).getBookID() == BookID) {
                listOrderDetails.get(i).setAmount(soluong + listOrderDetails.get(i).getAmount());
                a = 1;
                break;
            }
        }
        if (soluong > 0 && a == 0) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setAmount(soluong);
            orderDetail.setBookID(BookID);
            listOrderDetails.add(orderDetail);
        }
        if (soluong == 0) {
            System.out.printf("\nKhông thể thêm được vì số lượng = 0.");
        }
        if (soluong < 0) {
            System.out.printf("\nKhông thể thêm được vì số lượng = %d.", soluong);
        }
    }

    private static void XemChiTietSanPham(int BookID) throws SQLException {
        Book book = new BookBl().getBookByID(BookID);
        System.out.printf("\n  THÔNG TIN CHI TIẾT");
        System.out.printf("\n  -----------------------------------------------------------------------------------------------------------------");
        System.out.printf("\n  Tiêu đề           :  %s", book.getTitle());
        System.out.printf("\n  Tác giả           :  %s", book.getAuthor());
        System.out.printf("\n  Giá bán (VNĐ)     :  %s", book.getPrice());
        System.out.printf("\n  Công ty phát hành :  %s", book.getIssuingCompany());
        System.out.printf("\n  Ngày xuất bản     :  %s", book.getDateofPublication());
        System.out.printf("\n  Kích thước        :  %s", book.getDimensions());
        System.out.printf("\n  Loại bìa          :  %s", book.getCoverType());
        System.out.printf("\n  Số trang          :  %s", book.getNumberofPages());
        System.out.printf("\n  SKU               :  %s", book.getSKU());
        System.out.printf("\n  Nhà xuất bản      :  %s", book.getPublishingCompany());
        System.out.printf("\n\n  MÔ TẢ SẢN PHẨM");
        String Description = book.getDescription().replaceAll("  ", " ").replaceAll("\n ", "\n");
        System.out.printf("\n  -------------------------------------------------------------------------------------------------------------------");
        System.out.printf("\n  %s", Description);
        System.out.printf("\n  -------------------------------------------------------------------------------------------------------------------");
    }

    private static Boolean checkID(int ID) throws SQLException {
        ArrayList<Integer> listID = new BookBl().getListID();
        if (listID.contains(ID)) {
            return true;
        }
        return false;
    }

    private static void ShowBooks(ArrayList<Book> books) throws SQLException {
        int size = books.size();
        int from, to;

        if (size > 0 && size <= 20) {
            String luachon1;
            do {
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  | %-4s | %-60s | %-30s | %-10s |", "ID", "TÊN SÁCH", "TÁC GIẢ", "GIÁ (VNĐ)");
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                for (int i = 0; i < size; i++) {
                    System.out.printf("\n  | %-4d | %-60s | %-30s | %-10.3f |", books.get(i).getID(),
                            books.get(i).getTitle(), books.get(i).getAuthor(), books.get(i).getPrice());
                }
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  Bạn chọn => A: Thêm vào giỏ hàng.  B: Xem chi tiết.  0: Trở về.  => ");
                luachon1 = sc.nextLine();
                switch (luachon1) {
                    case "A":
                        System.out.printf(" Nhập ID của cuốn sách mà bạn thêm vào giỏ hàng: ");
                        int BookID1 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID1)) {
                            ThemSanPhamVaoGioHang(BookID1);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "B":
                        System.out.printf("Nhập ID sách mà bạn muốn xem thông tin chi tiết: ");
                        int BookID2 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID2)) {
                            XemChiTietSanPham(BookID2);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "0":

                        break;
                    default:
                        break;
                }
            } while (!luachon1.equals("0"));

        } else if (size > 20 && size <= 40) {
            from = 0;
            to = 20;
            String luachon1;
            do {
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  | %-4s | %-60s | %-30s | %-10s |", "ID", "TÊN SÁCH", "TÁC GIẢ", "GIÁ (VNĐ)");
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                for (int i = from; i < to; i++) {
                    System.out.printf("\n  | %-4d | %-60s | %-30s | %-10.3f |", books.get(i).getID(),
                            books.get(i).getTitle(), books.get(i).getAuthor(), books.get(i).getPrice());
                }
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  Bạn chọn =>  1..2: Chuyển trang  A: Thêm vào giỏ hàng.  B: Xem chi tiết.  0: Trở về.  => ");
                luachon1 = sc.nextLine();
                switch (luachon1) {
                    case "A":
                        System.out.printf(" Nhập ID của cuốn sách mà bạn thêm vào giỏ hàng: ");
                        int BookID1 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID1)) {
                            ThemSanPhamVaoGioHang(BookID1);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "B":
                        System.out.printf("Nhập ID sách mà bạn muốn thêm: ");
                        int BookID2 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID2)) {
                            XemChiTietSanPham(BookID2);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "0":

                        break;
                    case "1":
                        from = 0;
                        to = 20;
                        break;
                    case "2":
                        from = 20;
                        to = size;
                        break;
                    default:
                        break;
                }
            } while (!luachon1.equals("0"));
        } else if (size > 40 && size <= 60) {
            String luachon1;
            from = 0;
            to = 20;
            do {
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  | %-4s | %-60s | %-30s | %-10s |", "ID", "TÊN SÁCH", "TÁC GIẢ", "GIÁ (VNĐ)");
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                for (int i = from; i < to; i++) {
                    System.out.printf("\n  | %-4d | %-60s | %-30s | %-10.3f |", books.get(i).getID(),
                            books.get(i).getTitle(), books.get(i).getAuthor(), books.get(i).getPrice());
                }
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  Bạn chọn => 1..3: Chuyển trang.  A: Thêm vào giỏ hàng.  B: Xem chi tiết.  0: Trở về.  => ");
                luachon1 = sc.nextLine();
                switch (luachon1) {
                    case "A":
                        System.out.printf(" Nhập ID của cuốn sách mà bạn thêm vào giỏ hàng: ");
                        int BookID1 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID1)) {
                            ThemSanPhamVaoGioHang(BookID1);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "B":
                        System.out.printf("Nhập ID sách mà bạn muốn thêm: ");
                        int BookID2 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID2)) {
                            XemChiTietSanPham(BookID2);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "0":

                        break;
                    case "1":
                        from = 0;
                        to = 20;
                        break;
                    case "2":
                        from = 20;
                        to = 40;
                        break;
                    case "3":
                        from = 40;
                        to = size;
                        break;
                    default:
                        break;
                }
            } while (!luachon1.equals("0"));
        } else if (size > 60 && size <= 80) {
            from = 0;
            to = 20;
            String luachon1;
            do {
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  | %-4s | %-60s | %-30s | %-10s |", "ID", "TÊN SÁCH", "TÁC GIẢ", "GIÁ (VNĐ)");
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                for (int i = from; i < to; i++) {
                    System.out.printf("\n  | %-4d | %-60s | %-30s | %-10.3f |", books.get(i).getID(),
                            books.get(i).getTitle(), books.get(i).getAuthor(), books.get(i).getPrice());
                }
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  Bạn chọn => 1..4: Chuyển trang.  A: Thêm vào giỏ hàng.  B: Xem chi tiết.  0: Trở về.  => ");
                luachon1 = sc.nextLine();
                switch (luachon1) {
                    case "A":
                        System.out.printf(" Nhập ID của cuốn sách mà bạn thêm vào giỏ hàng: ");
                        int BookID1 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID1)) {
                            ThemSanPhamVaoGioHang(BookID1);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "B":
                        System.out.printf("Nhập ID sách mà bạn muốn thêm: ");
                        int BookID2 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID2)) {
                            XemChiTietSanPham(BookID2);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "0":

                        break;
                    case "1":
                        from = 0;
                        to = 20;
                        break;
                    case "2":
                        from = 20;
                        to = 40;
                        break;
                    case "3":
                        from = 40;
                        to = 60;
                        break;
                    case "4":
                        from = 60;
                        to = size;
                        break;
                    default:
                        break;
                }
            } while (!luachon1.equals("0"));
        } else if (size > 80 && size <= 100) {
            String luachon1;
            from = 0;
            to = 20;
            do {
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  | %-4s | %-60s | %-30s | %-10s |", "ID", "TÊN SÁCH", "TÁC GIẢ", "GIÁ (VNĐ)");
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                for (int i = from; i < to; i++) {
                    System.out.printf("\n  | %-4d | %-60s | %-30s | %-10.3f |", books.get(i).getID(),
                            books.get(i).getTitle(), books.get(i).getAuthor(), books.get(i).getPrice());
                }
                System.out.printf("\n  +------+--------------------------------------------------------------+--------------------------------+------------+");
                System.out.printf("\n  Bạn chọn => 1..5: Chuyển trang.  A: Thêm vào giỏ hàng.  B: Xem chi tiết.  0: Trở về.  => ");
                luachon1 = sc.nextLine();
                switch (luachon1) {
                    case "A":
                        System.out.printf(" Nhập ID của cuốn sách mà bạn thêm vào giỏ hàng: ");
                        int BookID1 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID1)) {
                            ThemSanPhamVaoGioHang(BookID1);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "B":
                        System.out.printf("Nhập ID sách mà bạn muốn thêm: ");
                        int BookID2 = Integer.parseInt(sc.nextLine());
                        if (checkID(BookID2)) {
                            XemChiTietSanPham(BookID2);
                        } else {
                            System.out.printf("Không tồn tại ID bạn vừa nhập.");
                        }
                        break;
                    case "0":

                        break;
                    case "1":
                        from = 0;
                        to = 20;
                        break;
                    case "2":
                        from = 20;
                        to = 40;
                        break;
                    case "3":
                        from = 40;
                        to = 60;
                        break;
                    case "4":
                        from = 60;
                        to = 80;
                        break;
                    case "5":
                        from = 80;
                        to = size;
                        break;
                    default:
                        break;
                }
            } while (!luachon1.equals("0"));
        } else if (size == 0) {
            System.out.printf("  Nhấn Enter để trở về...");
            sc.nextLine();
        }
    }
}
