-- V19 – korrigierte Supabase-RLS-Hilfsdatei
-- Legt die SELECT-Policies nur an, wenn sie noch nicht vorhanden sind.

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='kunden'
      AND policyname='kunden_select_own'
  ) THEN
    CREATE POLICY "kunden_select_own"
    ON public.kunden
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='auftraege'
      AND policyname='auftraege_select_own'
  ) THEN
    CREATE POLICY "auftraege_select_own"
    ON public.auftraege
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='termine'
      AND policyname='termine_select_own'
  ) THEN
    CREATE POLICY "termine_select_own"
    ON public.termine
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='fotos'
      AND policyname='fotos_select_own'
  ) THEN
    CREATE POLICY "fotos_select_own"
    ON public.fotos
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='kalkulationen'
      AND policyname='kalkulationen_select_own'
  ) THEN
    CREATE POLICY "kalkulationen_select_own"
    ON public.kalkulationen
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname='public' AND tablename='leistungspositionen'
      AND policyname='leistungspositionen_select_own'
  ) THEN
    CREATE POLICY "leistungspositionen_select_own"
    ON public.leistungspositionen
    FOR SELECT
    TO authenticated
    USING (owner_id = auth.uid());
  END IF;
END $$;
