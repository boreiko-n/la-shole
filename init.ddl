drop database la_shole;
create database if not exists la_shole character set utf8;

create table if not exists la_shole.products (
    id           int auto_increment primary key,
    name         varchar(30) not null unique,
    description  text        not null,
    price        float       not null,
    vol          float       not null,
    vintage      date        not null,
    alcohol      float       not null,
    sugar        float       not null,
    is_sparkling boolean     not null default false,
    type_id      int         not null,
    color_id     int         not null,
    place_id     int         not null
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.types (
    id   int auto_increment primary key,
    type varchar(50) not null unique
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.colors (
    id    int auto_increment primary key,
    color varchar(50) not null unique
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.places (
    id    int auto_increment primary key,
    place varchar(50) not null unique
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.shops (
    id      int auto_increment primary key,
    address varchar(200) not null,
    phone   varchar(17)  not null
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.products_shops (
    product_id       int not null,
    shop_id          int not null,
    product_quantity int not null
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.orders (
    id      int auto_increment primary key,
    date    datetime    not null,
    name    varchar(30) not null,
    surname varchar(50) not null,
    phone   varchar(17) not null,
    shop_id int         not null
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

create table if not exists la_shole.products_orders (
    product_id       int not null,
    order_id         int not null,
    product_quantity int not null
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

alter table la_shole.products
    add constraint fk_type_products foreign key (type_id) references la_shole.types(id);

alter table la_shole.products
    add constraint fk_color_products foreign key (color_id) references la_shole.colors(id);

alter table la_shole.products
    add constraint fk_place_products foreign key (place_id) references la_shole.places(id);

alter table la_shole.products_shops
    add constraint fk_product_products_shops foreign key (product_id) references la_shole.products(id);
alter table la_shole.products_shops
    add constraint fk_shop_products_shops foreign key (shop_id) references la_shole.shops(id);

alter table la_shole.orders
    add constraint fk_shop_orders foreign key (shop_id) references la_shole.shops(id);

alter table la_shole.products_orders
    add constraint fk_product_products_orders foreign key (product_id) references la_shole.products(id);
alter table la_shole.products_orders
    add constraint fk_order_products_orders foreign key (order_id) references la_shole.orders(id);

insert into la_shole.types (id, type)
values (1, 'сухое');
insert into la_shole.types (id, type)
values (2, 'полу-сухое');
insert into la_shole.types (id, type)
values (3, 'сладкое');
insert into la_shole.types (id, type)
values (4, 'полу-сладкое');
insert into la_shole.types (id, type)
values (5, 'брют');

insert into la_shole.colors (id, color)
values (1, 'красное');
insert into la_shole.colors (id, color)
values (2, 'белое');
insert into la_shole.colors (id, color)
values (3, 'розовое');

insert into la_shole.places (id, place)
values (1, 'божоле');
insert into la_shole.places (id, place)
values (2, 'бордо');
insert into la_shole.places (id, place)
values (3, 'бургундия');
insert into la_shole.places (id, place)
values (4, 'шампань');
insert into la_shole.places (id, place)
values (5, 'прованс');
insert into la_shole.places (id, place)
values (6, 'корсика');

insert into la_shole.shops (id, address, phone)
values (1, 'г. Минск ул. Кальварийская 21', '+375-29-333-21-12');
insert into la_shole.shops (id, address, phone)
values (2, 'г. Минск ул. Гинтовта 5', '+375-29-335-22-22');
insert into la_shole.shops (id, address, phone)
values (3, 'г. Брест ул. Пограничников 12', '+375-44-543-77-77');
insert into la_shole.shops (id, address, phone)
values (4, 'г. Гродно ул. Замковая 3', '+375-29-733-27-11');

insert into la_shole.products(name, description, price, vol, vintage, alcohol, sugar, type_id, color_id, place_id)
values ('Шардоне',
        'Шардоне - самый популярный сорт белого винограда в мире, происходящий из регионов Бургундия и Шампань, Франция. Его название связано с престижными французскими белыми винами.',
        18, 0.7, '2017-08-15', 13.2, 11, 1, 2, 1);
insert into la_shole.products(name, description, price, vol, vintage, alcohol, sugar, type_id, color_id, place_id)
values ('Каберне Савиньон',
        'Каберне Совиньон - самый популярный сорт красного вина в мире, происходящий из Бордо, Франция. Используется для производства высококачественных красных и купажированных вин.',
        21.55, 0.7, '2019-09-12', 12.1, 9, 2, 1, 2);
insert into la_shole.products(name, description, price, vol, vintage, alcohol, sugar, type_id, color_id, place_id)
values ('Савиньон Блан',
        'Савиньон Блан- - белое вино премиум-класса из Бордо, Франция. Наилучшие результаты виноград дает при выращивании на темно-бордовых древесных почвах в воздушной атмосфере.',
        61, 0.7, '2015-08-11', 13.3, 9.4, 1, 2, 2);
insert into la_shole.products(name, description, price, vol, vintage, alcohol, sugar, type_id, color_id, place_id)
values ('Семильон',
        'Семильон- белый сорт винограда из Бордо, Франция. Его выращивают для производства высококачественных белых сухих вин со вкусом дуба, зерна, меда и дыни.',
        24, 0.7, '2020-10-01', 12.3, 9.7, 1, 2, 2);
insert into la_shole.products(name, description, price, vol, vintage, alcohol, sugar, type_id, color_id, place_id)
values ('Мерло',
        'Мерло- красное-фруктовое, с яркой кислотностью и непродолжительной выдержкой в дубе',
        37, 1, '2019-09-16', 12.9, 10, 1, 1, 3);

insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (1, 1, 100);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (1, 2, 56);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (1, 4, 17);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (2, 1, 70);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (2, 2, 23);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (2, 3, 17);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (2, 4, 1);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (3, 1, 30);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (3, 2, 20);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (3, 3, 15);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (3, 4, 0);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (4, 1, 5);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (4, 2, 20);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (4, 3, 14);
insert into la_shole.products_shops (product_id, shop_id, product_quantity)
values (4, 4, 19);

insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-20', 'Петр', 'Иванов', '+375-29-784-23-98', 1);
insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-20', 'Сергей', 'Фомин', '+375-29-382-11-45', 4);
insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-20', 'Евгений', 'Криушев', '+375-44-751-28-12', 2);
insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-21', 'Андрей', 'Гурский', '+375-29-322-65-25', 1);
insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-21', 'Александр', 'Никонов', '+375-29-211-23-87', 1);
insert into la_shole.orders (date, name, surname, phone, shop_id)
values ('2021-05-21', 'Олег', 'Фукалов', '+375-33-312-33-19', 3);

insert into la_shole.products_orders (product_id, order_id, product_quantity)
values (2, 1, 1);
insert into la_shole.products_orders (product_id, order_id, product_quantity)
values (1, 1, 3);
insert into la_shole.products_orders (product_id, order_id, product_quantity)
values (3, 2, 1);
insert into la_shole.products_orders (product_id, order_id, product_quantity)
values (4, 3, 2);
insert into la_shole.products_orders (product_id, order_id, product_quantity)
values (1, 4, 1);