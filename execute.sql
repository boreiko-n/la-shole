select pr.id, pr.name, pr.price, c.color, t.type, p.place, pr.alcohol, pr.sugar, pr.vintage
from products as pr
         inner join colors c on pr.color_id = c.id
         inner join types t on pr.type_id = t.id
         inner join places p on pr.place_id = p.id;


select pr.name, sum(ps.product_quantity) as total
from products as pr
         inner join products_shops ps on pr.id = ps.product_id
group by name
having sum(ps.product_quantity) > 100;

select o.id, o.name, o.surname, o.phone, p.name as vine, s.address as shop
from orders as o
         inner join products_orders po on o.id = po.order_id
         inner join products p on po.product_id = p.id
         inner join shops s on o.shop_id = s.id;


select pr.name, po.product_quantity
from products as pr
         inner join products_orders po on pr.id = po.product_id
         inner join orders o on po.order_id = o.id
where o.date = '2021-05-20';