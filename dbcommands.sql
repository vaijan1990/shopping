create table shop.items(item_id integer not null,
						item_name	varchar(32) not null,
						item_image_name var	char(32) not null,
						item_unit_price decimal(15,2) not null,
						item_discount_percent smallint not null with default 0,
						item_class_id integer not null, primary key(item_id));
						
create table shop.item_classification(item_class_id integer not null,
										item_class_name varchar(32) not null,primary key(item_class_id));

create table shop.user(user_id varchar(32) not null,
						user_email varchar(255) not null,
						user_passwd varchar(255) not null, primary key(user_id));
						
create table shop.user_order(	order_id integer not null
								, order_transaction_id integer generated  by default as identity (start with 10000 increment by 1 NOMAXVALUE) 
								, order_user_id varchar(32) not null
								, order_item_id integer	 not null							
								, order_purchase_date timestamp not null with default
								, order_quantity integer not null
								, order_price decimal(15,2) not null
								, order_transaction_status varchar(1) not null
								,primary key(order_id, order_transaction_id)
								) ;

insert into shop.item_classification values(1, 'mobile');
insert into shop.item_classification values(2, 'watches');
insert into shop.item_classification values(3, 'table');
insert into shop.item_classification values(4, 'kitchen');

insert into shop.items values(1,'SonyExperia','SonyExperia.jpg', 500, 0,1);
insert into shop.items values(2,'Windows','Windows.jpg', 400, 0,1);
insert into shop.items values(3,'iphone','iphone.jpg', 700, 0,1);

insert into shop.items values(4,'Rolex','Rolex.jpg', 535, 0,2);
insert into shop.items values(5,'Fasttrack','Fasttrack.jpg', 265, 0,2);
insert into shop.items values(6,'Titan','Titan.jpg', 550, 0,2);

insert into shop.items values(7,'RoundTable','RoundTable.jpg', 250, 0,3);
insert into shop.items values(8,'DoublecolorTable','DoublecolorTable.jpg', 320, 0,3);
insert into shop.items values(9,'SofaTable','SofaTable.jpg', 500, 0,3);

insert into shop.items values(10,'KnifeSet','KnifeSet.jpg', 150, 0,4);
insert into shop.items values(11,'SpoonSet','SpoonSet.jpg', 120, 0,4);
insert into shop.items values(12,'VegetableCutter','VegetableCutter.jpg', 300, 0,4);

insert into shop.user_order(order_id,ORDER_USER_ID, ORDER_ITEM_ID,ORDER_PURCHASE_DATE,ORDER_QUANTITY,ORDER_PRICE,ORDER_TRANSACTION_STATUS) 
values(1,'dummy','1',current date,1,10,'D');
insert into shop.user_order(order_id,ORDER_USER_ID, ORDER_ITEM_ID,ORDER_PURCHASE_DATE,ORDER_QUANTITY,ORDER_PRICE,ORDER_TRANSACTION_STATUS) 
values(1,'dummy','1',current date,1,10,'D');
insert into shop.user_order values(1,1,'dummy','1',current date,1,10,'D');

update shop.items set item_image_name='SofaTable.jpg' where item_id=9;
update shop.items set item_class_id=4 where item_id in (10,11,12);