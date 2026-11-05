-- FreshNest: run this once in Supabase (SQL Editor -> New query -> paste -> Run)

create table if not exists public.records (
  id         bigint generated always as identity primary key,
  store      text    not null,
  food       text    not null,
  ordered    int     not null check (ordered > 0),
  wasted     int     not null check (wasted >= 0),
  ran_out    boolean not null default false,
  added_by   text    not null,
  user_id    uuid    not null default auth.uid() references auth.users(id),
  created_at timestamptz not null default now(),
  check (wasted <= ordered)
);

alter table public.records enable row level security;

-- Everyone can read the scoreboard
create policy "anyone can read records" on public.records
  for select using (true);

-- Only logged-in people can add, and only as themselves
create policy "logged in users add their own records" on public.records
  for insert to authenticated with check (auth.uid() = user_id);

create index if not exists idx_records_store on public.records(store);
create index if not exists idx_records_time  on public.records(created_at desc);
