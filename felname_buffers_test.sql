select
    c.relname,
    count(*) as buffers
from pg_class c
join pg_buffercache b on b.relfilenode = c.relfilenode
inner join pg_database d on b.reldatabase = d.oid and d.datname = current_database()
where c.relname not like 'pg%'
group by c.relname
order by 2 desc;