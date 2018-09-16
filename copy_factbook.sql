begin;
\copy factbook from 'test/factbook.csv' csv header delimiter ','
alter table factbook
    alter shares
    type bigint
    using replace(shares, ',', '')::bigint,

    alter trades
    type bigint
    using replace(trades, ',', '')::bigint,

    alter dollars
    type bigint
    using substring(replace(dollars, ',', '') from 2)::numeric;
commit;