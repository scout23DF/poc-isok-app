create view raster_columns
            (r_table_catalog, r_table_schema, r_table_name, r_raster_column, srid, scale_x, scale_y, blocksize_x,
             blocksize_y, same_alignment, regular_blocking, num_bands, pixel_types, nodata_values, out_db, extent,
             spatial_index)
as
SELECT current_database()                                                                            AS r_table_catalog,
       n.nspname                                                                                     AS r_table_schema,
       c.relname                                                                                     AS r_table_name,
       a.attname                                                                                     AS r_raster_column,
       COALESCE(_raster_constraint_info_srid(n.nspname, c.relname, a.attname),
                (SELECT st_srid('010100000000000000000000000000000000000000'::geometry) AS st_srid)) AS srid,
       _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'x'::bpchar)                   AS scale_x,
       _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'y'::bpchar)                   AS scale_y,
       _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'width'::text)             AS blocksize_x,
       _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'height'::text)            AS blocksize_y,
       COALESCE(_raster_constraint_info_alignment(n.nspname, c.relname, a.attname), false)           AS same_alignment,
       COALESCE(_raster_constraint_info_regular_blocking(n.nspname, c.relname, a.attname),
                false)                                                                               AS regular_blocking,
       _raster_constraint_info_num_bands(n.nspname, c.relname, a.attname)                            AS num_bands,
       _raster_constraint_info_pixel_types(n.nspname, c.relname, a.attname)                          AS pixel_types,
       _raster_constraint_info_nodata_values(n.nspname, c.relname, a.attname)                        AS nodata_values,
       _raster_constraint_info_out_db(n.nspname, c.relname, a.attname)                               AS out_db,
       _raster_constraint_info_extent(n.nspname, c.relname, a.attname)                               AS extent,
       COALESCE(_raster_constraint_info_index(n.nspname, c.relname, a.attname), false)               AS spatial_index
FROM pg_class c,
     pg_attribute a,
     pg_type t,
     pg_namespace n
WHERE t.typname = 'raster'::name
  AND a.attisdropped = false
  AND a.atttypid = t.oid
  AND a.attrelid = c.oid
  AND c.relnamespace = n.oid
  AND (c.relkind = ANY (ARRAY ['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"]))
  AND NOT pg_is_other_temp_schema(c.relnamespace)
  AND has_table_privilege(c.oid, 'SELECT'::text);

alter table raster_columns
    owner to postgres;

grant select on raster_columns to public;

