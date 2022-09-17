CREATE SCHEMA comentario;

CREATE TABLE comentario.usuario(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

DROP TABLE comentario.campo_comentario;
CREATE TABLE comentario.campo_comentario(
    id INTEGER PRIMARY KEY,
    texto TEXT,
    usuario_id INTEGER REFERENCES comentario.usuario(id)
);

DELETE FROM comentario.usuario;
INSERT INTO comentario.usuario( id, nome)
VALUES
(1,'Leonardo'),
(2,'Laerci'),
(3,'Lucas'),
(4,'Leonildo'),
(5,'Larci III');

DELETE FROM comentario.campo_comentario;
INSERT INTO comentario.campo_comentario( id, texto, usuario_id)
VALUES
(1,'Comentario 1', NULL), 
(2,'Comentario 2', 1),
(3,'Comentario 3', 3),
(4,'Comentario 4', 4),
(5,'Comentario 5', 2),
(55,'Solitario',NULL);

SELECT * FROM comentario.usuario u
JOIN comentario.campo_comentario c ON u.id = c.usuario_id;

SELECT c.texto, u.nome FROM 
comentario.usuario u Right JOIN comentario.campo_comentario c
ON u.id = c.usuario_id;

---------------- Outros exemplos

DROP TABLE marktplace.anuncio;
DROP TABLE marktplace.cliente;

CREATE TABLE marktplace.anuncio(
id_produto INTEGER REFERENCES marktplace.produto ON UPDATE CASCADE
);

CREATE TABLE marktplace.cliente(
cpf INTEGER PRIMARY KEY,
nome VARCHAR(15),
idade INTEGER,
saldo INTEGER
);

CREATE TABLE marktplace.compra(
cliente_id INTEGER REFERENCES marktplace.cliente ON UPDATE CASCADE,
produto_id INTEGER PRIMARY KEY REFERENCES marktplace.produto ON UPDATE CASCADE
);

------------------------------
CREATE SCHEMA hospital;

DROP TABLE consulta;
DROP TABLE paciente;
DROP TABLE medico;

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

-- N:M entre médico e cliente
DROP TABLE hospital.consulta;
CREATE TABLE hospital.consulta (
  medico_id   INTEGER REFERENCES hospital.medico(id) ON DELETE CASCADE
, paciente_id INTEGER REFERENCES hospital.paciente(id) ON DELETE CASCADE
, CONSTRAINT consulta_pkey PRIMARY KEY (medico_id, paciente_id)
);

SELECT * FROM hospital.medico;
INSERT INTO hospital.medico(id,nome)
VALUES 
(,'Amebas'),
(2,'Amebas'),
(3,'Zebas'),
(4,'Crebas'),
(5,'Perebas')
;

SELECT * FROM hospital.paciente;
DELETE FROM hospital.paciente WHERE id = 4;
INSERT INTO hospital.paciente(id,nome)
VALUES 
(1,'Ritierri'),
(2,'Rodrigo'),
(3,'Rodinei'),
(4,'Raiku'),
(5,'RAU!!');

SELECT * FROM hospital.consulta;
INSERT INTO hospital.consulta (medico_id, paciente_id)
VALUES 
(1,2),
(2,3),
(5,4),
(2,4),
(3,4);

SELECT m.nome, p.nome  FROM hospital.consulta c
JOIN hospital.medico m on c.medico_id = m.id
JOIN hospital.paciente p ON c.paciente_id = p.id;

SELECT *  FROM hospital.consulta c
JOIN hospital.medico m on c.medico_id = m.id
JOIN hospital.paciente p ON c.paciente_id = p.id;




-----------------ALTER

UPDATE hospital.medico SET id=11 WHERE id=1;
UPDATE hospital.paciente SET id=11 WHERE id=1;

SELECT * FROM hospital.consulta c
JOIN hospital.medico m on c.medico_id = m.id
JOIN hospital.paciente p ON c.paciente_id = p.id; 

SELECT * FROM usuario 
JOIN comentario ON usuario.id = comentario.usuario_id;

INSERT INTO usuario(id, nome)
VALUES (1,'A'),
(2,'B'),
(3,'C'),
(4,'D'),
(5,'E'),
(6,'F'),
(7,'G');

INSERT INTO comentario(id,texto, usuario_id)
VALUES 
(1,'A',2),
(2,'B',3),
(3,'C',4),
(4,'D',5),
(5,'E',3),
(6,'F',1),
(7,'G',NULL); 

SELECT * FROM usuario 
JOIN comentario ON usuario.id = comentario.usuario_id
WHERE usuario.id > 3
AND comentario.texto='D';



ALTER TABLE usuario
ADD COLUMN idade VARCHAR; -- adiciona uma coluna nova a tabela usuario

ALTER TABLE usuario
DROP COLUMN idade; -- remove a coluna idade da tabela usuario

ALTER TABLE usuario
ALTER COLUMN idade
TYPER INTEGER USING idade::INTEGER; -- altera o tipo da coluna idade da tabela usuario


ALTER TABLE usuario
RENAME TO pessoa; -- renomeia a tabela

ALTER TABLE empresa.funcionario
SET SCHEMA industria; -- renomeia o Schema

ALTER DATABASE empresa
RENAME TO minha_empresa; -- renomeia o Banco de Dados