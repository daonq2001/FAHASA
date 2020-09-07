create database if not exists BooksStoreOnline;
use BooksStoreOnline;

create table if not exists Books(
	ID int primary key,
    Title nvarchar(100),
    Price decimal(10,03),
    Author nvarchar(30),
    IssuingCompany nvarchar(100),
    DateofPublication nvarchar(20),
    Dimensions nvarchar(20),
    CoverType nvarchar(20),
    NumberofPages int,
    PublishingCompany nvarchar(100),
    SKU varchar(30),
    Description nvarchar(1000));
    
create table if not exists Customers(
	ID int primary key,
    Email varchar(100),
    Password varchar(1000),
    Name nvarchar(30),
    Address nvarchar(100),
    Phone varchar(12));
    
create table if not exists Orders(
	ID int auto_increment primary key,
    CustomerID int,
    Date datetime default current_timestamp,
    Status int default 1);

create table if not exists OrderDetails(
	BookID int,
    OrderID int,
    Amount int,
    UnitPrice decimal(10,03),
    primary key(BookID, OrderID));

alter table Orders add constraint FK_Orders_Customers foreign key(CustomerID) references Customers(ID);
alter table OrderDetails add constraint FK_OrderDetails_Books foreign key(BookID) references Books(ID);
alter table OrderDetails add constraint FK_OrderDetails_Orders foreign key(OrderID) references Orders(ID);

