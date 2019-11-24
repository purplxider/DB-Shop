create table User_Info (
    user_id         char(7)            not null,
    user_name       varchar(10)        not null,
    user_password   varchar(15)        not null,
    birth           date               not null,
    gender          char(1)            not null,
    user_rank       varchar(6)         not null,
    address1        varchar(15)        not null,
    address2        varchar(50)        not null,
    primary key(user_id)
);

create table User_Phone (
    user_id         char(7)            not null,
    phone_number    varchar(13)        not null,
    primary key(user_id, phone_number),
    foreign key(user_id) references User_Info
);

create table Brand (
    brand_id        char(4)           not null,
    brand_name      varchar(10)        not null,
    address1        varchar(15)        not null,
    address2        varchar(50)        not null,
    primary key(brand_id)
);

create table Brand_Phone (
    brand_id        char(4)           not null,
    phone_number    varchar(13)       not null,
    primary key(brand_id, phone_number),
    foreign key(brand_id) references Brand
);

create table Product (
    product_id      char(10)          not null,
    product_name    varchar(30)       not null,
    price           numeric           not null,
    season          varchar(2)        not null,
    gender          char(1)           not null,
    maincategory    varchar(10)       not null,
    subcategory     varchar(10)       not null,
    color           varchar(10)       not null,
    on_sale         char(1)           not null,
    primary key(product_id)
);

create table Stock (
    product_id      char(10)          not null,
    size_info       varchar(3)        not null,
    stock           numeric           not null,
    primary key(product_id, size_info),
    foreign key(product_id) references Product
);

create table Order_Info (
    order_id        char(8)          not null,
    receiver_name   varchar(10)      not null,
    address1        varchar(15)      not null,
    address2        varchar(50)      not null,
    total_price     numeric          not null,
    order_date      date             not null,
    payment_method  varchar(10)      not null,
    shipping_info   varchar(10)      not null,
    primary key(order_id)
);

create table Order_Phone (
    order_id        char(8)         not null,
    phone_number    varchar(13)     not null,
    primary key(order_id, phone_number),
    foreign key(order_id) references Order_Info
);

create table Wishlist (
    user_id         char(7)         not null,
    product_id      char(10)        not null,
    primary key(user_id, product_id),
    foreign key(user_id) references User_Info,
    foreign key(product_id) references Product
);

create table Register_Product (
    brand_id        char(4)         not null,
    product_id      char(10)        not null,
    register_date   date            not null,
    primary key(brand_id, product_id),
    foreign key(brand_id) references Brand,
    foreign key(product_id) references Product
);

create table Purchase_Info (
    user_id         char(7)         not null,
    order_id        char(8)         not null,
    product_id      char(10)        not null,
    size_info       varchar(3)      not null,
    quantity        numeric         not null,
    primary key(user_id, order_id, product_id, size_info),
    foreign key(user_id) references User_Info,
    foreign key(order_id) references Order_Info,
    foreign key(product_id, size_info) references Stock
);