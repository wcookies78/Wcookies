create table products (
  id bigint generated always as identity primary key,
  name text not null,
  description text,
  price numeric not null
);

create table orders (
  id bigint generated always as identity primary key,
  buyer_name text not null,
  items jsonb not null,
  total numeric not null,
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

alter table products disable row level security;
alter table orders disable row level security;

insert into products (name, description, price) values
('Cookie tout chocolat', 'Pépites de chocolat noir, cœur moelleux', 2.5),
('Cookie beurre de cacahuète', 'Craquant dehors, fondant dedans', 2.5),
('Cookie avoine-raisins', 'Flocons d''avoine et raisins secs', 2.0),
('Cookie double chocolat', 'Pépites blanches et noires', 3.0);
