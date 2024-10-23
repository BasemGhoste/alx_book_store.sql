-- قاعدة البيانات: alx_book_store

-- إنشاء جدول الكتب
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT, -- المفتاح الرئيسي لجدول الكتب
    title VARCHAR(130) NOT NULL, -- عنوان الكتاب، أقصى عدد من الأحرف 130
    author_id INT, -- المفتاح الأجنبي الذي يشير إلى جدول المؤلفين
    price DOUBLE, -- سعر الكتاب
    publication_date DATE, -- تاريخ نشر الكتاب
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id) -- تعريف العلاقة بالمفتاح الأجنبي
);

-- إنشاء جدول المؤلفين
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT, -- المفتاح الرئيسي لجدول المؤلفين
    author_name VARCHAR(215) NOT NULL -- اسم المؤلف، أقصى عدد من الأحرف 215
);

-- إنشاء جدول العملاء
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT, -- المفتاح الرئيسي لجدول العملاء
    customer_name VARCHAR(215) NOT NULL, -- اسم العميل
    email VARCHAR(215) NOT NULL, -- البريد الإلكتروني للعميل
    address TEXT -- عنوان العميل
);

-- إنشاء جدول الطلبات
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT, -- المفتاح الرئيسي لجدول الطلبات
    customer_id INT, -- المفتاح الأجنبي الذي يشير إلى جدول العملاء
    order_date DATE, -- تاريخ الطلب
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- العلاقة بالمفتاح الأجنبي
);

-- إنشاء جدول تفاصيل الطلبات
CREATE TABLE Order_Details (
    orderdetail_id INT PRIMARY KEY AUTO_INCREMENT, -- المفتاح الرئيسي لجدول تفاصيل الطلبات
    order_id INT, -- المفتاح الأجنبي الذي يشير إلى جدول الطلبات
    book_id INT, -- المفتاح الأجنبي الذي يشير إلى جدول الكتب
    quantity DOUBLE, -- كمية الكتب في الطلب
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id), -- العلاقة بالمفتاح الأجنبي مع جدول الطلبات
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id) -- العلاقة بالمفتاح الأجنبي مع جدول الكتب
);
