Create table "eleicoes"
(
	"id_eleicao" Serial NOT NULL,
	"data_inicio" Timestamp,
	"data_termino" Timestamp,
	"finalizada" Boolean Default FALSE,
 primary key ("id_eleicao")
) Without Oids;

ALTER TABLE partidos
  DROP CONSTRAINT partidos_presidente_fkey;

  ALTER TABLE partidos
   ALTER COLUMN presidente TYPE character varying(255);

ALTER TABLE partidos
  DROP COLUMN estado;
