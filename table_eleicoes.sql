Create table "eleicoes"
(
	"id_eleicao" Serial NOT NULL,
	"data_inicio" Timestamp,
	"data_termino" Timestamp,
	"finalizada" Boolean Default FALSE,
 primary key ("id_eleicao")
) Without Oids;