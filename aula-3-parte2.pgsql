
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE comentario(
    id SERIAL PRIMARY KEY,
    texto TEXT,
    usuario_id INTEGER REFERENCES usuario(id) -- chave estrangeira, FK
);

-- Deleta a tabela inteira
DROP TABLE comentario;
--não podemos dar drop na tabela usuario sem antes dar Drop na tabela comentário, ou utilizamos cascade
DROP TABLE usuario CASCADE; -- remove a FK da outra tabela

CREATE TABLE gerente(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE filial(
    id SERIAL PRIMARY KEY,
    regiao TEXT,
    gerente_id INTEGER REFERENCES gerente(id)
);

-------------------------------

CREATE SCHEMA hospital;

DROP TABLE hospital.medico;

CREATE TABLE hospital.medico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE hospital.paciente(
    id SERIAL PRIMARY KEY,
    nome TEXT
);

CREATE TABLE hospital.consulta (
  medico_id   INTEGER REFERENCES hospital.medico(id) ON UPDATE CASCADE
, paciente_id INTEGER REFERENCES hospital.paciente(id) ON UPDATE CASCADE
, data TEXT
, CONSTRAINT consulta_pkey PRIMARY KEY (medico_id, paciente_id)
);

INSERT INTO hospital.medico(nome)
VALUES 
('Tebas'),
('Amebas'),
('Zebas'),
('Crebas'),
('Perebas')
;
INSERT INTO hospital.paciente(nome)
VALUES 
('Ritierri'),
('Rodrigo'),
('Rodinei'),
('Raiul');
INSERT INTO hospital.consulta(medico_id, paciente_id)
VALUES (1,1);

--------------------------------------------------------------------

SELECT * FROM hospital.medico;
SELECT * FROM hospital.paciente;
SELECT * FROM hospital.consulta;


CREATE SCHEMA hospital;

DROP TABLE hospital.consulta;
DROP TABLE hospital.paciente;
DROP TABLE hospital.medico;

CREATE TABLE hospital.medico (
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


INSERT INTO hospital.medico(id,nome)
VALUES 
(1,'Tebas'),
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

