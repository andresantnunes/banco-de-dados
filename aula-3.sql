CREATE SCHEMA marktplace;

CREATE TABLE marktplace.produto(
id INTEGER PRIMARY KEY,
nome VARCHAR(50),
valor integer
);

-- exercicio2

INSERT INTO marktplace.produto(id, nome, valor)
VALUES (1, 'Sabão', 26); 

INSERT INTO marktplace.produto(id, nome, valor)
VALUES (2, 'Sabão', 26); 

INSERT INTO marktplace.produto(id, nome, valor)
VALUES (3, 'Sabão', 1); 

UPDATE marktplace.produto SET id= 100.0 WHERE id = 2; --assim fica melhor.

SELECT * FROM marktplace.produto;