insert into Books(ID, Title, Price, Author, IssuingCompany, DateofPublication, Dimensions, CoverType, NumberofPages, PublishingCompany, SKU, Description) values
	(1000, "Muôn Kiếp Nhân Sinh", 109089, "Nguyên Phong", "First News - Trí Việt", "2020", "14.5 x 20.5 cm", "Bìa mềm", 408, "Nhà Xuất Bản Tổng hợp TP.HCM", "5075886035946",
	"“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm
     2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu
     năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ
     này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của 
     vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày."),
    (1001, "Vui Vẻ Không Quạu Nha - Tản Văn", 44739, "Ở Đây Zui Nè", "Skybooks", "03-2020", "10 x 12 cm", "Bìa mềm", 280, "Nhà Xuất Bản Phụ Nữ", "4746981416862",
	"Cuộc đời ngày ngày nói yêu mình. Xong cuộc đời lại đủ thứ phức tạp và bất công với mình. Vậy là cuộc đời
     ghét mình rồi! Thôi nào! Thả lỏng và tận hưởng sự vui vẻ đi. Vì chẳng phải cuộc đời đang ghét bạn đâu, mà
     chính bạn bạn đang loay hoay với những mệt nhọc ở trên đời. Ví dụ như nay đã là deadline mà bỗng bị rớt
     mạng, sáng nay đi làm quên đem theo ví, hay đồng nghiệp ở công ty nói xấu mình Và hãy hét to với Thế giới
     rằng “Mình là một người tràn đầy năng lượng,” luôn sẵn sàng để hạnh phúc hơn."),
    (1002, "Đừng Lựa Chọn An Nhàn Khi Còn Trẻ", 56700, "Cảnh Thiên", "GuBooks", "02-2019", "13.5 x 20 cm", "Bìa mềm", 316, "Nhà Xuất Bản Thế Giới", "9552147738847",
    "Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không
     chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình. Bạn mơ mộng rằng
     làm việc xong sẽ vào làm ở một công ty nổi tiếng, làm một thời gian sẽ thăng quan tiến chức. Nhưng vì sao
     bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn
     muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ."),
    (1003, "Đắc Nhân Tâm (Khổ Lớn)", 49289, "Dale Carnegie", "First News - Trí Việt", "03-2016", "14.5 x 20.5 cm", "Bìa mềm", 320, "Nhà Xuất Bản Tổng hợp TP.HCM", "2436661537384",
     
    "Đắc nhân tâm của Dale Carnegie là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục
     sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Được xuất
     bản năm 1936, với số lượng bán ra hơn 15 triệu bản, tính đến nay, sách đã được dịch ra ở hầu hết các ngôn
     ngữ, trong đó có cả Việt Nam, và đã nhận được sự đón tiếp nhiệt tình của đọc giả ở hầu hết các quốc gia."),
    (1004, "Làm Bạn Với Bầu Trời", 59980, "Nguyễn Nhật Ánh", "NXB Trẻ", "01-2019", "14 x 20.5 cm", "Bìa mềm", 220, "NXB Trẻ", "6664030992090", 
	 
    "Một câu chuyện giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Vẻ đẹp lộng lẫy, vì lòng vị tha và
     tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên
     lòng khát khao sống tốt trên đời. Như nhà văn từng phát biểu “điểm mạnh của văn chương nằm ở khả năng
     thẩm thấu. Bằng hình thức đặc thù của mình, văn chương góp phần mài sắc các ý niệm đạo đức nơi người đọc
     một cách vô hình. Bồi đắp tâm hồn và nhân cách một cách âm thầm và bền bỉ, đó là chức năng gốc rễ của văn
     chương, đặc biệt là văn chương viết cho thanh thiếu niên.”"),
    (1005, "Đàn Ông Sao Hỏa Đàn Bà Sao Kim", 102405, "John Gray", "BIZBOOKS", "01-2019", "14.5 x 20.5 cm", "Bìa mềm", 488, "Nhà Xuất Bản Hồng Đức", "2496196333059",
     
    "Để cảm thấy dễ chịu hơn, người sao Hỏa náu mình trong kén để tự vấn về rắc rối của mình. Người sao Kim
     lại cảm thấy nhẹ nhõm hơn khi ai đó sẻ chia những vấn đề cùng họ. Đàn ông giữ kín những bí mật trong khi
     phụ nữ lại rất thích bày tỏ. Một mối quan hệ cũng giống như một khu vườn, để phát triển, nó phải được tưới
     nước thường xuyên. Cũng tương tự như thế, để gìn giữ sự kỳ diệu của tình yêu tồn tại, chúng ta hiểu biết
     và nuôi dưỡng những nhu cầu đặt biệt của tình yêu."),
    (1006, "Nóng Giận Là Bản Năng , Tĩnh Lặng Là Bản Lĩnh", 71200, "Tống Mặc", "Skybooks", "01-2019", "13.5 x 20.5 cm", "Bìa mềm", 264, "Nhà Xuất Bản Thế Giới", "6851692325469",
     
    "Đem một nắm muối bỏ vào cốc nước, cốc nước trở nên mặn chát. Đem một nắm muối bỏ vào hồ nước, hồ nước
     vẫn ngọt lành. Lòng người cũng vậy, càng nông cạn càng dễ biến chất, càng sâu sắc càng khó lung lay. Ý 
     nghĩa của đời người không ngoài việc tu tâm dưỡng tính, để mở lòng ra bao la như biển hồ, trước những nắm
     muối thị phi của cuộc đời vẫn thản nhiên không xao động. Trưởng thành, hãy để lòng rộng mở, tiến gần đến 
     chữ “Người”, học được cách bao dung, học được cách khống chế cảm xúc. Đừng để những xúc động nhất thời như
     ngọn lửa, tưởng thiêu rụi được kẻ thù mà thực ra lại làm bỏng tay ta trước."),
    (1007, "Hành Trình Về Phương Đông", 57200, "Nguyên Phong", "First News - Trí Việt", "01-2019", "14.5 x 20.5 cm", "Bìa mềm", 256, "First News - Trí Việt", "8281127474932",
     
    "Hành Trình Về Phương Đông mở ra một chân trời mới về Đông Tây gặp nhau, để khoa học Minh triết hội ngộ, 
     để Hiện đại Cổ xưa giao duyên, để Đất Trời là một. Thế giới, vì vậy đã trở nên hài hòa hơn, rộng mở, diệu
     kỳ hơn và, do đó, nhân văn hơn. Đúng lúc một cuộc đối thoại cởi mở và chân thành đang sắp diễn ra với các
     đạo sĩ bậc thầy, thì đoàn nhận được tối hậu thu từ chính quyền Anh Quốc là phải ngừng ngay việc nghiên cứu,
     tức khắc hồi hương và bị buộc phải im lặng, không được phát ngôn về bất cứ điều gì mà họ đã chứng nghiệm.
     Sau cùng ba nhà khoa học trong đoàn đã chấp nhận"),
    (1008, "Sapiens: Lược Sử Loài Người", 123778, "Yuval Noah Harari", "Omega Plus", "11-2017", "16 x 24 cm", "Bìa mềm", 554, "Nhà Xuất Bản Tri Thức", "3531839263887",
     
    "Sapiens, đưa chúng ta vào một chuyến đi kinh ngạc qua toàn bộ lịch sử loài người, từ những gốc rễ tiến
     hóa của nó đến thời đại của chủ nghĩa tư bản và kỹ thuật di truyền, để khám phá tại sao chúng ta đang
     trong những điều kiện sinh sống hiện tại. “Tôi khuyến khích tất cả chúng ta, dẫu có những tin tưởng tín
     ngưỡng nào, để đặt câu hỏi về những thuật kể cơ bản về thế giới chúng ta, để nối những phát triển ngày xưa
     với những quan tâm ngày nay, và để không sợ hãi những vấn đề tranh luận” (Yuval Noah Harari)"),
    (1009, "Đừng Bao Giờ Đi Ăn Một Mình", 57680, "Keith Ferrazzi", "NXB Trẻ", "09-2017", "14.5 x 20.5 cm", "Bìa mềm", 388, "NXB Trẻ", "2421401646327",
     
    "Bạn mong muốn đi tắt đón đầu? Bạn muốn vững bước đến thành công? Ferrazzi sinh ra trong một gia đình có
     cha là công nhân nhà máy thép tỉnh lẻ và mẹ là lao công. Tuy vậy ông đã biết tận dụng khả năng kết nối 
     xuất sắc của mình để dọn đường vào đến Yale, nhận bằng MBA tại Harvard, và giữ những chức vụ lãnh đạo quan
     trọng. Mặc dù chưa quá 40, Ferrazzi đã tạo được một mạng lưới trải dài từ hành lang ở Washington đến các
     tên tuổi lớn tại Hollywood. Ông đã được tạp chí Crain bình chọn là một trong số 40 người lãnh đạo kinh
     doanh dưới 40 tuổi đồng thời là Nhà lãnh đạo tương lai của thế giới tại Diễn đàn Kinh tế Thế giới ở Davos."),
    (1010, "Chủ Nghĩa Khắc Kỷ", 81028, "William B. Irvine", "Thái Hà", "02-2020", "14.5 x 20.5 cm", "Bìa mềm", 370, "Nhà Xuất Bản Công Thương", "2316950607960",
     
    "Bạn mong muốn điều gì từ cuộc sống này? Có thể câu trả lời của bạn là muốn có một người bạn đời biết quan
     tâm, một công việc tốt và một ngôi nhà đẹp, nhưng chúng thực ra chỉ là một số thứ bạn muốn có trong cuộc
     sống. Nền văn hóa của chúng ta vốn không khuyến khích mọi người nghĩ về những điều như vậy, mà chỉ tạo ra
     hết xao lãng này đến xao lãng khác, để chúng ta bao giờ phải bận tâm đến chúng. Nhưng một mục tiêu lớn lao
     trong đời là thành phần đầu tiên của một triết lý sống. Nếu bạn không có một mục tiêu lớn lao trong đời,
     tức là bạn không có một triết lý sống chặt chẽ."),
    (1011, "Nhà Lãnh Đạo Không Chức Danh", 53600, "Robin Sharma", "NXB Trẻ", "02-2017", "13 x 20.5 cm", "Bìa mềm", 270, "NXB Trẻ", "2427017411946",
     
    "Suốt hơn 15 năm, Robin Sharma đã thầm lặng chia sẻ với những công ty trong danh sách Fortune 500 và
     nhiều người siêu giàu khác một công thức thành công đã giúp ông trở thành một trong những nhà cố vấn lãnh
     đạo được theo đuổi nhiều nhất thế giới. Đây là lần đầu tiên Sharma công bố công thức độc quyền này với bạn,
     để bạn có thể đạt được những gì tốt nhất, đồng thời giúp tổ chức của bạn có thể có những bước đột phá đến
     một cấp độ thành công mới trong thời đại thiên biến vạn hóa như hiện nay. Bất kể bạn làm gì trong tổ chức
     và cuộc sống hiện tại của bạn như thế nào, một thực tế quan trọng duy nhất là bạn có khả năng thể hiện năng
     lực lãnh đạo. Cho dù sự nghiệp hiện tại của bạn đang ở đâu, bạn vẫn luôn cần phải thể hiện những khả năng
     tột đỉnh của mình. Cuốn sách này sẽ hướng dẫn bạn làm thế nào để khai thác tối đa khả năng đó, cũng như
     thay đổi cuộc sống và thế giới xung quanh bạn."),
    (1012, "Từ Tốt Đến Vĩ Đại", 76890, "Jim Collins", "NXB Trẻ", "01-2017", "14.5 x 20.5 cm", "Bìa mềm", 442, "NXB Trẻ", "2423295326675",
     
    "Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để
     rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu
     tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem
     xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều
     hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty
     (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề.
     Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!"),
    (1013, "Cân Bằng Cảm Xúc, Cả Lúc Bão Giông", 76800, "Richard Nicholls", "Skybooks", "04-2019", "13,5 x 20,5 cm", "Bìa mềm", 336, "Nhà Xuất Bản Thế Giới", "3053629188366",
     
    "Một ngày, chúng ta có khoảng 16 tiếng tiếp xúc với con người, công việc, các nguồn thông tin từ mạng xã
     hội, loa đài báo giấy… Việc này mang đến cho bạn vô vàn cảm xúc, cả tiêu cực lẫn tích cực. Chỉ cho người
     đọc những lý do khiến chúng ta luôn tiêu cực và bản chất của những điều này là gì? Những điều khiến chúng
     ta thường xuyên nóng giận và không hạnh phúc bắt nguồn từ đâu? Đưa ra những bài tập cụ thể để cân bằng cảm
     xúc mỗi ngày như: Ngừng suy nghĩ trong một khoảng thời gian cố định, tưởng tượng một quá trình, tập sống
     với bản thân mỗi ngày… Cân bằng phương trình của cuộc đời không dễ, cuốn sách này không chỉ là lý thuyết
     còn cho bạn những kĩ năng, phướng pháp tận tình nhất để giúp bạn làm chủ cảm xúc của mình."),
    (1014, "Đọc Vị Bất Kỳ Ai", 51239, "TS. David J. Lieberman", "Thái Hà", "11-2019", "13 x 20.5 cm", "Bìa mềm", 223, "Nhà Xuất Bản Lao Động", "9965161190001",
     
    "Cuốn sách này sẽ không giúp bạn rút ra các kết luận chung về một ai đó dựa vào cảm tính hay sự võ đoán.
     Những nguyên tắc được chia sẻ trong cuốn sách này không đơn thuần là những lý thuyết hay mẹo vặt chỉ đúng
     trong một số trường hợp hoặc với những đối tượng nhất định. Các kết quả nghiên cứu trong cuốn sách này
     được đưa ra dựa trên phương pháp S.N.A.P - cách thức phân tích và tìm hiểu tính cách một cách bài bản trong
     phạm vi cho phép mà không làm mếch lòng đối tượng được phân tích. Phương pháp này dựa trên những phân tích
     về  tâm lý, chứ không chỉ đơn thuần dựa trên ngôn ngữ cử chỉ, trực giác hay võ đoán."),
    (1015, "Đời Ngắn Đừng Ngủ Dài", 50250, "Robin Sharma", "NXB Trẻ", "12-2018", "13 x 20.5 cm", "Bìa mềm", 228, "NXB Trẻ", "7265668071233",
     
    "“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải
     theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua
     ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt
     huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.” Bằng những lời chia sẻ thật
     ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, Robin Sharma tiếp tục phong cách viết của
     ông từ cuốn sách Điều vĩ đại đời thường để mang đến cho độc giả những bài viết như lời tâm sự, vừa chân
     thành vừa sâu sắc."),
    (1016, "Dấu Chân Trên Cát", 76700, "Nguyên Phong", "First News - Trí Việt", "11-2019", "14.5 x 20.5 cm", "Bìa mềm", 436, "Nhà Xuất Bản Tổng Hợp", "1661583166867",
     
    "Ngày nay, người ta biết đến triều đại các vua chúa Ai Cập thời cổ qua sách vở của người Hy Lạp. Sở dĩ
     các sử gia Hy Lạp biết được các chi tiết này vì họ đã học hỏi từ người Ai Cập bị đày biệt xứ tên là Sinuhe.
     Đây là một nhân vật lạ lùng, đã có công mang văn minh Ai Cập truyền vào Hy Lạp khi quốc gia này còn ở tình
     trạng kém mở mang so với Ai Cập lúc đó. Việc một người Ai Cập, thân thế mơ hồ, bị đày biệt xứ, đến mở trường
     dạy học tại Athens, trung tâm văn hóa của Hy Lạp, vẫn là một bí mật đến nay các nhà khảo cổ chưa tìm ra được
     câu trả lời. Mặc dù là tiểu thuyết lịch sử về xã hội Ai Cập cổ đại, song nhiều vấn đề được nêu ra trong tác
     phẩm vẫn có ý nghĩa thời sự trong thế giới ngày nay. Đó là lý do khiến cho tác phẩm không chỉ giữ được sự 
     cuốn hút đối với bạn đọc Việt Nam và rất nhiều nơi trên thế giới trong hơn nửa thế kỷ qua. Bạn sẽ không thể
     rời mắt khỏi những dòng văn viết với ý tứ sâu sắc của một người con xa quê hương."),
    (1017, "Dạy Con Làm Giàu (Tập 1)", 43550, "Robert T. Kiyosaki", "NXB Trẻ", "11-2018", "15 x 20.5 cm", "Bìa mềm", 193, "NXB Trẻ", "3908993025659",
     
    "Một quốc gia có thể tồn tại như thế nào nếu việc dạy trẻ con quản lý tiền bạc vẫn là trách nhiệm của phụ
     huynh, mà hầu hết họ không có nhiều kiến thức về vấn đề này? Chúng ta phải làm gì để thay đổi số phận tiền
     bạc lận đận của mình? Nhà giàu đã làm giàu như thế nào từ hai bàn tay trắng? Cuốn sách Dạy Con Làm Giàu -
     Tập 1 sẽ giúp bạn giải đáp được phần nào những thắc mắc trên. Nội dung cuốn sách gồm 10 chương:
	 Chương 1: Cha giàu, cha nghèo
	 Chương 2: Người giàu không làm việc vì tiền
	 Chương 3: Tại sao phải dạy con về tài chính?
	 Chương 4: Hãy nghĩ đến việc kinh doanh của mình
	 Chương 5: Liên đoàn - Bí mật lớn nhất của người giàu
	 Chương 6: Người giàu tạo ra tiền
	 Chương 7: Hãy làm việc để học - Đừng làm việc vì tiền
	 Chương 8: Vượt chướng ngại vật
	 Chương 9: Sự khởi đầu
	 Chương 10: Vẫn còn muốn nhiều hơn? Đây là một số việc phải làm"),
    (1018, "Tony Buổi Sáng - Trên Đường Băng", 51980, "Tony", "NXB Trẻ", "10-2017", "13 x 20 cm", "Bìa mềm", 308, "NXB Trẻ", "2436636288761",
     
    "\"Khi còn trẻ, hãy ra ngoài nhiều hơn ở nhà. Hãy nhào vô xin người khác “bóc hết, lột sạch” khả năng của
     mình. Chỉ sợ bất tài nộp hồ sơ “xin việc”, mà chả ai thèm cho, chả ai thèm bóc lột. Khi đã được bóc và lột
     hết, dù sau này đi đâu, làm gì, bạn đều cực kỳ thành công. Vì năng lực được trui rèn trong quá trình làm
     cho người khác. Sự chăm chỉ, tính kỷ luật, quen tay quen chân, quen ngáp, quen lười… cũng từ công việc mà
     ra. Mọi ông chủ vĩ đại đều từng là những người làm công ở vị trí thấp nhất. Họ đều rẽ trái trong khi mọi
     người rẽ phải. Họ có những quyết định không theo đám đông, không cam chịu sống một cuộc đời tầm thường,
     nhạt nhòa… rồi chết."),
    (1019, "Nhà Giả Kim", 41400, "Paulo Coelho", "Nhã Nam", "10-2013", "13 x 20.5 cm", "Bìa mềm", 228, "Nhà Xuất Bản Văn Học", "2518407786529",
     
    "Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu 
     được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. Tiểu thuyết Nhà giả kim của Paulo
     Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của
     phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số
     phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm
     rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm
     thay đổi cuộc đời người đọc. “Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy
     nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. "),
    (1020, "Bạn Đắt Giá Bao Nhiêu?", 74250,"Vãn Tình", "Bloom Books", "03-2018", "14.5 x 20 cm", "Bìa mềm", 320, "Nhà Xuất Bản Thế Giới", "6471542393457",
     
    "Bạn Đắt Giá Bao Nhiêu? Câu trả lời này do chính bạn quyết định, chính bạn “định giá”. Hơn bốn mươi câu
     chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống
     của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình
     huống của chính mình. Với những câu chuyện đó, Vãn Tình hi vọng có thể giúp các cô gái thoát khỏi tình cảnh
     khó khăn, tìm lại bản ngã, sống cuộc đời theo cách mà mình mong muốn. “Các cô gái thân mến, mong rằng sự
     trưởng thành của chúng ta không phải đến từ sự thương tổn. Không cần trở thành một cô gái được tất-cả-mọi-
     người yêu quý, nhưng nhất định phải trở thành một cô gái mà chính-mình-yêu-thích.”"),
    (1021, "Tôi Tài Giỏi - Bạn Cũng Thế", 75298, "Adam Khoo", "TGM Books", "02-2019", "16 x 24 cm", "Bìa mềm", 276, "Nhà Xuất Bản Phụ Nữ", "5115471654494",
     
    "Khi bạn cầm trên tay quyển sách này, có nghĩa là bạn đã có chiếc chìa khóa đến sự thành công cùng bảng
     hướng dẫn sử dụng. Tác giả không chỉ đơn thuần giải thích người khác đã thành công như thế nào, mà còn nói
     làm sao để họ làm được như thế để giúp người đọc khám phá ra tiềm năng của bản thân, và phát huy điều đó.
     Ngoài ra, sách còn cung cấp những phương pháp học thông minh (như áp dụng các công cụ học bằng cả não bộ 
     như Sơ Đồ Tư Duy, phát triển trí nhớ siêu việt để ghi nhớ các sự kiện, con số một cách dễ dàng, thành thạo
     việc quản lý thời gian và xác định mục tiêu). Adam Khoo đã cho thấy, tài giỏi mang lại sự tự tin như thế 
     nào và còn hướng dẫn bạn cách thức trở thành người tài giỏi. Qua đó độc giả sẽ lập được kế hoạch cho cuộc
     đời của chính mình. Thật sự đây là một quyển sách rất tuyệt vời và bổ ích, đem lại cho chúng ta những kinh
     nghiệm quý báu. Một quyển sách không - thể - thiếu trong tủ sách!"),
    (1022, "Chuyện Con Mèo Dạy Hải Âu Bay", 29400, "Luis Sepulveda", "Nhã Nam", "06-2019", "14 x 20.5 cm", "Bìa mềm", 144, "Nhà Xuất Bản Hội Nhà Văn", "3274339512467",
     
    "Cô hải âu Kengah bị nhấn chìm trong váng dầu – thứ chất thải nguy hiểm mà những con người xấu xa bí mật
     đổ ra đại dương. Với nỗ lực đầy tuyệt vọng, cô bay vào bến cảng Hamburg và rơi xuống ban công của con mèo
     mun, to đùng, mập ú Zorba. Trong phút cuối cuộc đời, cô sinh ra một quả trứng và con mèo mun hứa  với cô
     sẽ thực hiện ba lời hứa chừng như không tưởng với loài mèo:
	 Không ăn quả trứng.
	 Chăm sóc cho tới khi nó nở.
	 Dạy cho con hải âu bay.
	 Cuốn sách mở đầu cho mùa hè với minh họa dễ thương, hài hước là món quà dành cho mọi trẻ em và người lớn."),
    (1023, "Sống Thực Tế Giữa Đời Thực Dụng", 63700, "Mễ Mông", "Vibooks", "10-2018", "14.5 x 20.5 cm", "Bìa mềm", 360, "Nhà Xuất Bản Dân Trí", "4018690253374",
     
    "THỰC DỤNG Ư? KHÔNG HỀ, TÔI CHỈ RẤT THỰC TẾ THÔI!
	 Con người muốn trưởng thành đều phải trải qua ba lần lột xác “phá kén hóa bướm”. Lần đầu tiên là khi nhận
     ra mình không phải trung tâm thế giới. Lần thứ hai là khi phát hiện ra dù cố gắng đến đâu vẫn có những
     việc cảm thấy thật bất lực. Lần thứ ba là khi biết rõ có những việc bản thân không thể làm được nhưng vẫn
     cố tranh đấu đến cùng. Thế giới này làm gì có đưa than ngày tuyết rơi, chỉ có dệt hoa lên gấm thôi.
     Bạn muốn được người khác dệt hoa lên gấm, trước tiên bạn phải trở thành gấm đã."),
    (1024, "Những Gì Đã Qua Đừng Nghĩ Lại Quá Nhiều", 46800, "Minh Mẫn", "Người Trẻ Việt", "03-2020", "13 x 20,5 cm", "Bìa mềm", 240, "Nhà Xuất Bản Văn Học", "7927610825836",
     
    "Cách đây 3 năm, “Những gì đã qua đừng nghĩ lại quá nhiều” trở thành cuốn sách bestseller trên khắp các
     bảng xếp hạng. Liên tục tái bản ngay sau đó, nhận được vô số những phản hồi tích cực từ độc giả, những ai
     chưa từng đọc thì vô cùng tiếc nuối. Lần trở lại này, “em nhỏ” được thay áo mới vô cùng xinh xắn! Cuốn 
     sách là sự kết hợp tuyệt vời giữa hai nhà văn trẻ nổi tiếng: Minh Mẫn và Du Phong hứa hẹn sẽ đem đến cho
     những tâm hồn đang tổn thương sự vui vẻ và nhẹ nhõm trước những nỗi đau quá khứ. Sau tất cả, điều ta nhận
     ra là: Thời gian rồi sẽ chữa lành mọi thứ, dù bạn có muốn hay không. Những cảm xúc tưởng chừng không thể
     nào phai nhòa, cuối cùng cũng chịu thua trước thời gian. Thời gian tàn nhẫn, nhưng cũng khiến con người
     nhẹ lòng hơn. Đó là những gì bạn cảm nhận được sau khi đọc cuốn sách này."),
    (1025, "999 Lá Thư Gửi Cho Chính Mình", 99000, "Miêu Công Tử", "Vanvietbook", "09-2018", "12,5 x 18 cm", "Bìa mềm", 233, "Nhà Xuất Bản Thanh Niên", "2776764091346",
     
    "“999 lá thư gửi cho chính mình” là một tác phẩm đặc biệt đầy cảm hứng đến từ tác giả văn học mạng nổi 
     tiếng Miêu Công Tử, mang một màu sắc riêng biệt qua những lời thư nhỏ nhắn nhủ đến người đọc về giá trị
     cuộc sống, tình yêu, tuổi trẻ, tương lai… v.v.. đã làm lay động trái tim của hàng vạn độc giả trẻ. Cầm
     trên tay cuốn sách “999 lá thư gửi cho chính mình” – bạn sẽ hiểu rằng: tuổi trẻ của chúng ta dù có mong
     manh đến đâu thì cũng sẽ thành công vượt qua mọi khó khăn một cách mạnh mẽ ngoài sức tưởng tượng. Bạn sẽ
	 biết cách nói lời cảm ơn với những ai đã rời bỏ bạn, hiểu ra rằng họ không phải người thích hợp để cùng
     đồng hành với bạn trên đoạn đường chông gai đi tới tương lai. Đôi lúc bạn có thể yếu đuối mỏi mệt rơi nước
     mắt, thế nhưng khi bất chợt nhìn lại, bạn sẽ thấy thì ra mình đã rất mạnh mẽ, dũng cảm đi hết cả một quãng
     đường dài."),
    (1026, "Khéo Ăn Nói Sẽ Có Được Thiên Hạ", 75889, "Trác Nhã", "Minh Long", "06-2018", "14.5 x 20.5 cm", "Bìa mềm", 406, "Nhà Xuất Bản Văn Học", "2436878546179",
     
    "Trong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù
     là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn
     nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc... không thể không cần đến kĩ năng và khả năng
     giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở
     ngại, khó khăn. Trong thời đại thông tin và liên lạc phát triển nhanh chóng, tin tức được cập nhật liên tục,
     các công cụ thông tin và kĩ thuật truyền thông được ứng dụng rộng rãi như ngày nay thì việc khéo ăn nói đã
     trở thành “cái tài số một thiên hạ”. Trong khoảng thời gian ngắn nhất, nếu ai có thể nêu bật được khả năng,
     thực lực của mình cho đối phương biết thì đó sẽ là người chiến thắng. Chính vì vậy mà câu nói “Khéo ăn nói
     sẽ có được thiên hạ” rất có ý nghĩa."),
    (1027, "Tôi Quyết Định Sống Cho Chính Tôi", 65349, "Kim Suhyun", "Mintbooks", "12-2019", "13.5 x 19.5 cm", "Bìa mềm", 236, "Nhà Xuất Bản Thanh Niên", "6397587938470",
     
    "Cuốn sách đạt giải thưởng “Cuốn sách của năm” tại Hàn Quốc vào năm 2017. Đã tái bản hơn 100 lần kể từ 
     lần xuất bản đầu tiên vào năm 2016. Được nhiều nghệ sĩ chọn đọc và giới thiệu đến các fan của mình, đơn
     cử là JungKook (BTS). Như tác giả Kim Suhyun đã chia sẻ về quá trình sáng tác cuốn sách này:
	 Thay vào đó, hãy làm việc chăm chỉ.
	 Tôi dần tránh những mối quan hệ chỉ nhấn chìm tôi hoặc không quan trọng với tôi và tự nhủ
     rằng tôi sẽ không cho phép bản thân làm bất kể điều gì một cách tùy tiện nữa.
	 Tôi dành thời gian tìm kiếm niềm vui trong cuộc sống.
 	 Có những ngày, tôi ngồi ngắm bầu trời vài lần để cảm nhận cuộc sống. Tôi đối diện với những
     vấn đề còn bỏ ngỏ, giải quyết chúng và cố gắng sống lành mạnh."),
    (1028, "Ngày Xưa Có Một Con Bò...", 48890, "Camilo Cruz", "NXB Trẻ", "12-2019", "13 x 20 cm", "Bìa mềm", 148, "NXB Trẻ", "3744250775420",
     
    "Khởi đầu bằng một câu chuyện mang tính ngụ ngôn vừa ngắn gọn, vừa dễ hiểu, cuốn sách rút ra một bài học
     sâu sắc nhưng thật đơn giản cho những ai vẫn đang vật lộn tìm kiếm thành công ở đời: những lời bao biện,
     viện cớ, đổ lỗi chẳng bao giờ giúp được chúng ta thành công hơn; ngược lại, dám dũng cảm đối mặt với sự
     trì trệ của mình để sẵn sàng tìm ra giải pháp mới là con đường tiến lên bền vững. Đây là một cuốn sách có
     thể tạo cảm hứng thật sự cho bất kỳ ai."),
    (1029, "Bắt Đầu Với Câu Hỏi Tại Sao?", 75650, "Simon Sinek", "Thái Hà", "2009", "14.5 x 20.5 cm", "Bìa mềm", 346, "Nhà Xuất Bản Lao Động", "5617737517432",
     
    "Lần đầu tiên khi tôi khám phá ra sức mạnh của lý do TẠI SAO là khi tôi cần đến nó trong cuộc đời mình. 
     Nó không phải là kết quả của việc theo đuổi con đường học vấn của tôi. Nó đã xuất hiện khi tôi không còn
     cảm hứng với công việc của mình và cảm thấy vô cùng chán nản và thất vọng. Thực tế là đã không có vấn đề 
     gì xảy ra với công việc của tôi, mà do tôi đã đánh mất niềm vui trong công việc mình làm. Nếu xét trên
     phương diện bề ngoài thì tôi nên vui mới phải. Tôi đã nhận được những khoản thù lao tốt và được làm việc
     với những đối tác tuyệt vời. Nhưng tôi đã trở nên vô cảm với những gì mình làm. Tôi không còn cảm thấy hài
     lòng với công việc của mình và cần tìm ra cách để nhóm lên ngọn lửa nhiệt huyết và đam mê thêm một lần nữa.
     Việc khám phá tầm quan trọng của lý do TẠI SAO đã hoàn toàn thay đổi cái nhìn của tôi về thế giới."),
    (1030, "Dám Bị Ghét", 57600, "Koga Fumitake", "Nhã Nam", "02-2018", "14.5 x 20.5 cm", "Bìa mềm", 336, "Nhà Xuất Bản Lao Động", "7750936862328",
     
    "Các mối quan hệ xã hội thật mệt mỏi. Cuộc sống sao mà nhạt nhẽo và vô nghĩa. Bản thân mình xấu xí và kém
     cỏi. Quá khứ đầy buồn đau còn tương lai thì mờ mịt. Yêu cầu của người khác thật khắc nghiệt và phi lý.
     TẠI SAO BẠN CỨ PHẢI SỐNG THEO KHUÔN MẪU NGƯỜI KHÁC ĐẶT RA?
	 Dưới hình thức một cuộc đối thoại giữa Chàng thanh niên và Triết gia, cuốn sách trình bày một cách sinh
     động và hấp dẫn những nét chính trong tư tưởng của nhà tâm lý học Alfred Adler, người được mệnh danh là
     một trong “ba người khổng lồ của tâm lý học hiện đại”, sánh ngang với Freud và Jung. Khác với Freud cho
     rằng quá khứ và hoàn cảnh là động lực làm nên con người ta của hiện tại, Adler chủ trương “cuộc đời ta là
     do ta lựa chọn”, và tâm lý học Adler được gọi là “tâm lý học của lòng can đảm”."),
    (1031, "Người Nam Châm", 42250, "Jack Canfield & DD.Watkins", "Thái Hà", "10-2019", "13 x 20.5 cm", "Bìa mềm", 194, "Nhà Xuất Bản Công Thương", "2406877753984",
     
    "Cuốn sách viết về cách hoạt động của Luật hấp dẫn trong cuộc sống của bạn, từ đó bạn có thể hiểu nhiều
     hơn về bản thân mình - thực ra bạn là ai và tại sao bạn lại ở đây. Cuốn sách này chính là chìa khóa của
     bạn. Nó có thể mở cánh cửa tới tương lai như bạn mong ước và đưa bạn tới con đường có nhiều niềm vui, sung
     túc và giàu có hơn. Khi đọc cuốn sách này, bạn sẽ thấy mình được truyền cảm hứng vì bạn nhận ra rằng bạn
     có thể tạo ra cuộc sống mà bạn khao khát, và bạn sẽ được trao quyền khi sử dụng những công cụ, những chiến
     lược và những khái niệm cơ bản được chuyển tải trong những trang sách này."),
    (1032, "Cà Phê Cùng Tony", 58389, "Tony", "NXB Trẻ", "11-2017", "13 x 20 cm", "Bìa mềm", 268, "NXB Trẻ", "9683567680451",
     
    "Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định
     mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên
     con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng.
     Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính
     mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ
     như nên chú ý những phép tắc xã giao thông thường. Chúng tôi tin rằng những người trẻ tuổi luôn mang trong
     mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành
     động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê
     thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng."),
    (1033, "Người Giàu Có Nhất Thành Babylon", 44200, "George S. Clason", "First News - Trí Việt", "09-2019", "13 x 20.5 cm", "Bìa mềm", 192, "Nhà Xuất Bản Tổng hợp TP.HCM", "1714027073396",
     
    "Trước mắt bạn, tương lai đang trải rộng con đường dẫn tới những miền đất xa xôi đầy hứa hẹn. Trên con 
     đường đó, bạn háo hức, mong muốn thực hiện nhiều ước mơ, dự định, khát khao… của riêng mình. Để những
     nguyện vọng của mình được thực hiện, ít nhất bạn phải thành công về mặt tiền bạc. Khi nói đến tiền bạc,
     chúng ta thường đề cập đến quy luật trọng trường và nó luôn phổ quát và bất biến trong mọi trường hợp.
     Trải qua thời gian dài và phát triển, quy luật này đã được trải nghiệm và đúc rút thành những bí quyết
     không chỉ đảm bảo cho bạn một túi tiền đầy, mà còn giúp cho bạn có một cuộc sống cân bằng để có thể phát
     triển mỹ mãn hơn những tiềm năng của bản thân trong các lĩnh vực khác của cuộc sống."),
    (1034, "The Magic - Phép màu", 158000, "Rhonda Byrne", "Công Ty Cổ Phần Tư Vấn & Đào Tạo Cơn Bão Triệu Phú", "03-06-2012", "20.0 x 13.0 cm", "Bìa mềm", 260, "Nhà Xuất Bản Thế Giới", "8389747336996",
     
    "Trong suốt hơn 20 thế kỷ qua, những lời dạy trong các văn bản linh thiêng cổ xưa đã khiến hầu hết mọi
     người hiểu nhầm. Chỉ có một số ít người trong lịch sử có thể nhận ra rằng nó thật ra là một câu đố, và một
     khi đã giải được ẩn ý trong câu đố ấy -  để vén bức màn bí mật - một thế giới hoàn toàn mới sẽ xuất hiện
     trước mắt bạn. Trong quyển sách phép màu, Rhonda Byrne đã tiết lộ bí mật đầy quyền năng này cho cả thế giới.
     Và sau đó, với hành trình 28 ngày nhiệm màu, cô ấy hướng dẫn chúng ta phương pháp ứng dụng kiến thức này
     vào cuộc sống thường nhật. Bất kể bạn là ai, bất kể bạn ở đâu, bất kể tình huống hiện tại của bạn là gì,
     phép màu sẽ thay đổi hoàn toàn cuộc sống của bạn!"),
    (1035, "Bí Mật Tư Duy Triệu Phú", 59800, "T.Harv Eker", "First News - Trí Việt", "06-2019", "14.5 x 20.5 cm", "Bìa mềm", 287, "Nhà Xuất Bản Tổng hợp TP.HCM", "8927700967599",
     
    "\"Ai cũng có một cuộc sống, ai cũng làm việc cần cù, ai cũng ước mơ được thành công, nhưng không mấy ai
     may mắn học được cách tư duy độc đáo và tầm nhìn của những tỷ phú lừng danh đã tiết lộ trong cuốn sách giá
     trị này\" (Wall Street Journal)
	 Trong cuốn sách này T. Harv Eker sẽ tiết lộ những bí mật tại sao một số người lại đạt được những thành
     công vượt bậc, được số phận ban cho cuộc sống sung túc, giàu có, trong khi một số người khác phải chật vật,
     vất vả mới có một cuộc sống qua ngày. Bạn sẽ hiểu được nguồn gốc sự thật và những yếu tố quyết định thành
     công, thất bại để rồi áp dụng, thay đổi cách suy nghĩ, lên kế hoạch rồi tìm ra cách làm việc, đầu tư, sử
     dụng nguồn tài chính của bạn theo hướng hiệu quả nhất."),
	(1036, "Tôi Tự Học", 40200, "Thu Giang - Nguyễn Duy Cần", "NXB Trẻ", "03-2017", "13 x 19 cm", "Bìa mềm", 262, "NXB Trẻ", "2436039693964",
     
    "Sách “Tôi tự học” của tác giả Nguyễn Duy Cần đề cập đến khái niệm, mục đích của học vấn đối với con người
     đồng thời nêu lên một số phương pháp học tập đúng đắn và hiệu quả. Tác giả cho rằng giá trị của học vấn
     nằm ở sự lĩnh hội và mở mang tri thức của con người chứ không đơn thuần thể hiện trên bằng cấp. Sách này
     tuy đã được xuất bản từ rất lâu nhưng giá trị của sách vẫn còn nguyên vẹn. Những tư tưởng, chủ đề của sách
     vẫn phù hợp và có thể áp dụng trong đời sống hiện nay. Thiết nghĩ, cuốn sách này rất cần cho mọi đối tượng
     bạn đọc vì không có giới hạn nào cho việc truy tầm kiến thức, việc học là sự nghiệp lâu dài của mỗi con
     người. Đặc biệt, cuốn sách là một tài liệu quý để các bạn học sinh – sinh viên tham khảo, tổ chức lại việc
     học của mình một cách hợp lý và khoa học. Các bậc phụ huynh cũng cần tham khảo sách này để định hướng và
     tư vấn cho con em mình trong quá trình học tập."),
    (1037, "Nuôi Con Không Phải Là Cuộc Chiến 2", 193336, "Hachun Lyonnet (Hà Chũn)", "Thái Hà", "08-2018", "14.5 x 20.5 cm", "Bìa mềm", 750, "Thái Hà", "1072987709350",
     
    "Bộ sách này là sự giải đáp cho những câu hỏi mà chúng tôi nhận được từ các bậc cha mẹ trẻ trong 5 năm 
     qua về những vấn đề của các em bé từ sơ sinh cho đến chập chững biết đi: con ăn ra sao, con ngủ bao nhiêu
     là đủ… Và bí quyết là gì để nuôi con khoẻ mạnh và khoa học nhất, để tăng thêm thành viên mới là tăng thêm
     niềm vui chứ không phải gánh nặng vất vả cho mọi người? Song hành cùng bạn, qua bộ sách này, chúng tôi cố
     gắng cung cấp đầy đủ và chi tiết hơn theo những mốc phát triển của bé cũng như lý giải những khúc mắc và
     giảm bớt những lo lắng, hoang mang không cần thiết cho những bậc ông bà - cha mẹ khi nuôi con trong những
     năm đầu đời. Chúng tôi mong rằng bộ sách này sẽ mang đến cho gia đình bạn sự an tâm, thƣ giãn và phong thái
     bình tĩnh khi nuôi và dạy bé thơ."),
    (1038, "Thiên Tài Bên Trái, Kẻ Điên Bên Phải", 89678, "Cao Minh", "Vibooks", "06-2019", "16 x 24 cm", "Bìa mềm", 424, "Nhà Xuất Bản Thế Giới", "5353759218307",
     
    "NẾU MỘT NGÀY ANH THẤY TÔI ĐIÊN, THỰC RA CHÍNH LÀ ANH ĐIÊN ĐẤY!
	 Hỡi những con người đang oằn mình trong cuộc sống, bạn biết gì về thế giới của mình? Là vô vàn thứ lý
     thuyết được các bậc vĩ nhân kiểm chứng, là luật lệ, là cả nghìn thứ sự thật bọc trong cái lốt hiển nhiên,
     hay những triết lý cứng nhắc của cuộc đời? Lại đây, vượt qua thứ nhận thức tẻ nhạt bị đóng kín bằng con
     mắt trần gian, khai mở toàn bộ suy nghĩ, để dòng máu trong bạn sục sôi trước những điều kỳ vĩ, phá vỡ mọi
     quy tắc. Thế giới sẽ gọi bạn là kẻ điên, nhưng vậy thì có sao? Ranh giới duy nhất giữa kẻ điên và thiên
     tài chẳng qua là một sợi chỉ mỏng manh: Thiên tài chứng minh được thế giới của mình, còn kẻ điên chưa kịp
     làm điều đó. Chọn trở thành một kẻ điên để vẫy vùng giữa nhân gian loạn thế hay khóa hết chúng lại, sống
     mãi một cuộc đời bình thường khiến bạn cảm thấy hạnh phúc hơn? Chào mừng đến với thế giới của những kẻ điên."),
    (1039, "Hiểu Về Trái Tim", 106038, "Minh Niệm", "First News - Trí Việt", "11-2019", "13 x 20.5 cm", "Bìa mềm", 480, "Nhà Xuất Bản Tổng Hợp", "3098193178849",
     
    "Hiểu Về Trái Tim – Cuốn Sách Mở Cửa Thề Giới Cảm Xúc Của Mỗi Người
	 Xuất bản lần đầu tiên vào năm 2011, Hiểu Về Trái Tim trình làng cũng lúc với kỷ lục: cuốn sách có số lượng
     in lần đầu lớn nhất: 100.000 bản. Trung tâm sách kỷ lục Việt Nam công nhận kỳ tích ấy nhưng đến nay, con
     số phát hành của Hiểu về trái tim vẫn chưa có dấu hiệu chậm lại. Là tác phẩm đầu tay của nhà sư Minh Niệm,
     người sáng lập dòng thiền hiểu biết (Understanding Meditation), kết hợp giữa tư tưởng Phật giáo Đại thừa
     và Thiền nguyên thủy Vipassana, nhưng Hiểu Về Trái Tim không phải tác phẩm thuyết giáo về Phật pháp. Cuốn
     sách rất “đời” với những ưu tư của một người tu nhìn về cõi thế. Ở đó, có hạnh phúc, có đau khổ, có tình
     yêu, có cô đơn, có tuyệt vọng, có lười biếng, có yếu đuối, có buông xả… Nhưng, tất cả những hỉ nộ ái ố ấy
     đều được khoác lên tấm áo mới, một tấm áo tinh khiết và xuyên suốt, khiến người đọc khi nhìn vào, đều thấy
     mọi sự như nhẹ nhàng hơn…"),
    (1040, "Tuổi Trẻ Đáng Giá Bao Nhiêu", 40000, "Rosie Nguyễn", "Nhã Nam", "01-2018", "14 x 20.5 cm", "Bìa mềm", 285, "Nhã Nam", "6911225907262",
     
    "\"Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ. Bạn trải qua những ngày
     tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng. Bạn có chết mòn nơi xó tường với
     những ước mơ dang dở, đó không phải là việc của họ. Suy cho cùng, quyết định là ở bạn. Muốn có điều gì
     hay không là tùy bạn. Nên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách
     bạn cho là mình nên sống. Vì sau tất cả, chẳng ai quan tâm. Hãy đọc sách, nếu bạn đọc sách một cách bền bỉ,
     sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình. Nếu tôi còn ở tuổi
     đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.\""),
    (1041, "Mắt Biếc", 70900, "Nguyễn Nhật Ánh", "NXB Trẻ", "07-2019", "13 x 20 cm", "Bìa mềm", 300, "NXB Trẻ", "3357672088223",
     
    "Mắt biếc là một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn Nguyễn Nhật Ánh. Tác phẩm
     này cũng đã được dịch giả Kato Sakae dịch sang tiếng Nhật để giới thiệu với độc giả Nhật Bản. “Tôi gửi
     tình yêu cho mùa hè, nhưng mùa hè không giữ nổi. Mùa hè chỉ biết ra hoa, phượng đỏ sân trường và tiếng ve
     nỉ non trong lá. Mùa hè ngây ngô, giống như tôi vậy. Nó chẳng làm được những điều tôi ký thác. Nó để Hà
     Lan đốt tôi, đốt rụi. Trái tim tôi cháy thành tro, rơi vãi trên đường về.” … Bởi sự trong sáng của một tình
     cảm, bởi cái kết thúc buồn, rất buồn khi xuyên suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn …  "),
    (1042, "7 Thói Quen Hiệu Quả", 98070, "Stephen R. Covey", "Viện Quản Lý P.A.C.E", "2019", "15 x 23 cm", "Bìa cứng", 480, "Nhà Xuất Bản Tổng hợp TP.HCM", "3142996434111",
     
    "Mơ ước của hầu hết mọi người trong đời là trở thành một con người thành công và hạnh phúc bằng chính tài
     năng và đạo đức của mình. Ở bình diện tổ chức hay các quốc gia cũng vậy. Một tổ chức hay quốc gia càng có
     nhiều người hướng đến thành công bằng tài năng và đạo đức, tổ chức hay quốc gia đó càng có cơ hội phát
     triển thịnh vượng và văn minh. Stephen Covey từng nói rằng, ông không phát minh hay tạo ra mà được đưa ra
     dựa trên những giá trị phổ quát và những nguyên tắc trường tồn của nhân loại. Chính trong thái độ khiêm
     nhường đó, ta nhận ra tầm vóc của ông. Vì ông đã tạo ra một cầu nối giữa chúng ta với những tri thức tinh
     hoa của nhân loại về làm người, về giá trị sống, và nhất là về tính hiệu quả."),
    (1043, "Trở Về Từ Cõi Sáng", 57200, "Nguyên Phong", "First News - Trí Việt", "11-2019", "14 x 20.5 cm", "Bìa mềm", 208, "Nhà Xuất Bản Tổng Hợp", "6255139811346",
     
    "Xuất bản lần đầu năm 1992, nó đã trở nên một “best seller” với số bản kỷ lục và dẫn đầu những cuốn sách
     bán chạy nhất Hoa Kỳ. Bắt đầu từ tháng 2 năm 1994, nó trở nên cuốn sách bán chạy nhất thế giới với mười
     tám ấn bản bằng các thứ tiếng khác nhau. Trong ấn bản đầu tại Âu châu, nhiều độc giả đã phải mua giá chợ
     đen vì nhà xuất bản in không kịp. Tại Nhật Bản, những người không muốn chờ đợi, đã xếp hàng để mua trước
     cửa nhà in, không đợi sách giao đến tiệm nữ Tại sao cuốn sách này lại bán chạy như vậy? Theo các nhà bình
     luận thì không những nội dung cuốn này phong phú hơn nhiều cuốn sách tương tự mà tác giả, bà Betty Eadie,
     đã kinh nghiệm được sự chết và kể lại những diễn tiến ở cõi bên kia, mà bà ta gọi là cõi sáng, một cách
     chi tiết rõ ràng."),
    (1044, "Ba Người Thầy Vĩ Đại", 59739, "Robin Sharma", "Thái Hà", "10-2019", "14.5 x 20.5 cm", "Bìa mềm", 330, "Nhà Xuất Bản Lao Động", "4152923930455",
     
    "“Tôi đã nếm trải nhiều thất bại trong hành trình đi qua những tháng ngày của mình. Thế nhưng, mỗi chướng
     ngại cuối cùng đều lại chính là một bàn đạp đưa tôi gần hơn nữa tới chân lý trong tâm khảm và cuộc đời tốt
     đẹp nhất của mình. Cho dù tôi có thu thập được bao nhiêu tài sản vật chất đi chăng nữa thì cái thằng người
     mà tôi nhìn thấy trong tấm gương phòng tắm mỗi buổi sáng vẫn y nguyên – tôi không hề hạnh phúc hơn và không
     hề cảm thấy tốt hơn tí nào. Suy ngẫm nhiều hơn về thực trạng cuộc sống của mình, tôi bắt đầu nhận thức được
     sự trống rỗng ngay trong tim mình. Tôi bắt đầu chú ý đến những tiếng thầm thì lặng lẽ của con tim, những
     điều chỉ dẫn tôi rời bỏ nghề nghiệp mình đã chọn và bắt đầu quá trình tìm kiếm tâm hồn một cách nghiêm túc.”"),
    (1045, "Đắc Nhân Tâm (Bìa Cứng)", 63700, "Dale Carnegie", "First News - Trí Việt", "10-2016", "13 x 20.5 cm", "Bìa cứng", 320, "Nhà Xuất Bản Tổng hợp TP.HCM", "2434578841471",
     
    "Đắc Nhân Tâm không chỉ là là nghệ thuật thu phục lòng người, Đắc Nhân Tâm còn đem lại cho độc giả góc
     nhìn, suy nghĩ sâu sắc về việc giao tiếp ứng xử. Triết lý của Đắc Nhân Tâm là hiểu mình, thành thật với
     chính mình, từ đó hiểu biết và quan tâm đến những người xung quanh để nhìn ra và khơi gợi những tiềm năng
     ẩn khuất nơi họ, giúp họ phát triển lên một tầm cao mới. Đây chính là nghệ thuật cao nhất về con người và
     chính là ý nghĩa sâu sắc nhất đúc kết từ những nguyên tắc vàng của Dale Carnegie. Đây là phiên bản Đắc Nhân
     Tâm đặc biệt, bìa cứng dày 320 trang, do First News thực hiện và Nhà xuất bản Tổng hợp TP.HCM ấn hành."),
    (1046, "Công Phá Toán 3", 179000, "Ngọc Huyền LB", "Công ty CP Giáo dục Trực tuyến Việt Nam", "09-2018", "27 x 19 cm", "Bìa mềm", 622, "Nhà Xuất Bản Đại Học Quốc Gia Hà Nội", "2483702920506",
     
    "Công Phá Toán 3 giúp các em học sinh nắm chắc tư duy giải nhanh các dạng toán 12 và thâu tóm toàn bộ bài
     tập chọn lọc bài tập từ 200 đề thi thử mới nhất. Tác giả là sinh viên có những thành tích cao trong học tập
     và cũng chính nhiệt huyết của tuổi trẻ đã mang đến cho bạn đọc những kinh nghiệm của bản thân, chia sẻ tri
     thức, phần nào giúp các em học sinh hiện nay tự tin hơn khi luyện thi môn Toán. Với tâm thái đó, tác giả
     dễ dàng nắm bắt tâm lí học tập và lối tư duy của các em để biên soạn nên cuốn sách này với những phương
     pháp và kĩ năng làm bài dễ hiểu và dễ áp dụng, tối ưu hóa được thời gian khi làm bài."),
    (1047, "Kiếp Nào Ta Cũng Tìm Thấy Nhau", 53550, "Brian L. Weiss", "Thái Hà", "01-2019", "14 x 20.5 cm", "Bìa mềm", 290, "Thái Hà", "3404609064772", 
     
    "Kiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng.
     Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có
     thật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc
     đời tác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang
     hơn 20 ngôn ngữ. Cuốn sách thứ hai Through  Time  into  Healing (Đi  qua  thời  gian  để chữa lành), mô tả
     những gì tác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều
     là những câu chuyện người thật việc thật. Nhưng  câu  chuyện  hấp  dẫn  nhất lại  nằm  trong cuốn sách thứ
     ba. Định  mệnh  sẽ dẫn  lối cho  những  linh  hồn tri  kỷ hội ngộ."),
    (1048, "25 Chuyên Đề Ngữ Pháp Tiếng Anh Trọng Tâm", 66000, "Trang Anh", "Huy Hoang Bookstore", "08-2018", "19 x 26.5 cm", "Bìa mềm", 300, "Nhà Xuất Bản Đại Học Sư Phạm", "7318148417400",
     
    "Các chuyên đề ngữ pháp trọng tâm được trình bày đơn giản, dễ hiểu cùng với hệ thống bài tập và từ vựng
     phong phú. Có tất cả 25 chuyên đề trong 2 tập sách, là tài liệu hữu ích cho học sinh, sinh viên, người đi
     làm, luyện thi cho các kỳ thi quốc gia, ôn luyện các chứng chỉ quốc tế và là tài liệu tham khảo cho giáo
     viên. Huy Hoàng Bookstore hân hạnh giới thiệu!"),
    (1049, "Tư Duy Nhanh Và Chậm", 155219, "Daniel Kahneman", "Alphabooks", "09-2019", "16 x 24 cm", "Bìa mềm", 612, "Nhà Xuất Bản Thế Giới", "2423892333830",
     
    "Chúng ta thường tự cho rằng con người là sinh vật có lý trí mạnh mẽ, khi quyết định hay đánh giá vấn đề
     luôn kĩ lưỡng và lý tính. Nhưng sự thật là, dù bạn có cẩn trọng tới mức nào, thì trong cuộc sống hàng ngày
     hay trong vấn đề liên quan đến kinh tế, bạn vẫn có những quyết định dựa trên cảm tính chủ quan  của mình.
     “Tư duy nhanh và chậm”, cuốn sách nổi tiếng tổng hợp tất cả nghiên cứu được tiến hành qua nhiều thập kỷ
     của nhà tâm lý học từng đạt giải Nobel Kinh tế Daniel Kahneman sẽ cho bạn thấy những sư hợp lý và phi lý
     trong tư duy của chính bạn. Cuốn sách được đánh giá là “kiệt tác” trong việc thay đổi hành vi của con người,
     Tư duy nhanh và chậm đã dành được vô số giải thưởng danh giá, lọt vào Top 11 cuốn sách kinh doanh hấp dẫn
     nhất năm 2011."),
    (1050, "Khi Hơi Thở Hóa Thinh Không", 70850, "Paul Kalanithi", "Omega Plus", "07-2017", "14 x 20.5 cm", "Bìa mềm", 236, "Nhà Xuất Bản Lao Động", "2506010458896",
     
    "Khi Hơi Thở Hóa Thinh Không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này,
     tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi
     phát hiện ra mình bị ung thư và phải điều trị lâu dài. Kalanithi rất yêu thích văn chương nên câu chuyện
     của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm
     về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi
     thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật
     não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong
     đời."),
    (1051, "Ai Ở Sau Lưng Bạn Thế", 113100, "Toshio Fukuda", "Quảng Văn", "08-2017", "20 x 20 cm", "Bìa mềm", 120, "Nhà Xuất Bản Phụ Nữ", "2529125091833",
     
    "Combo Ehon Nhật Bản Ai Ở Sau Lưng Bạn Thế: Dành Cho Trẻ Từ 0 - 3 Tuổi
	 Ehon là dòng sách được ví như “thực phẩm cho tâm hồn bé” tại Nhật. Đây là dòng sách tranh cho lứa tuổi từ
     0 tới 10. Mỗi cuốn sách là một câu chuyện ngắn, với cấu trúc rõ ràng. Mỗi trang chỉ gồm một tới hai câu
     ngắn phù hợp với khả năng ngôn ngữ của trẻ. Nội dung và nhân vật trong sách là những sự vật, hiện tượng
     gần gũi trong cuộc sống hàng ngày của các bé như ăn, ngủ, chơi đùa, các loài động, thực vật. Cha mẹ đọc
     ehon thường ngày với con, như cách trò chuyện, thể hiện tình yêu thương và giáo dục con. Sách ehon chứa
     đựng nhiều bài học giúp bé phát triển ngôn ngữ, trí tưởng tượng, nuôi dưỡng nhân cách, làm phong phú tâm
     hồn con."),
    (1052, "Truyện Tranh Song Ngữ Việt - Anh Cho Bé", 144000, "Sirilak Rattanasuwaj", "Đinh Tị", "02-2020", "14.5 x 20.5 cm", "Bìa mềm", 360, "Nhà Xuất Bản Phụ Nữ", "4930791676893",
     
    "Theo đa số các nghiên cứu khoa học, dạy ngoại ngữ cho trẻ em từ khi còn nhỏ tuổi mang đến rất nhiều lợi ích:
     1. Tư duy phóng khoáng và sẵn sàng tiếp thu điều mới mẻ
	 2. Cơ hội nghề nghiệp tốt hơn trong tương lai
	 3. Dễ dàng hơn khi học những ngôn ngữ khác trong giai đoạn sau này của cuộc đời
	 4. Được hưởng sự giáo dục văn hóa đa dạng hơn (với văn học, phim ảnh, âm nhạc…)
	 5. Khả năng tập trung cao hơn
	 6. Khả biến thần kinh (giúp thông minh hơn)
	 7. Làm chậm lại sự khởi phát bệnh Alzheimer so với những người chỉ dùng một ngôn ngữ…
	 Bộ Truyện tranh song ngữ Việt-Anh cho bé gồm 12 tập là 12 câu chuyện được kể bằng tiếng Việt và tiếng Anh.
     Mỗi câu chuyện không chỉ mang đến những giờ phút giải trí vui vẻ, mà còn chứa đựng bài học bổ ích,
     khuyến khích các bé phát triển lối sống lành mạnh, có trách nhiệm, và giúp cải thiện vốn từ vựng tiếng Anh.
     Đây chắc chắn sẽ là món quà tuyệt vời để các bậc cha mẹ dành tặng cho những “nhà ngôn ngữ học bé nhỏ” của mình."),
	(1053, "Khởi Nghiệp Bán Lẻ", 99000,  "Trần Thanh Phong", "Nhà Xuất Bản Đà Nẵng", "2019", "14 x 20.5 cm", "Bìa mềm", 272, "Nhà Xuất Bản Đà Nẵng", "2142434979274",
     
    "Bạn sẽ tìm thấy trong quyển sách: Cách đơn giản để tìm kiếm ý tưởng kinh doanh và huy động vốn để khởi
     nghiệp. Phương pháp phân tích nhu cầu khách hàng và đề ra mô hình kinh doanh chuẩn xác. 10 tiêu chí cốt
     lõi để lựa chọn mặt bằng kinh doanh & 10 kinh nghiệm để thiết kế cửa hàng vừa thu hút vừa tiết kiệm đến
     70% chi phí. Đặc biệt nhất là 7 bí quyết nhà nghề độc đáo được trình bày từ dễ đến khó để bạn có ngay một
     cửa hàng lúc nào cũng đông khách! Và nhiều kinh nghiệm quý giá khác, đã và đang được áp dụng tại chính các
     cửa hàng của tác giả. Quyển sách này dành cho: Các bạn đang kinh doanh online và cửa hàng offline. Các chủ
     shop muốn nâng cao hiệu quả hoạt động của cửa hàng. Nhà sản xuất muốn mở showroom bán sản phẩm của mình. 
	 Hay bất kỳ ai yêu thích kinh doanh và ấp ủ giấc mơ làm giàu bền vững. Khởi Nghiệp Bán Lẻ là quyển sách
     không thể thiếu cho những ai muốn quản lý cửa hàng và làm giàu bằng ngành bán lẻ."),
    (1054, "Giáo Trình Hán Ngữ 1 - Tập 1 - Quyển Thượng", 49934, "Nhiều Tác Giả", "MCBOOKS", "2019", "19 x 27 cm", "Bìa mềm", 179, "Nhà Xuất Bản Hồng Đức", "7472621916511",
     
    "Bạn là người mới bắt đầu học tiếng Trung, bạn không biết nên tự học như thế nào? Trong khi tiếng Việt và
     tiếng Anh được viết bằng chữ cái Latinh thì tiếng Trung được viết bằng chữ tượng hình nên rất khó khi bạn
     tự tìm hiểu ngôn ngữ này. Bạn là người mới bắt đầu học tiếng Trung, bạn muốn tự học nhưng không biết nên
     học những kiến thức nào, đâu là những kiến thức nền tảng phù hợp với trình độ của những người mới học. Và
     quan trọng nhất là bạn không biết được nên tìm học từ những tài liệu nào. Trên thị trường tài liệu học
     tiếng Trung thì nhiều nhưng tài liệu vừa bám sát chương trình dạy học, vừa cập nhật những điểm đổi mới
     cùng như được biên soạn dễ hiểu thì lại rất ít."),
    (1055, "Tĩnh Lặng", 37170, "Thích Nhất Hạnh", "Thái Hà", "09-2017", "13 x 20,5 cm", "Bìa mềm", 187, "Nhà Xuất Bản Thế Giới", "2413482944133",
     
    "Còn sống và bước đi trên mặt đất này là một phép lạ, nhưng hầu hết chúng ta lại chạy đi tìm hạnh phúc ở
     một nơi xa xôi nào đó như thể là có một nơi tốt đẹp hơn để đến vậy. Chúng ta mất rất nhiều thời gian để đi
     tìm hạnh phúc trong khi đó thế giới quanh ta tràn đầy những mầu nhiệm. Những vẻ đẹp của đất trời đang gọi
     ta từng ngày, từng giờ nhưng hiếm khi ta nghe được. Điều kiện căn bản để chúng ta có thể nghe và đáp lại
     những tiếng gọi ấy là sự Tĩnh Lặng. Nếu không có sự tĩnh lặng trong tự thân, nếu thân tâm ta đầy sự ồn ào,
     náo loạn thì ta không thể nghe được tiếng gọi của vẻ đẹp ấy. Có một đài radio đang hoạt động trong đầu ta,
     đó là đài NST (Non Stop Thinking) - đài suy nghĩ liên tục không ngừng. Tâm ta đầy tiếng ồn) vì vậy ta không
     thể nghe được tiếng gọi của sự sống, tiếng gọi của tình thương. Trái tim ta đang gọi ta mà ta không nghe 
     thấy. Ta không có thời gian để lắng nghe trái tim mình."),
    (1056, "Combo 999 Lá Thư Gửi Cho Chính Mình", 183500, "Miêu Công Tử", "Skybooks", "01-2019", "12,5 x 18 cm", "Bìa mềm", 339, "Nhà Xuất Bản Thanh Niên", "5115142464018", 
     
    "“999 lá thư gửi cho chính mình” là một tác phẩm đặc biệt đầy cảm hứng đến từ tác giả văn học mạng nổi
     tiếng Miêu Công Tử, mang một màu sắc riêng biệt qua những lời thư nhỏ nhắn nhủ đến người đọc về giá trị
     cuộc sống, tình yêu, tuổi trẻ, tương lai… đã làm lay động trái tim của hàng vạn độc giả trẻ. Cầm trên tay
     cuốn sách “999 lá thư gửi cho chính mình” – bạn sẽ hiểu rằng: tuổi trẻ của chúng ta dù có mong manh đến đâu
     thì cũng sẽ thành công vượt qua mọi khó khăn một cách mạnh mẽ ngoài sức tưởng tượng. Một ngày nào đó, bạn
     sẽ cảm nhận được hạnh phúc, tự tin của chính bản thân và học được cách mỉm cười trước những nỗi đau của quá
     khứ. Bạn sẽ biết cách nói lời cảm ơn với những ai đã rời bỏ bạn, hiểu ra rằng họ không phải người thích hợp
     để cùng đồng hành với bạn trên đoạn đường chông gai đi tới tương lai."),
    (1057, "Payback Time - Ngày Đòi Nợ", 299000, "Phil Town", "HappyLive", "08-2017", "16 x 24 cm", "Bìa cứng", 284, "Nhà Xuất Bản Văn Hóa - Văn Nghệ", "9869859661067",
     
    "NGÀY ĐÒI NỢ – Payback Time là cuốn sách bán chạy nhất New York Time được tác giả Phil Town sử dụng những
     ngôn ngữ đơn giản, dễ hiểu và lồng ghép những ví dụ thực tế giúp cho người đọc tiếp cận với những kiến
     thức về đầu tư chứng khoán một cách dễ dàng. Bên cạnh đó với những kiến thức và trải nghiệm của bản thân,
     chúng tôi đã đưa cuốn sách gần gũi hơn với bạn đọc Việt Nam. “Một cuộc sống hạnh phúc được bắt đầu từ
     những quyết định đầu tư khôn ngoan”. Ngay ngày hôm nay, hãy bắt đầu quyết định đầu tư khôn ngoan của bạn
     bằng việc trang bị một hệ thống và phương pháp đầu tư hoàn chỉnh đã được chứng minh hiệu quả tuyệt đối qua
     thời gian được trình bày trong cuốn sách này. Bởi vì: Kiếm một số tiền lớn từ đầu tư chứng khoán chính là
     cách “trả thù” tốt nhất cho tương lai tài chính của bạn vốn đã bị cướp đi trước đây."),
    (1058, "Không Bao Giờ Là Thất Bại! Tất Cả Là Thử Thách", 63589, "Chung Ju Yung", "First News - Trí Việt", "04-2019", "14.5 x 20.5 cm", "Bìa mềm", 352, "Nhà Xuất Bản Tổng hợp TP.HCM", "9772375148991", 
     
    "“Không bao giờ là thất bại! Tất cả là thử thách” thuật lại chi tiết cuộc đời và sự nghiệp của Chung Ju
     Yung - cố chủ tịch tập đoàn Huyndai. Không chỉ kể lại hành trình và kinh nghiệm của người sáng lập nên một
     trong những thương hiệu nổi tiếng nhất thế giới mà còn chứa đựng những bài học ấn tượng về quản trị, kinh
     doanh cũng như đạo làm người, đây là quyển sách gối đầu giường của rất nhiều thế hệ doanh nhân. Qua lời kể
     của Chung Ju Yung, người đọc sẽ hiểu được tuổi thơ nghèo khó và khát khao làm giàu của cố chủ tịch tập đoàn
     Huyndai. Ba lần trốn chạy khỏi gia đình, khỏi đồng quê để có thể bước chân vào thương trường, ông gây dựng
     cơ nghiệp từ kẻ không một xu dính túi. Kinh doanh dịch vụ sửa chữa ôtô, sau đó bước vào thị trường với việc
     sản xuất xe hơi rồi lại mở rộng lĩnh vực sang xây dựng nhà ở, cầu đường, đóng tàu…, con đường vươn đến thành
     công của ông hoàn toàn không có màu hồng."),
    (1059, "90% Trẻ Thông Minh Nhờ Cách Trò Chuyện Đúng Đắn Của Cha Mẹ", 33150, "Urako Kanamori", "Nhà Xuất Bản Kim Đồng", "08-2018", "13 x 19 cm", "Bìa mềm", 176, "Nhà Xuất Bản Kim Đồng", "2070069826819", 
     
    "Bạn có bao giờ thốt ra những câu dù biết là không nên nói như  “Còn lề mề đến bao giờ nữa hả?” hay
     “Chẳng được cái trò trống gì, đưa đây xem nào!”… nhưng vẫn lỡ lời không? Trong quá trình trẻ trưởng thành,
     những lời lẽ kiểu “Mày chẳng được cái tích sự gì!” trẻ phải nghe ngày ngày sẽ thẩm thấu qua vô thức, rồi
     sau đó trở thành ý thức coi mình chỉ là loại “vô dụng”. Không biết từ lúc nào, trẻ sẽ bắt đầu thực hiện
     những hành vi, lối sống không tốt. Trong cuốn sách này, chúng tôi sẽ giới thiệu tới quý vị phụ huynh những
     câu nói “có phép lạ” khiến các con trở thành những đứa trẻ “tự có ý thức” mà cha mẹ không cần cằn nhằn
     nhiều. Hơn nữa, đây hoàn toàn là những câu chúng ta có thể áp dụng ngay từ ngày hôm nay như “Mẹ luôn đứng
     về phía con!”, “Mẹ con mình cùng làm nhé!”… "),
    (1060, "Lối Sống Tối Giản Của Người Nhật", 59889, "Sasaki Fumio", "Thái Hà", "06-2018", "13 x 20.5 cm", "Bìa mềm", 294, "Nhà Xuất Bản Lao Động", "9780512479372",
     
    "Lối sống tối giản là cách sống cắt giảm vật dụng xuống còn mức tối thiểu. Và cùng với cuộc sống ít đồ đạc,
     ta có thể để tâm nhiều hơn tới hạnh phúc, đó chính là chủ đề của cuốn sách này. Chẳng có ai từ khi sinh ra
     đã có tài sản, đồ đạc gì trong tay. Vậy nên bất cứ ai khi mới chào đời đều là những người sống tối giản.
     Cứ mỗi lần bạn sở hữu trong tay những đồ dùng hơn mức cần thiết là một lần bạn lấy mất tự do của chính mình.
     Giá trị bản thân chúng ta không đo bằng những đồ dùng mà chúng ta sở hữu. Những đồ dùng này chỉ cho chúng
     ta một chút cảm giác hạnh phúc nhất thời mà thôi. Mang theo những đồ dùng hơn mức cần thiết sẽ lấy hết thời
     gian, năng lượng của bạn. Khi nhận ra được điều đó, tức là bạn đã bắt đầu trở thành một người sống tối giản."),
    (1061, "Chiến Thắng Con Quỷ Trong Bạn", 54180, "Napoleon Hill", "Thái Hà", "02-2018", "15.5 x 24cm", "Bìa mềm", 293, "Nhà Xuất Bản Lao Động", "8659974846972",
     
    "Cuốn sách là cuộc trò chuyện của Napoleon Hill và Con Quỷ. Sau bao nhiêu năm miệt mài nghiên cứu cuối
     cùng ông cũng phát hiện ra Con Quỷ, bắt nó phải thú tội và tiết lộ những sự thật kinh hoàng về nơi nó
     sống, cách nó kiểm soát tâm trí con người và cách để con người chiến thắng được nó. Khi đọc cuốn sách này,
     có thể bạn sẽ tự hỏi, cuộc trò chuyện này có thật không? Con Quỷ là có thật hay là một sản phẩm của trí
     tưởng tượng của Napoleon Hill. Nhưng quyền lựa chọn cách hiểu vấn đề là của bạn. Bởi lẽ cuối cùng, thông
     qua cuộc trò chuyện với Con Quỷ, Napoleon Hill đã cung cấp cho chúng ta chìa khóa để chiến thắng Con Quỷ
     trong cuộc sống riêng của mỗi người. Hãy tận hưởng cuốn sách kỳ diệu này và chia sẻ nó với gia đình, bạn bè.
     Sức mạnh trong ngôn từ của Napoleon Hill có thể và sẽ thay đổi cuộc đời bạn."),
    (1062, "Bước Chậm Lại Giữa Thế Gian Vội Vã", 42500, "Hae Min", "Nhã Nam", "2012", "14 x 20.5cm", "Bìa mềm", 256, "Nhà Xuất Bản Hội Nhà Văn", "8788183623224",
     
    "Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc
     tan sở, quay cuồng với thi cử và tiến độ công việc, lu bù vướng mắc trong những mối quan hệ cả thân lẫn sơ…
     bạn có luôn cảm thấy thế gian xung quanh mình đang xoay chuyển quá vội vàng? Nếu có thể, hãy tạm dừng một
     bước. Để tự hỏi, là do thế gian này vội vàng hay do chính tâm trí bạn đang quá bận rộn? Để cầm cuốn sách
     nhỏ dung dị mà lắng đọng này lên, chậm rãi lật giở từng trang, thong thả khám phá những điều mà chỉ khi
     bước chậm lại mới có thể thấu rõ: về các mối quan hệ, về chính bản thân mình, về những trăn trở trước cuộc
     đời và nhân thế, về bao điều lý trí rất hiểu nhưng trái tim chưa cách nào nghe theo…"),
    (1063, "Hoàng Tử Bé", 37500, "Antoine De Saint-Exupéry", "Nhã Nam", "05-2019", "15 x 23 cm", "Bìa mềm", 102, "Nhà Xuất Bản Hội Nhà Văn", "4933955346595",
     
    "Hoàng tử bé được viết ở New York trong những ngày tác giả sống lưu vong và được xuất bản lần đầu tiên
     tại New York vào năm 1943, rồi đến năm 1946 mới được xuất bản tại Pháp. Không nghi ngờ gì, đây là tác
     phẩm nổi tiếng nhất, được đọc nhiều nhất và cũng được yêu mến nhất của Saint-Exupéry. Cuốn sách được bình
     chọn là tác phẩm hay nhất thế kỉ 20 ở Pháp, đồng thời cũng là cuốn sách Pháp được dịch và được đọc nhiều
     nhất trên thế giới. Với 250 ngôn ngữ dịch khác nhau kể cả phương ngữ cùng hơn 200 triệu bản in trên toàn
     thế giới, Hoàng tử bé được coi là một trong những tác phẩm bán chạy nhất của nhân loại. Tôi cứ sống cô độc
     như vậy, chẳng có một ai để chuyện trò thật sự, cho tới một lần gặp nạn ở sa mạc Sahara cách đây sáu năm.
     Có thứ gì đó bị vỡ trong động cơ máy bay."),
    (1064, "Ngữ Pháp Tiếng Anh Bằng Sơ Đồ Tư Duy", 123500, "Đỗ Nhung", "MCBOOKS", "2019", "17 X 24 cm", "Bìa mềm", 292, "Nhà Xuất Bản Hồng Đức", "6311429831712",
     
    "Làm cách nào để nâng cao trình độ? Học thế nào để nhớ nhanh, ngấm lâu? Sơ đồ tư duy được mệnh danh là
     CÔNG CỤ VẠN NĂNG CHO BỘ NÃO - một phương pháp trình bày ý tưởng, kiến thức bằng những từ khóa chính,
     hình ảnh và màu sắc, giúp não bộ phát huy tối đa khả năng ghi nhớ. Phương pháp này hiện nay được hơn 250
     triệu người trên thế giới sử dụng, đã và đang đem lại những hiệu quả thực sự nhất là ngữ pháp tiếng Anh
     bởi: Giúp bạn nắm được bức tranh toàn cảnh của chủ để nghiên cứu. Phương pháp ghi nhớ tối ưu hiệu quả,
     tăng khả năng tập trung khi học. Cải thiện khả năng khai thác chi tiết thông tin , giải quyết triệt để quá
     tải dữ liệu"),
    (1065, "Quẳng Gánh Lo Đi Và Vui Sống", 49289, "Dale Carnegie", "First News - Trí Việt", "06-2016", "14.5 x 20.5 cm", "Bìa mềm", 311, "Nhà Xuất Bản Tổng hợp TP.HCM", "2435025517116",
     
    "Quẳng Gánh Lo Đi Và Vui Sống là cuốn sách mà cái tên đã nói lên tất cả nội dung chuyển tải trên những
     trang giấy. Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn,
     chuyện nhà cửa,...Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn
     có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại
     để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình
     tĩnh và xác định đúng hành động cần làm vào đúng thời điểm."),
    (1066, "Cho Tôi Xin Một Vé Đi Tuổi Thơ", 52000, "Nguyễn Nhật Ánh", "NXB Trẻ", "11-2018", "13 x 20 cm", "Bìa mềm", 208, "NXB Trẻ", "8494814360139",
     
    "Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người
     đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ
     thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong
     lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc
     trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình."),
    (1067, "Dạy Con Làm Giàu (Tập 2)", 77889, "Robert T. Kiyosaki", "NXB Trẻ", "02-2020", "14 x 20 cm", "Bìa mềm", 414, "NXB Trẻ", "3249916228475",
     
    "Bạn đang đi học? Bạn vừa ra trường và chưa có việc làm? Bạn đang làm việc với mức lương ổn định? Bạn
     đang làm cho một công ty tư nhân tư nhân? Bạn là một chủ doanh nghiệp nhỏ? Bạn muốn được thoải mái về
     tiền bạc? Dạy con làm giàu tập 2 sẽ là bước khởi đầu cho bạn - những quan điểm mới về đồng vốn và cách sử 
     dụng tiền hiệu quả."),
    (1068, "Sherlock Holmes Toàn Tập", 150000, "Sir Arthur Conan Doyle", "Khang Việt Book", "09-2016", "16 x 24 cm", "Bìa cứng", 999, "Nhà Xuất Bản Hội Nhà Văn", "2513857681493",
     
    "Cái tên Sherlock Holmes đã quen thuộc khắp thế giới tới mức một người dù có thể chưa hề đọc truyện về
     nhà thám tử này nhưng chỉ cần nghe tên cũng biết anh ta là ai. Sherlock Holmes đã trở thành một biểu tượng
     của văn hóa đại chúng toàn cầu. Khác với những nhân vật thần tượng chỉ vang bóng một thời, Sherlock Holmes
     kể từ khi xuất hiện lần đầu tiên năm 1887 qua sáng tạo của Sir Arthur Conan Doyle vẫn sống mãi qua ba thế
     kỉ. Sherlock Holmes hiện lên qua lời kể của cộng sự thân thiết và người viết tiểu sử tận tụy - bác sĩ
     Watson như một chân dung độc đáo, là chuyên gia số một trong lĩnh vực điều tra hình sự và khoa học suy
     luận, \"chiến sĩ bảo vệ công lí lỗi lạc nhất\" của thời đại."),
    (1069, "Khí Chất Bao Nhiêu, Hạnh Phúc Bấy Nhiêu", 89250, "Vãn Tình", "Bloom Books", "08-2018", "14.5 x 20cm", "Bìa mềm", 376, "Nhà Xuất Bản Thế Giới", "6003219409958",
     
    "Có ai đó từng nói: “Hãy sống như một trái dứa: Đầu đội vương miện, dáng đứng hiên ngang – Bên ngoài gai
     góc, bên trong ngọt ngào.” Cũng giống như trái dứa, khi một người phụ nữ đủ bản lĩnh để chống đỡ và vượt
     qua nghịch cảnh, đủ tĩnh tại để tận hưởng trọn vẹn niềm vui cuộc sống, thì đó chính là lúc họ đội lên đầu
     chiếc vương miện và trở thành nữ hoàng trong thế giới của chính mình. Tiếp nối thành công từ Bạn đắt giá
     bao nhiêu? dành cho các cô gái trẻ mới bước chân vào cuộc sống, Khí chất bao nhiêu – Hạnh phúc bấy nhiêu
     của Vãn Tình đặc biệt hướng đến những phụ nữ mong muốn trưởng thành, khát khao tự do và tự chủ. Cuốn sách
     mới nhất này của Vãn Tình đã đạp đổ các quan điểm như: Lấy chồng tốt để đổi đời, sức mạnh của phụ nữ là độc
     lập kinh tế, hoặc phụ nữ sợ ly hôn hơn đàn ông,..."),
    (1070, "Vị Tu Sĩ Bán Chiếc Ferrari", 54489, "Robin Sharma", "First News - Trí Việt", "12-2018", "14.5 x 20 cm", "Bìa mềm", 308, "Nhà Xuất Bản Tổng hợp TP.HCM", "5232171286791",
     
    "VỊ Tu Sĩ Bán Chiếc FERRARI không phải là một cuốn sách xa lạ, cuốn sách này là một trong những ấn phẩm
     kinh điển của thế giới về đề tài truyền cảm hứng, theo đuổi lý tưởng sống, và hướng về một cuộc sống hạnh
     phúc. Đây cũng là cuốn sách đầu tiên mà tác giả, nhà diễn thuyết nổi tiếng thế giới Robin Sharma chấp bút.
	 Cuốn sách gây được tiếng vang khi xuất bản năm 1997 và bán được hơn 3 triệu bản vào năm 2013. “Vị tu sĩ bán
     chiếc Ferrari” là một câu chuyện đầy cảm hứng cung cấp bạn đọc cách sống can đảm, cân bằng, phong phú và
     nhiều niềm vui hơn. Hấp dẫn, lôi cuốn với rất nhiều bài học, “Vị tu sĩ bán chiếc Ferrari” là món quà cho
     bất cứ ai muốn chinh phục ước mơ của mình."),
    (1071, "Tìm Mình Trong Thế Giới Hậu Tuổi Thơ", 78100, "Đặng Hoàng Giang", "Nhã Nam", "01-2019", "14 x 20.5 cm", "Bìa mềm", 404, "Nhà Xuất Bản Hội Nhà Văn", "2298428568228",
     
    "Khi ngợi khen một người trẻ độc lập mạnh mẽ, có thể chúng ta không biết họ lớn lên trong môi trường phải
     làm bố mẹ của bố mẹ mình ra sao, cô đơn khắc khoải thế nào. Khi ngưỡng một một người trẻ học giỏi, có thể
     chúng ta không biết họ đã bị ngạt thở bởi kỳ vọng của cha mẹ. Khi phán xét một người trẻ hời hợt thiếu
     động lực sống, có thể chúng ta không biết từ bé đến lớn họ đã được \"đút sẵn\" đến nỗi không còn biết mình
     là ai. Khi kêu ca một người trẻ thiếu nghị lực muốn kết thúc cuộc sống, có thể chúng ta không biết họ đã
     oằn mình mang gánh nặng mà gia đình ấn xuống quá lâu, khiến cánh giải thoát duy nhất là cái chết… Tìm mình
     trong thế giới hậu tuổi thơ của Đặng Hoàng Giang dẫn người đọc vào thế giới của người trẻ trên dưới hai
     mươi tuổi, lứa tuổi không còn trẻ con, nhưng cũng chưa thực sự là người lớn."),
    (1072, "Sức Mạnh Tiềm Thức", 70200, "Joseph Murphyc", "First News - Trí Việt", "06-2019", "14.5 x 20.5 cm", "Bìa mềm", 336, "Nhà Xuất Bản Tổng hợp TP.HCM", "6864545960113",
     
    "Là một trong những quyển sách về nghệ thuật sống nhận được nhiều lời ngợi khen và bán chạy nhất mọi thời
     đại, Sức Mạnh Tiềm Thức đã giúp hàng triệu độc giả trên thế giới đạt được những mục tiêu quan trọng trong
     đời chỉ bằng một cách đơn giản là thay đổi tư duy. Sức Mạnh Tiềm Thức giới thiệu và giải thích các phương
     pháp tập trung tâm thức nhằm xoá bỏ những rào cản tiềm thức đã ngăn chúng ta đạt được những điều mình mong
     muốn."),
    (1073, "Không Phải Chưa Đủ Năng Lực , Mà Là Chưa Đủ Kiên Định", 56800, "Hàn Xuân Trạch", "R.E.A.D Books", "09-2019", "14 x 20.5 cm", "Bìa mềm", 208, "Nhà Xuất Bản Thế Giới", "6044127517243",
     
    "Bạn định sẽ giảm cân sớm thôi, nhưng không bao giờ ngừng nuông chiều bản thân, ăn uống vô độ? Bạn quyết
     tâm học hành, làm việc chăm chỉ, nhưng cứ bật máy tính là xem phim, nghe nhạc hết cả ngày? Bạn tự nhủ rằng
     tiền không còn nhiều, phải tiết kiệm, nhưng lại không cầm lòng được trước các món đồ mà hiện tại mình
     không thực sự cần. Hay có những lúc bạn rất bận rộn với việc của mình, nhưng vì cả nể vẫn chấp nhận giúp
     đỡ, làm hộ người khác cả phần việc của họ? Bạn có rất nhiều dự định, rất nhiều quyết tâ nhưng tất cả đều
     không thể thành hiện thực bởi khả năng tự kiểm soát chưa đủ mạnh mẽ. Khả năng đó là gì? Tại sao người không
     có năng lực ấy sẽ buông thả bản thân, khiến cuộc sống đi lệch hướng khỏi quỹ đạo đúng đắn, chẳng thể kiên
     trì theo đuổi việc gì đến cùng? Ngược lại, người biết tự kiểm soát tốt, dù không đạt được sự thỏa mãn nhất
     thời, nhưng chắc chắn sẽ thành công trên đường đời và đạt được hạnh phúc dài lâu?"),
    (1074, "Ác Ý", 55860, "Keigo Higashino", "IPM", "06-2019", "13.5 x 20.5 cm", "Bìa mềm", 320, "Nhà Xuất Bản Hồng Đức", "6681790765481",
     
    "“Hàng xóm nuôi con mèo lông trắng điểm nâu. Mèo nhà mà cứ thả rông, để nó chạy sang vườn mình bứt cây đi
     bậy, phiền toái vô cùng, không làm sao mà chịu đựng được.” Một nhà văn có bài tùy bút đăng báo, đại ý như
     vậy. Báo phát hành được vài hôm thì con mèo hàng xóm chết vì trúng bả. Tình cờ là, chủ nó bắt gặp bài tùy
     bút. Và vấn đề là, con mèo của chị ta lông trắng điểm nâu. Chiều hôm ấy, chị ta sang vườn nhà văn để tìm
     vết tích bả độc. Tối hôm ấy, nhà văn bị giết. Có một nhân vật nổi tiếng từng tiêu diệt rất nhiều người,
     thậm chí phá tan cả mấy băng đảng, chỉ để báo thù cho một con chó. Vậy đây, liệu có phải án mạng để báo 
     thù cho một con mèo? Từ xuất phát điểm là vụ sát hại một nhà văn nhân cách vàng trong khu phố giàu sang,
     Keigo Higashino kéo tuột người đọc vào một lịch sử được viết lại bằng gian dối, một ma trận được vận hành
     theo nguyên tắc lấy oán trả ơn."),
    (1075, "Cảm Ơn Người Lớn", 70000, "Nguyễn Nhật Ánh", "NXB Trẻ", "10-2018", "13 x 20 cm", "Bìa mềm", 264, "Nhà Xuất Bản Trẻ", "9227976567295",
     
    "Cảm ơn người lớn (Bìa Mềm) - một áng văn lãng mạn trong giọng hài hước đặc biệt “dành cho trẻ em, và
     những ai từng là trẻ em”. Bạn sẽ gặp lại Mùi, Tủn, Tí sún, Hải cò… của Cho tôi xin một vé đi tuổi thơ,
     cùng chơi những trò chơi quen thuộc, và được đắm mình vào những ước mơ điên rồ, ngốc nghếch nhưng trong
     veo của tuổi mới lớn hồn nhiên và đầy ắp dự định. Và cả khi họ đã trưởng thành, bạo chúa thời gian đã vùng
     vẫy thế nào trong cuộc đời của những nhân vật mà bạn yêu quý… Hãy bắt đầu đọc từ bất cứ trang nào, có thể
     đọc bất cứ lúc nào, và cùng với bất cứ ai. Bạn sẽ nhận được món quà “n trong 1” của nhà văn Nguyễn Nhật
     Ánh: sẽ n lần thổn thức qua 1 cuốn sách 19 chương đầy ắp tình bạn ngây thơ, tình xóm giềng tốt lành nhân
     ái, tình yêu đắm đuối ngọt ngào… Cảm ơn người lớn được Nguyễn Nhật Ánh đặt bút viết đúng sau 10 năm ra đời
     Cho tôi xin một vé đi tuổi thơ."),
    (1076, "Tôi, Tương Lai Và Thế Giới", 104000, "Nguyễn Phi Vân", "Saigon Books", "12-2018", "14 x 20.5 cm", "Bìa mềm", 380, "Nhà Xuất Bản Thế Giới", "9469028544001",
     
    "Tôi, Tương lai & Thế giới ra đời đúng vào thời điểm cần thiết nhất đối với Việt Nam. Môi trường sống của
     chúng ta, kể cả ở Việt Nam đang thay đổi ở một tốc độ chưa từng có do Cách mạng công nghiệp 4.0 đem lại.
     Trong sự thay đổi ấy, luật tiến hóa của vạn vật sẽ là tấm lưới chọn lọc những ai tồn tại. Đó không phải
     người thông minh nhất, cũng không phải người mạnh nhất hay nhanh nhất mà là người có khả năng thích nghi
     cao nhất. Như nhà khoa học gia, chính trị gia Benjamin Franklin từng nói: “Thất bại trong chuẩn bị, bạn
     đang chuẩn bị cho sự thất bại”. Tôi, Tương lai & Thế giới nên là cuốn sách đầu giường cho các bạn trẻ,
     các nhà giáo dục, kể cả những nhà khởi nghiệp và những người làm chính sách để có sự chuẩn bị và sẵn sàng
     nắm bắt cơ hội khi cơn sóng thần Cách mạng công nghiệp 4.0 tràn đến."),
    (1077, "Bí Mật Của Phan Thiên Ân", 69000, "Alan Phan", "HappyLive", "08-2018", "10 x 15 cm", "Bìa mềm", 211, "Nhà Xuất Bản Thế Giới", "9219205007405",
     
    "Những bài học về tinh thần, tâm linh và trí tuệ đã được chính tiến sĩ Alan Phan chắp bút & phóng tác lại
     theo nguyên tác của cuốn sách vô giá theo thời gian “Người bán hàng vĩ đại nhất thế giới” của Og Mandino.
     Lối viết dung dị, đơn giản: dùng một câu chuyện với bối cảnh thân thuộc và mười tờ kinh để thắp nên những
     bài học thay đổi cuộc đời – tất cả sẽ làm nên những sự thay đổi “diệu kì” khi ta áp dụng triệt để. Trong
     cuốn sách người đọc sẽ tìm thấy nhiều bất ngờ thú vị về việc khám phá chính bản thân và sức mạnh nội tại
     của mình qua ngòi bút “không-kinh-tế” và “đầy tính triết lý nhân sinh” của một “triết gia doanh nhân” bậc
     thầy Alan Phan. “Con đường để đạt được thành công và giàu có đều có những thử thách. Và để thành công hay
     giàu có cần phải có kinh nghiệm và bí quyết.”"),
    (1078, "Để Con Được Ốm", 47500, "Uyên Bùi - BS. Trí Đoàn", "Nhã Nam", "03-2016", "14 x 20.5 cm", "Bìa mềm", 300, "Nhà Xuất Bản Thế Giới", "2600623231829",
     
    "Để con được ốm có thể coi là một cuốn nhật ký học làm mẹ thông qua những câu chuyện từ trải nghiệm thực
     tế mà chị Uyên Bùi đã trải qua từ khi mang thai đến khi em bé chào đời và trở thành một cô bé khỏe mạnh,
     vui vẻ. Cùng với những câu chuyện nhỏ thú vị của người mẹ là lời khuyên mang tính chuyên môn, giải đáp cụ
     thể từ bác sỹ Nguyễn Trí Đoàn, giúp hóa giải những hiểu lầm từ kinh nghiệm dân gian được truyền lại, cũng
     như lý giải một cách khoa học những thông tin chưa đúng đắn đang được lưu truyền hiện nay, mang đến góc
     nhìn đúng đắn nhất cho mỗi hiện tượng, sự việc với những kiến thức y khoa hiện đại được cập nhật liên tục.
     Cuốn sách sẽ giúp các bậc phụ huynh trang bị một số kiến thức cơ bản trong việc chăm sóc trẻ một cách khoa
     học và góp phần giúp các mẹ và những-người-sẽ-là-mẹ trở nên tự tin hơn trong việc chăm con, xua tan đi những
     lo lắng, để mỗi em bé ra đời đều được hưởng sự chăm sóc tốt nhất."),
    (1079, "Ăn Dặm Kiểu Nhật", 86420, "Tsutsumi Chiharu", "Thái Hà", "09-2018", "15 x 15 cm", "Bìa mềm", 176, "Nhà Xuất Bản Lao Động Xã Hội", "7581266800687",
     
    "Bạn đã làm cha mẹ. Và bạn có lúng túng với bước đầu cho bé yêu ăn dặm? Giai đoạn ăn dặm có vai trò là
     giai đoạn chuẩn bị để trẻ chuyển từ bú mẹ, uống sữa ngoài sang “nhai nát và nuốt”. Điều quan trọng của
     giai đoạn này không chỉ là cho trẻ ăn và theo dõi đảm  bảo sự phát triển của trẻ mà còn phải theo dõi chức
     năng ăn và lôi kéo hợp lý sự ham thích ăn của trẻ, làm cho trẻ tự lập. Để làm được những việc đó, thống
     nhất quan điểm là rất quan trọng, phải thống nhất về việc lựa chọn thực phẩm, lượng ăn, cách ăn, những
     người lớn xung quanh giúp đỡ như thế nào. Tuy nhiên việc ăn dặm là việc hàng ngày. Bạn có đang băn khoăn
     trăn trở nên cho trẻ ăn gì, ăn bao nhiêu, ăn như thế nào không. Trong giai đoạn lần đầu tiên bé tiếp xúc
     với thức ăn, nếu mọi người xung quanh bé quá nhạy cảm, lo lắng về bữa ăn dặm của trẻ, lo lắng đó sẽ truyền
     sang bé và thường làm mất đi không khí của bữa ăn vốn dĩ là vui vẻ."),
    (1080, "Nhân tố Enzyme - Phương Thức Sống Lành Mạnh", 56070, "Hiromi Shinya", "Thái Hà", "01-2019", "14.5 x 20.5 cm", "Bìa mềm", 224, "Nhà Xuất Bản Thế Giới", "7038392472344",
     
    "Từ kết quả lâm sàng khi tiến hành kiểm tra dạ dày của hơn 300.000 người, bác sĩ Hiromi Shinya đã rút ra
     kết luận: “Người có sức khỏe tốt là người có dạ dày đẹp, ngược lại, người có sức khỏe kém là người có dạ
	 dày không đẹp.” Ông thường ví tình trạng của dạ dày, đường ruột là “vị tướng” và “tràng tướng” như người
     ta hay gọi “nhân tướng” vậy. Người có vị tướng và tràng tướng tốt thì cơ thể và tâm trí của người đấy cũng
     khỏe mạnh. Ngược lại, người có vị tướng và tràng tướng xấu tức là trong cơ thể, tâm trí của anh ta đang có
     vấn đề ở chỗ nào đó. Nói tóm lại, vị tướng và tràng tướng của người có sức khỏe tốt thường rất tốt còn vị
     tướng, tràng tướng của người có sức khỏe kém thường xấu. Hay nói ngược lại, nếu giữ được vị tướng và tràng
     tướng tốt cũng đồng nghĩa với giữ được sức khỏe tốt. Và yếu tố ảnh hưởng lớn nhất đến vị tướng và tràng
     tướng chính là thói quen ăn uống cũng như thói quen sinh hoạt hàng ngày."),
    (1081, "Search Inside Yourself", 75600, "Chade - Meng Tan", "Thái Hà", "10-2019", "15.5 x 22 cm", "Bìa mềm", 364, "NXB Trẻ", "8026584739763",
     
    "Tất cả chúng ta đều biết công cụ tìm kiếm Google và công ty Google với văn hóa doanh nghiệp tuyệt vời nổi
     tiếng khắp thế giới, nhưng liệu có bao nhiêu người trong số chúng ta biết được điều gì đã làm nên nền tảng
     cho sự nổi tiếng đó? Chade-Meng Tan – tác giả cuốn sách Search Inside Yourself sẽ giải thích cho bạn bí mật
     đó. Mỗi năm, có đến hàng nghìn kĩ sư Google tham gia một trong 12 khóa đào tạo về thiền để tăng cường khả
     năng “cân bằng nhận thức” về những gì đang diễn ra xung quanh. Khóa học nổi tiếng nhất – mang tên “Search
     inside yourself” (Tìm kiếm bên trong bạn) – luôn là khóa học được trông đợi nhất và thu hút nhiều người
     tham gia nhất với danh sách học viên chờ tham dự dài đến sáu tháng."),
    (1082, "Thám Tử Lừng Danh Conan - Tập 96", 18000, "Gosho Aoyama", "Nhà Xuất Bản Kim Đồng", "01-2019", "11.3x17.6 cm", "Bìa mềm", 184, "Nhà Xuất Bản Kim Đồng", "1393341391005",
     
    "Kaito Kid muốn giành lấy “Đôi Môi Tiên Nữ” và lần đầu đối mặt với Heiji Hattori! Makoto Kyogoku bị cuốn
     vào những vụ án xảy ra tại một địa điểm quay phim truyền hình…!? Những thông tin mới nhất liên quan tới
     ông trùm của Tổ chức Áo Đen sẽ được tiết lộ!!"),
    (1083, "Yêu Những Điều Không Hoàn Hảo", 83400, "Hae Min", "Nhã Nam", "2018", "14 x 20.5 cm", "Bìa mềm", 300, "Nhà Xuất Bản Thế Giới", "3044489264000",
     
    "Đại đức Hae Min sinh ra và lớn lên tại Hàn Quốc. Sau khi hoàn thành bằng Thạc sĩ Tôn giáo học đối chiếu
     ở Đại học Havard và Tiến sĩ Tôn giáo học ở Đại học Princeton, ông ở lại Mỹ tham gia  giảng dạy về tôn giáo
     ở trường Đại học Hampshire, Massachusetts. Không chỉ dừng lại ở nghiên cứu lý thuyết, mùa xuân năm 2000
     ông quyết định xuất gia theo tông phái Tào Khê, một tông phái tiêu biểu của Phật giáo Hàn Quốc. Năm 2015,
     Đại đức Hae Min trở về Seoul, cùng nhiều chuyên gia mở trường Trị liệu tâm hồn, điều trị miễn phí cho 
     những người gặp bất hạnh trong cuộc sống hay đang mang trong lòng nhiều khổ tâm. Đại đức Haemin là một
     trong những người rất có ảnh hưởng tới giới trẻ Hàn Quốc, trang Twitter cá nhân của ông hiện có tới hơn
     một triệu người theo dõi. Sách cùng tác giả: - Những vỡ lẽ của tuổi trẻ - Yêu lấy những điều không hoàn hảo."),
    (1084, "Người Giỏi Không Phải Là Người Làm Tất Cả", 31200, "Donna M. Genett, Ph.D", "First News - Trí Việt", "12-2015", "13 x 20.5 cm", "Bìa mềm", 115,
     
    "Nhà Xuất Bản Tổng hợp TP.HCM", "2427069340416", "Quản lý theo kiểu\" giao khoán\" là phong cách phổ biến
     nhất hiện nay. Người quản lý thực hiện công việc giao việc và chỉ can thiệp khi nào nhân viên có sai sót.
     Họ luôn quan tâm đến kết quả công việc, và chỉ biết la lối ầm ĩ khi nhân viên làm sai. Họ thường để mặc
     nhân viên với mớ công việc ngổn ngang và không một sự hướng dẫn. Nếu bạn đã đọc và áp dụng những điều mà
     Donna Genett đã viết về nghệ thuật uỷ quyền, chắc chắn những lần xuất hiện ngắn ngủi vô ích đó có của
     người quản lý sẽ không còn cần thiết nữa. Dù bạn là người uỷ thác hay được uỷ thác công việc, nhưng nếu
     biết ứng dụng sáu nguyên tắc này, chắc chắn bạn sẽ cảm thấy khối lượng công việc giảm đi đáng kể, nhờ vậy
     bạn sẽ có thêm nhiều thời gian để tập trung vào những điều thật sự quan trọng trong công việc và trong
     cuộc sống."),
    (1085, "Khởi Nghiệp Tinh Gọn", 93213, "Eric Ries", "Viện Quản Lý P.A.C.E", "2018", "15 x 23 cm", "Bìa cứng", 336, "Nhà Xuất Bản Tổng hợp TP.HCM", "6410873198515",
     
    "Cuốn sách \"Khởi nghiệp Tinh gọn\" (The Lean Startup) trình bày một mô hình khởi nghiệp vang danh toàn
     cầu, giúp thay đổi toàn bộ cách thức xây dựng công ty và tung ra sản phẩm mới trên thị trường. “Khởi
     nghiệp” - hai tiếng đơn giản đó có sức hút mạnh mẽ với bất kỳ ai, không chỉ đối với những người đang ấp
     ủ một dự án kinh doanh, mà ngay cả những ông chủ đang muốn tìm kiếm một sản phẩm hay một ý tưởng mới để
     “tái khởi nghiệp”, nói cách khác là tái tạo lại mô hình kinh doanh của mình. Tuy nhiên, từ ý tưởng đến
     thành công là điều không dễ! Nhiều dự án khởi nghiệp thất bại không phải vì ý tưởng không tốt, chiến lược
     kém hay tầm nhìn sai, mà cốt lõi của mọi vấn đề nằm ở chỗ chúng ta không có được một mô hình và phương
     pháp để khởi nghiệp thành công."),
    (1086, "Dế Mèn Phiêu Lưu Ký", 34889, "Tô Hoài", "Nhà Xuất Bản Kim Đồng", "01-2019", "13 x 19 cm", "Bìa mềm", 144, "Nhà Xuất Bản Kim Đồng", "7734142469588",
     
    "Ấn bản minh họa màu đặc biệt của Dế Mèn phiêu lưu ký, với phần tranh ruột được in hai màu xanh - đen ấn
     tượng, gợi không khí đồng thoại. “Một con dế đã từ tay ông thả ra chu du thế giới tìm những điều tốt đẹp
     cho loài người. Và con dế ấy đã mang tên tuổi ông đi cùng trên những chặng đường phiêu lưu đến với cộng 
     đồng những con vật trong văn học thế giới, đến với những xứ sở thiên nhiên và văn hóa của các quốc gia khác.
     Dế Mèn Tô Hoài đã lại sinh ra Tô Hoài Dế Mèn, một nhà văn trẻ mãi không già trong văn chươ” “Ông rất hiểu
     tư duy trẻ thơ, kể với chúng theo cách nghĩ của chúng, lí giải sự vật theo lô gích của trẻ. Hơn thế, với
     biệt tài miêu tả loài vật, Tô Hoài dựng lên một thế giới gần gũi với trẻ thơ. Khi cần, ông biết đem vào
     chất du ký khiến cho độc giả nhỏ tuổi vừa hồi hộp theo dõi, vừa thích thú khám phá.”"),
    (1087, "Cuộc Sống \"Đếch\" Giống Cuộc Đời", 55578, "Hoàng Hải Nguyễn", "Người Trẻ Việt", "02-2020", "13 x 20.5 cm", "Bìa mềm", 216, "Nhà Xuất Bản Hà Nội", "2445490726364",
     
    "Sau sự thành công ngoài sức tưởng tượng của cuốn sách đầu tay “Cuộc sống rất giống cuộc đời”, sau 4 năm,
     tác giả Hoàng Hải Nguyễn mới trở lại với độc giả với cuốn sách siêu hài hước “Cuộc sống đếch giống cuộc
     đời” – dự báo một hiện tượng mạng trong thời gian tới. Ghi dấu ấn mạnh mẽ nhờ giọng văn phóng khoáng, hóm
	 hỉnh, sâu cay và đặc biệt là biệt tài gây cười đặc trưng có một không hai, chắc chắn với cuốn sách tiếp
     theo này, tác giả Hoàng Hải Nguyễn sẽ tiếp tục chinh phục các độc giả khó tính nhất. Luôn tâm niệm mình
     là một người viết yêu văn chương, chính vì thế mà các bài viết của anh không tạo cảm giác ức chế hay nhàm
     chán với những lối đi cũ mòn của văn chương hoa mĩ. Dưới góc nhìn của một người đàn ông U40, đã có gia đình
     và hai con, anh nhìn nhận sự xoay vần của cuộc đời theo cách của người từng trải có nhiều kinh nghiệm."),
    (1088, "Combo Cà Phê Cùng Tony và Trên Đường Băng", 118480, "Tony", "NXB Trẻ", "10-2017", "13 x 20 cm", "Bìa mềm", 576, "NXB Trẻ", "6294309461486",
     
    "Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định
     mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên
     con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi
     Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của
     chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện
     nhỏ như nên chú ý những phép tắc xã giao thông thường."),
	(1089, "Totto - Chan Bên Cửa Sổ", 49000, "Kuroyanagi Tetsuko", "Nhã Nam", "12-2018", "14 x 19 cm", "Bìa mềm", 355, "Nhà Xuất Bản Văn Học", "6176117561223",
     
    "Không còn cách nào khác, mẹ đành đưa Totto-chan đến một ngôi trường mới, trường Tomoe. Đấy là một ngôi
     trường kỳ lạ, lớp học thì ở trong toa xe điện cũ, học sinh thì được thoả thích thay đổi chỗ ngồi mỗi ngày,
     muốn học môn nào trước cũng được, chẳng những thế, khi đã học hết bài, các bạn còn được cô giáo cho đi dạo.
     Đặc biệt hơn ở đó còn có một thầy hiệu trưởng có thể chăm chú lắng nghe Totto-chan kể chuyện suốt bốn tiếng
     đồng hồ! Chính nhờ ngôi trường đó, một Totto-chan hiếu động, cá biệt đã thu nhận được những điều vô cùng
     quý giá để lớn lên thành một con người hoàn thiện, mạnh mẽ. Totto-chan bên cửa sổ là cuốn sách gối đầu
     giường của nhiều thế hệ trẻ em trên toàn thế giới suốt ba mươi năm nay. Sau khi xuất bản lần đầu vào năm
     1981, cuốn sách đã gây được tiếng vang lớn không chỉ ở Nhật Bản mà còn trên toàn thế giới."),
    (1090, "Không Tự Khinh Bỉ Không Tự Phí Hoài", 64350, "Vãn Tình", "Bloom Books", "06-2019", "14.5 x 20 cm", "Bìa mềm", 368, "Nhà Xuất Bản Thế Giới", "4204190981743",
     
    "Là cuốn sách bán chạy nhất của Vãn Tình, viết trong đoạn trưởng thành nhất của tác giả, 40 bài viết trong
     “Không tự khinh bỉ - Không tự phí hoài” là những trải nghiệm của chính Vãn Tình, bạn bè và những người
     thân quen, về công việc - con đường phát triển năng lực bản thân; về gia đình - tình yêu, vướng mắc trong
     hôn nhân, đối nhân xử thế với họ hàng, làng xóm; và cả về chính bản thân mỗi người phụ nữ - đời sống, quan
     điểm, cách ứng xử và đối mặt với vô vàn sóng gió trong cuộc đời. Quan điểm xuyên suốt những câu chuyện của
     Vãn Tình là: “Nếu một người phụ nữ đánh mất chính mình thì cô ấy sẽ mất đi tất cả.” Ngay khi ra mắt, “Không
     tự Khinh bỉ - Không tự phí hoài” đã đạt được hàng triệu lượt xem trên mạng, bán được hàng trăm nghìn bản
     tới bạn đọc Trung Quốc, đồng thời tạo nên một làn sóng mạnh mẽ, góp phần thay đổi tư duy và quan điểm về
     các mối quan hệ, gia đình, công việc của hàng triệu phụ nữ."),
    (1091, "Bí Mật Của May Mắn", 46289, "Alex Rovira", "First News - Trí Việt", "02-2020", "13 x 20.5 cm", "Bìa mềm", 152, "Nhà Xuất Bản Tổng hợp TP.HCM", "1242949637100",
     
    "Câu chuyện trong Bí mật của May mắn hấp dẫn như câu chuyện thần thoại với những chân lý thực tế và vĩnh
     hằng của cuộc sống, mang lại cho người đọc, niềm tin, hy vọng, những trải nghiệm quý báu, đồng thời lý
     giải tại sao một số người luôn gặp được may mắn trong khi những người khác lại không gặp. Cuốn sách đã
     mang đến cho độc giả một cái nhìn thú vị và sâu sắc về thay đổi những điều kiện cần thiết để tạo ra và
     duy trì sự may mắn trong cuộc đời chúng ta. Độc giả khắp mọi nơi đã chú tâm thưởng thức, chuyền tay cho bè
     bạn và mỗi người đều mua nhiều bản để tặng cho gia đình, người thân, đồng nghiệp như những món quà đặc biệt
     của sự may mắn. Bí quyết thành công và may mắn của Max nằm ở câu chuyện kỳ diệu mà người ông đã kể lại cho
     Max từ nhiều năm trước."),
    (1092, "Cách Khen, Cách Mắng, Cách Phạt Con", 38350, "Wakamatsu Aki - Sasaki Masami", "Thái Hà", "05-2015", "13 x 19 cm", "Bìa mềm", 180, "Nhà Xuất Bản Lao Động Xã Hội", "2602755713501",
     
    "Muốn con ngủ sớm thì nó lại chẳng chịu đi ngủ, muốn nó dừng bú mà nó cũng không chịu, lớn lên một chút
     thì nói cũng không nghe, vì nhút nhát mà bị thiệt thòi… Có rất nhiều vấn đề như vậy khiến chúng ta nhức
     đầu trong quá trình nuôi dạy con. Bất cứ người phụ nữ nào đã từng nuôi con đều hiểu rằng trên thế gian này
     rất nhiều việc không như mình muốn. Trong quyển sách này, tôi muốn giới thiệu một số quan điểm cơ bản và
     phương pháp nuôi dạy con dựa trên “cách khen”, “cách mắng”, “cách dạy dỗ” trẻ. Ngay từ đầu, chúng ta phải
     làm sao để hiểu được con mình là đứa trẻ như thế nào? Phải nuôi dạy bằng cách nào? Việc hiểu được bản chất
     của sự phát triển của trẻ rất cần thiết đối với những bà mẹ đang gặp khó khăn trong quá trình nuôi dạy con.
	 Lúc đó, tôi đã tới Salon Hidamari ở thành phố Akita của cô Wakamatsu Aki -  nguyên là cựu giáo viên mẫu giáo."),
    (1093, "Minh Triết Trong Đời Sống", 57200, "Nguyên Phong", "First News - Trí Việt", "07-2019", "14.5 x 20.5 cm", "Bìa mềm", 288, "Nhà Xuất Bản Hồng Đức", "1604737407331",
     
    "Trong thập niên vừa qua, tôi đã diễn thuyết khắp nơi về nhiều đề tài khác nhau như \"Con đường chuyển
     hóa\", \"Định hướng cho tương lai\", \"Hạnh phúc và đau khổ\", Thính giả của tôi gồm đủ mọi hạng người
     trong xã hội, giám đốc xí nghiệp, quản lý thương mại, giáo sư đại học, sinh viên, học sinh, quân nhân, công
     nhân, thợ thuyền. Sau buổi nói chuyện thường có phần thảo luận, một số người đã đặt những câu hỏi tương tự
     như sau:
	 - Cuộc đời của tôi là một chuỗi đau khổ, bà có cách nào giúp tôi không?
	 - Tại sao những bất hạnh lại xảy ra cho tôi? Tôi đã làm gì nên tội?
	 - Tại sao lúc nào tôi cũng cảm thấy bất an, lo sợ?
	 - Làm cách nào để một người bình thường như tôi có thể thoải mái trong đời sống hiện tại?"),
    (1094, "Khi Mọi Điểm Tựa Đều Mất", 50700, "Marci Shimoff", "First News - Trí Việt", "04-2019", "20.04 x 12.7 cm", "Bìa mềm", 280, "Nhà Xuất Bản Tổng hợp TP.HCM", "5882482881057",
     
    "Với Happy for No Reason - Khi mọi điểm tựa đều mất, tác giả Marci Shimoff đã có một cuộc cách mạng về
     quan niệm hạnh phúc. Trong khi phần lớn những quyển sách ở thể loại này hướng vào việc giúp con người tìm
     kiếm hạnh phúc từ những yếu tố bên ngoài thì Happy for No Reason lại hướng  vào những yếu tố nội tâm. Nhờ
     vậy, bạn sẽ tìm thấy những phương thức tuy đơn giản nhưng lại rất hữu hiệu giúp bạn trải nghiệm một cảm
     xúc mới – hạnh phúc tự thân – bất kể mọi tác động tiêu cực từ bên ngoài. Quyển sách sẽ gửi đến bạn nền
     tảng cơ bản nhất, giúp bạn duy trì một trạng thái hạnh phúc bền vững và trọn vẹn."),
    (1095, "Phi Lý Trí", 92158, "Dan Ariely", "Alphabooks", "04-2018", "14 x 20 cm", "Bìa mềm", 404, "Nhà Xuất Bản Lao Động", "3231429352440",
     
    "Là một trong những cuốn sách của Dan Ariely là một cuốn sách đặc biệt hấp dẫn và đầy cảm hứng. Nó buộc
     người đọc phải suy nghĩ kỹ hơn về tất cả những hành vi, những sai lầm của mình để sống hợp lý và tốt đẹp
     hơn. Tại sao chúng ta luôn tự hứa là sẽ ăn kiêng để rồi ý nghĩ ấy vụt biến ngay khi chiếc xe chở đồ tráng
     miệng đi qua? Tại sao đôi khi chúng ta hào hứng mua sắm những thứ không thật sự cần đến? Tại sao chúng ta
     vẫn cảm thấy đau đầu sau khi dùng loại aspirin có giá 1 xu nhưng cơn đau đầu ấy lại biến mất nếu thuốc đó
     đắt gấp 50 lần? Tại sao những tín đồ được yêu cầu nhớ lại Mười điều răn của Chúa có xu hướng thành thật
     (ít nhất là ngay sau đó) hơn những người không được yêu cầu làm vậy? Hoặc tại sao các quy tắc danh dự lại
     làm tăng mức độ gian lận nơi công sở?"),
    (1096, "Nghệ Thuật Quyến Rũ", 161250, "Robert Greene", "NXB Trẻ", "05-2019", "16 x 24 cm", "Bìa mềm", 664, "NXB Trẻ", "7318863130189",
     
    "Tất cả chúng ta đều có sức hấp dẫn, lôi cuốn người khác nhưng không phải ai cũng ý thức và nhận ra được
     khả năng tiềm tàng này trong mình. Làm sao để nhận thức và phát triển những lợi điểm của bản thân để mỗi
     người trở lên thu hút và lôi cuốn hơn trước mọi người? Nghệ thuật quyến rũ là một cuốn sách thú vị giúp
     bạn khám phá và phát huy những lợi điểm vốn có trong bạn để tạo ảnh hưởng đối với người khác thông qua một
     số phương pháp và kỹ năng được hướng dẫn cụ thể. Bên cạnh đó sách cũng giới thiệu và phân tích minh họa
     những mẫu người quyến rũ và không quyến rũ điển hình có thật trong lịch sử cũng như trong các tác phẩm văn
     học để bạn có thể đối chứng và học hỏi thêm từ họ. Hi vọng sau khi đọc xong cuốn sách này mỗi chúng ta đều
     trở nên quyến rũ và thuyết phục hơn trong mắt mọi người."),
    (1097, "Code Dạo Kí Sự", 127200, "Phạm Huy Hoàng (Developer)", "Phương Thu", "01-2017", "16 x 24 cm", "Bìa mềm", 266, "Nhà Xuất Bản Dân Trí", "2448120945562", 
     
    "Nếu các bạn có đọc các blog về lập trình ở Việt Nam thì có lẽ cái tên Tôi đi code dạo không có gì quá xa
     lạ đối với các bạn. Về tác giả của blog Tôi đi code dạo, anh tên thật là Phạm Huy Hoàng, một Developer
     Full Stack, cựu sinh viên trường FPT University, hiện tại anh đang học Thạc sĩ Computer Science tại Đại
     học Lancaster ở Anh (học bổng $18000). Trước khi qua Xứ Sở Sương Mù, anh đã từng làm việc tại FPT Software
     và ASWIG Solutions. Với mong muốn chia sẻ kinh nghiệm học lập trình và các kỹ năng mà anh đã trải qua trong
     suốt quá trình học và làm việc với tư cách là người đi trước cũng như là một Developer Full Stack, nên anh
     đã quyết định xuất bản sách này."),
    (1098, "Người trong muôn nghề", 169000, "Nhóm tác giả", "NXB Hồng Đức", "12-2019", "14 x 20 cm", "Bìa mềm", 216, "Nhà Xuất Bản Hồng Đức - Hội Luật Gia Việt Nam", "1861006937702",
     
    "Hầu hết những người trẻ đều đã từng hoặc đang trải qua cảm giác không biết mình thuộc về đâu. Khó khăn
     lớn nhất có lẽ không phải là kiếm được việc, mà là chọn được một nghề thực sự phù hợp với bản thân. Trên
     hành trình kiếm tìm ấy, người trẻ phải gánh trên vai rất nhiều áp lực vô hình từ gia đình và xã hội. Đi
     học thì ngành phải \"hot\", trường phải\"xịn\". Đi làm thì vị trí phải “oai\", lương tháng phải “cao\",
     công ty phải “khủng\". Chúng ta mải chạy theo những thứ bề nổi mà quên mất rằng mục đích sau cùng của việc
     chọn ngành, chọn nghề là giúp mình tìm được điểm giao thoa giữa năng lực, sở thích cá nhân với nhu cầu của
     xã hội. Người Trong Muôn Nghề hi vọng có thể kéo bạn lại gần hơn với mục đích bản chất ấy. Cuốn sách là
     tuyển tập những câu chuyện đi làm tâm huyết đến từ những cây viết dày dặn kinh nghiệm trong các lĩnh vực
     chuyên môn và những môi trường làm việc khác nhau."),
    (1099, "Sói già Phố Wall", 249000, "Jordan Belfort", "Bách Việt", "03-2018", "17 x 23 x 7 cm", "Bìa mềm", 1321, "Nhà Xuất Bản Lao Động", "1867955175653",
     
    "Sói già Phố Wall là cuốn tự truyện của Jordan Belfort - một huyền thoại trong ngành môi giới chứng khoán
     trên sàn phố Wall. Tác phẩm kể về quá trình phất lên của Jordan nói riêng, cũng như nội tình cuộc đại
     khủng hoảng tín dụng thứ cấp ở Mỹ nói chung. Được mọi người gọi với nhiều biệt danh, trong đó, cái tên
     Sói Già Phố Wall là hợp với Jordan hơn cả - một con sói tối thượng đội lốt cừu non. Ngoại hình và cách hành
     xử của anh ta trông giống như một đứa trẻ nhưng thực chất, anh ta đâu có trẻ con. Anh ta là một thằng đàn
     ông ba mươi mốt tuổi nhưng già đời như một lão sáu mươi, \"sống theo thang tuổi của loài chó\" - một năm
     bằng bảy năm tuổi người.Vừa tốt nghiệp đại học, bước vào khởi nghiệp, Jordan Belford đã gặp ngay thất bại
     đầu đời trên phố Wall, bởi anh ta mới chỉ là “cừu non” giữa bao “sói già” khác vây quanh.");    
insert into Customers(ID, Email, Password, Name, Address, Phone) values
	(1000, "ngoquangdao@gmail.com", "9bde16f8fc9331b571b8c4fe2c5087fa", "Ngô Quang Đạo", "Ninh Môn, Hiền Ninh, Sóc Sơn, Hà Nội", "0904611892"),
    (1001, "nguyenbinhminh@gmail.com", "c4a6287b7c8d8d81fbefd860415adf4a", "Nguyễn Bình Minh", "Số 18, Ngõ 32 Lĩnh Nam, Hoàng Mai, Hà Nội", "0395445571"),
    (1002, "nguyenthianhduong@gmail.com", "356f1cc67528de0fa90d814e231e060f", "Nguyễn Thị Ánh Dương", "Số 6, Ngõ 281, Trần Khát Trân, Hai Bà Trưng, Hà Nội", "0964137851"),
    (1003, "havansang@gmail.com", "7c0324424d9b27db433a7be92b67baf2", "Hà Văn Sang", "Bính Xá, Đình Lập, Lạng Sơn", "0964458850");
    