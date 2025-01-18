CREATE TYPE public.account_type AS ENUM ('Client', 'Employee', 'Admin');
ALTER TYPE public.account_type OWNER TO maxy;
SELECT *
FROM public.inventory
ORDER BY inv_id ASC