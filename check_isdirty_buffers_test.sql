SELECT
    c.relname,
    b.isdirty
FROM pg_class c
JOIN pg_buffercache b ON b.relfilenode=c.relfilenode
JOIN pg_database d ON (b.reldatabase=d.oid AND d.datname=current_database())
WHERE c.relname not like 'pg%';