-- WICHTIG: Diese Policy fehlt in der bisherigen Einrichtung.
-- Ohne SELECT-Rechte auf kunden können Aufträge zwar gespeichert,
-- aber die zugehörigen Kundendaten nicht wieder geladen werden.

create policy if not exists "kunden_select_own"
on public.kunden
for select
to authenticated
using (owner_id = auth.uid());

-- Sicherheitshalber auch SELECT für die übrigen Tabellen:
create policy if not exists "auftraege_select_own"
on public.auftraege
for select
to authenticated
using (owner_id = auth.uid());

create policy if not exists "termine_select_own"
on public.termine
for select
to authenticated
using (owner_id = auth.uid());

create policy if not exists "fotos_select_own"
on public.fotos
for select
to authenticated
using (owner_id = auth.uid());

create policy if not exists "kalkulationen_select_own"
on public.kalkulationen
for select
to authenticated
using (owner_id = auth.uid());

create policy if not exists "leistungspositionen_select_own"
on public.leistungspositionen
for select
to authenticated
using (owner_id = auth.uid());
