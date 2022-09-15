CREATE DATABASE empresa;

CREATE SCHEMA empresa;

CREATE TABLE empresa.funcionario (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    idade INTEGER,
    endereco TEXT,
    funcao TEXT
);

INSERT INTO empresa.funcionario( id, nome, idade, endereco, funcao)
VALUES (1,'Antonio',26,'Lago Azul', 'Gerente');

SELECT * FROM empresa.funcionario;
SELECT nome,funcao FROM empresa.funcionario;
SELECT nome,funcao FROM empresa.funcionario WHERE id<>3;

UPDATE empresa.funcionario SET funcao='Gerente' WHERE id = 3;
UPDATE empresa.funcionario SET idade=24 WHERE funcao = 'Programador';

DELETE 