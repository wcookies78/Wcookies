-- Livraison : réglage du frais fixe
create table settings (
  id bigint generated always as identity primary key,
  delivery_fee numeric not null default 0
);
insert into settings (delivery_fee) values (1.5);
alter table settings disable row level security;

-- Codes promo
create table promo_codes (
  id bigint generated always as identity primary key,
  code text not null unique,
  type text not null check (type in ('percent','fixed')),
  value numeric not null,
  active boolean not null default true
);
alter table promo_codes disable row level security;

-- Colonnes supplémentaires sur les commandes existantes
alter table orders add column if not exists delivery_mode text not null default 'pickup';
alter table orders add column if not exists address text;
alter table orders add column if not exists delivery_fee numeric not null default 0;
alter table orders add column if not exists promo_code text;
alter table orders add column if not exists discount numeric not null default 0;
alter table orders add column if not exists subtotal numeric not null default 0;
