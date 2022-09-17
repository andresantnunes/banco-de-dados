SELECT * FROM hospital.medico;
SELECT * FROM hospital.paciente;
SELECT * FROM hospital.consulta;


CREATE SCHEMA hospital;

DROP TABLE consulta;
DROP TABLE paciente;
DROP TABLE medico;

CREATE TABLE marktplace.medico (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE hospital.paciente(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE hospital.consulta (
  medico_id   INTEGER REFERENCES hospital.medico(id) ON UPDATE CASCADE
, paciente_id INTEGER REFERENCES hospital.paciente(id) ON UPDATE CASCADE
, data TEXT
, CONSTRAINT consulta_pkey PRIMARY KEY (medico_id, paciente_id)
);

-- N:M entre médico e cliente
CREATE TABLE hospital.medico_cliente (
  medico_id   INTEGER REFERENCES hospital.medico(id) ON UPDATE CASCADE
, paciente_id INTEGER REFERENCES hospital.paciente(id) ON UPDATE CASCADE
, CONSTRAINT consulta_pkey PRIMARY KEY (medico_id, paciente_id)
);

INSERT INTO hospital.medico(id,nome)
VALUES 
(2,'Amebas'),
(3,'Zebas'),
(4,'Crebas'),
(5,'Perebas')
;
INSERT INTO hospital.paciente(id,nome)
VALUES 
(1,'Ritierri'),
(2,'Rodrigo'),
(3,'Rodinei'),
(4,'Raiku'),
(5,'RAU!!');

INSERT INTO hospital.consulta (medico_id, paciente_id, data)
VALUES 
(1,2,'02/09/2023'),
(1,3,'02/09/2023'),
(1,4,'02/09/2023'),
(2,4,'02/09/2023'),
(3,4,'02/09/2023');


DROP SCHEMA marktplace;

DROP TABLE marktplace.produto;

ALTER TABLE marktplace.produto
ALTER COLUMN valor
TYPE NUMERIC USING valor::NUMERIC;



CREATE TABLE hospital.medico_cliente (
  medico_id   INTEGER REFERENCES hospital.medico(id) ON DELETE RESTRICT
, paciente_id INTEGER REFERENCES hospital.paciente(id) ON DELETE RESTRICT
, CONSTRAINT consulta_pkey PRIMARY KEY (medico_id, paciente_id)
);


UDPATE hospital.medico SET id=11 WHERE id=1;
UDPATE hospital.paciente SET id=11 WHERE id=1;
