-- Criando uma tabela
CREATE TABLE student (
	studentID INT,
	name VARCHAR(50) NOT NULL,
	major VARCHAR(50) DEFAULT 'Undecided'
	PRIMARY KEY(studentID)
);

--INSERT INTO student VALUES() para adicionar valores na tabela
INSERT INTO student VALUES(1, 'Julia', 'Biologia')
INSERT INTO student VALUES(2, 'Joao', 'Ciencia da computacao')
INSERT INTO student VALUES(3, 'Jack', 'Sociologia')
INSERT INTO student VALUES(4, 'Tiago', 'Biologia')
INSERT INTO student VALUES(5, 'Bia', 'Historia')
INSERT INTO student(studentID, name) VALUES(6, 'Renata') -- especificando valores que vão ser adicionados

ALTER TABLE student -- altera a tabela
ADD sex VARCHAR(20) DEFAULT 'NB', faltas INT; -- adicionando colunas em uma tabela existente

INSERT INTO student(studentID, name, major, faltas) VALUES(7, 'Caio', 'Ciencia da computacao', 3)

EXEC sp_RENAME 'student.major', 'curso', 'COLUMN' -- muda nome de uma coluna

-- WILDCARDS --
-- atualizando os gêneros
UPDATE student
SET sex = 'F'			-- atualiza o valor de uma célula da coluna especificada
WHERE name LIKE '%a'; 

UPDATE student
SET sex = 'M'
WHERE sex is NULL;

SELECT *
FROM student             -- consulta de valores para os estudantes com nome que tenha 'go' depois de três caracteres
WHERE name LIKE '___go'

SELECT *				-- consulta de valores para os estudantes com nome que tenha 'a' depois de dois caracteres
FROM student
WHERE name LIKE '__a%'

SELECT *
FROM student			-- consulta de valores para os estudantes com nome que tenha 'a' em qualquer lugar do nome
WHERE name LIKE '%a%'

DROP TABLE student -- apaga toda a tabela
DELETE FROM student -- apaga valores da tabela

SELECT * FROM student -- mostra  a tabela

-- também há a possibilidade de especificar o que quer ser visto
SELECT curso FROM student -- mostrará apenas os cursos

SELECT COUNT(studentID) AS Numero_de_estudantes FROM student -- mostra a quantidade de valores da coluna especificada
-- COUNT conta a quantidade de alguma coluna
-- SUM soma valores inteiros 
-- AVG retorna média 

-- Mais algumas possibilidades de consultas
SELECT *
FROM student
ORDER BY name;

SELECT *
FROM student
ORDER BY name DESC;

-- ORDER BY ordena a coluna especificada, o comando tem ASC (menor para maior) como default. DESC é para ordenar do maior para o menor

-- Atualizando valores
UPDATE student
SET curso = 'Bio'
WHERE curso = 'Biologia';

UPDATE student
SET curso = 'Cien. da comp.'
WHERE curso = 'Ciencia da computacao';

UPDATE student
SET curso = 'Socio'
WHERE curso = 'Sociologia';

UPDATE student
SET curso = 'Hist'
WHERE curso = 'Historia';

ALTER TABLE student
ADD status_estudante VARCHAR(20);

ALTER TABLE student
ADD faltas_per DECIMAL(3,2);

BEGIN TRANSACTION;
UPDATE student
SET faltas_per = faltas
ROLLBACK;

UPDATE student
SET faltas_per = faltas_per/10

UPDATE student
SET status_estudante = 'Reprovado por faltar'
WHERE faltas_per > 0.25

UPDATE student
SET status_estudante = 'Cursando'
WHERE faltas_per <= 0.25

SELECT * 
FROM student 
WHERE curso IN ('Bio', 'Hist')

SELECT COUNT(sex) AS 'qtd do genero', sex
FROM student 
GROUP BY sex;

SELECT SUM(faltas) AS 'Numero total de faltas'
FROM student;

SELECT AVG(faltas) AS 'Media de faltas'
FROM student;

SELECT * FROM student;

DELETE FROM student


