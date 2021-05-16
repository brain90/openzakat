-- implement party model

create table partner (

    id integer primary key,
    parent_id integer, -- induk lembaga: masjid
    nama text,
    phone text,
    alamat text,
    lat float,
    lng float,
    tipe smallint, -- perorangan, lembaga {masjid, pesantren, yayasan, dst}
    is_muzakki boolean,
    is_mustahiq boolean,
    no_rekening text,
    bank_id smallint,
    aktif boolean,
);

create table penerimaan (
    id integer primary key,
    jenis smallint, -- fitrah, mal, pertanian, sedekah, yatim
    partner_id integer,
    tanggal timestamp,
    jumlah integer,
    cara_bayar smallint, -- 1: tunai, 2: transfer
    bank_id smallint,
    create_uid integer,
);

create table penyaluran (
    id integer primary key,
    jenis smallint, -- fitrah, mal, pertanian, sedekah, yatim
    partner_id integer,
    tanggal timestamp,
    jumlah integer,
    cara_bayar smallint, -- 1: tunai, 2: transfer
    penanggung_jawab integer, -- fk to partner
    jadwal_penyaluran timestamp,
    tanggal_penyaluran timestamp, 
    status boolean, -- 0: draft, 1: selesai
);
