select 
-- from raw orders
o.ORDERID,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERSELLINGPRICE - ORDERCOSTPRICE as orderprofit,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE,
--from raw customers
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
-- from raw products
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_products') }} as p
on o.PRODUCTID = p.PRODUCTID
