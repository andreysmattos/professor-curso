CREATE DATABASE `curso_professor`;

use `curso_professor`;

# Tabela professor
CREATE TABLE `professor` (
	idProfessor int not null primary key auto_increment,	
	nome varchar(255) not null,
	sexo enum('M', 'F'),
	idade int not null
);


# Tabela curso
CREATE TABLE `curso` (
	idCurso int not null primary key auto_increment,
	nome varchar(255) not null,
	inicio DATETIME,
	fim DATETIME
);


# Tabela que faz relação entre curso e professor
CREATE TABLE `professor_curso` (
	idProfessorCurso int not null primary key auto_increment,
	id_professor int not null,
	id_curso int not null,
	FOREIGN KEY (id_professor) REFERENCES `professor` (idProfessor),
	FOREIGN KEY (id_curso) REFERENCES `curso` (idCurso)
);


/* INSERTS */

# Professor
INSERT INTO `professor` (nome, sexo, idade) VALUES ('Marcos', 'M', 43);
INSERT INTO `professor` (nome, sexo, idade) VALUES ('Flávia', 'F', 38);
INSERT INTO `professor` (nome, sexo, idade) VALUES ('Rogerio', 'M', 31);

# Curso
INSERT INTO `curso` (nome, inicio, fim) VALUES ('Banco de dados', '2015-12-28 13:00:00', '2016-02-15 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('HTML e CSS', '2015-12-15 13:00:00', '2016-02-18 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('PHP', '2015-12-28 13:00:00', '2016-02-17 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('Orientação a Objetos', '2015-12-28 13:00:00', '2016-02-15 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('Git e Github', '2015-12-28 13:00:00', '2016-02-18 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('Desenho', '2015-12-28 13:00:00', '2016-02-19 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('Javascript', '2015-12-28 13:00:00', '2016-06-15 13:00:00');
INSERT INTO `curso` (nome, inicio, fim) VALUES ('UX e UI', '2015-12-28 13:00:00', '2016-02-13 13:00:00');

# Relacionamento entre curso e professor;

#Marcos(ID = 1) será o professor do curso de Banco de dados, Git e Github e Desenho
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (1, 4);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (1, 8);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (1, 9);

# Flávia (ID = 2) será professora do curso de HTML e CSS, Javascript, UX e UI, desenho (junto com marcos)
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (2, 5);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (2, 10);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (2, 11);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (2, 9);


# Rogerio em todos os cursos
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 4);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 5);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 6);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 7);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 8);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 9);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 10);
INSERT INTO `professor_curso` (id_professor, id_curso) VALUES (3, 11);



/* SELECTS */

# Atenção nessa query, é aqui que a magica acontece!! 
SELECT p.nome, p.sexo, p.idade, c.nome as 'Nome do Curso' FROM `professor` as p
INNER JOIN `professor_curso` as pc 
ON p.idProfessor = pc.id_professor
INNER JOIN `curso` as c
ON c.idCurso = pc.id_curso;


# Pesquisa por curso para usar no PHP
SELECT p.nome, p.sexo, p.idade, c.nome as 'nome_curso'
		FROM `professor` as p
		INNER JOIN `professor_curso` as pc 
		ON p.idProfessor = pc.id_professor
		INNER JOIN `curso` as c
		ON c.idCurso = pc.id_curso
		WHERE c.nome LIKE '%html%';


# Pesquisa por professor para usar no PHP
SELECT p.nome, p.sexo, p.idade, c.nome as 'nome_curso'
		FROM `professor` as p
		INNER JOIN `professor_curso` as pc 
		ON p.idProfessor = pc.id_professor
		INNER JOIN `curso` as c
		ON c.idCurso = pc.id_curso
		WHERE p.nome LIKE '%roge%'



# TESTE BRUNO // FUNCIONTOU
SELECT p.nome , 
GROUP_CONCAT(DISTINCT c.nome ORDER BY c.nome DESC SEPARATOR ', ') as 'Cursos',
 p.sexo, p.idade
		FROM `professor` as p
		INNER JOIN `professor_curso` as pc 
		ON p.idProfessor = pc.id_professor
		INNER JOIN `curso` as c
		ON c.idCurso = pc.id_curso
		WHERE p.nome LIKE '%roge%'
