#Criação do banco de dados AGENDA
CREATE SCHEMA AGENDA;

#Criação da tabela AMIGO
CREATE TABLE AMIGO (
    CODIGO INT NOT NULL,
    NOME VARCHAR(40) NOT NULL,
    APELIDO VARCHAR(12) NOT NULL,
    ENDERECO VARCHAR(20) NOT NULL,
    BAIRRO VARCHAR(15) NOT NULL,
    CIDADE VARCHAR(15) NOT NULL,
    ESTADO VARCHAR(2) NOT NULL, 
    TELEFONES VARCHAR(14) NOT NULL,
    PROFISSAO VARCHAR(40) NOT NULL,
    IDADE VARCHAR(3) NOT NULL,
    SALARIO DECIMAL(7,2)
);

#Inclusão co campo CEP na tabela AMIGO
ALTER TABLE AMIGO ADD CEP varchar(9);

#Inclusão co campo DATA_DE_NASCIMENTO na tabela AMIGO
ALTER TABLE AMIGO ADD DATA_DE_NASCIMENTO date;

#Alterar campo CODIGO para chave primaria com auto incremento
ALTER TABLE AMIGO MODIFY COLUMN CODIGO int primary key not null auto_increment;

# Desligar as restrições (conexões)
SET FOREIGN_KEY_CHECKS = 0;

# Inserindo dados na tabela AMIGO
INSERT INTO AMIGO ( NOME,APELIDO,ENDERECO,BAIRRO,CIDADE,ESTADO,TELEFONES,PROFISSAO,IDADE,SALARIO,CEP,DATA_DE_NASCIMENTO) VALUES
('Pedro da Silva',	'Bigode', 'Rua X nº 15',	'Centro',	'Rafard', 'SP', '3491-9911', 'Professor', '30', 1000.00, '13370-000', 19560612),
('Maria Serefina de Souza',	'Mariquinha', 'Rua Y nº 200',	'Padovani',	'Capivari', 'SP', '3491-9922', 'analista', '36', 0, '13360-999', 19850331),
('Rafael Veloso',	'Chulé', 'R dos Sapatos nº 222',	'Bairro do Pés',	'Sorocaba', 'SP', '3491-9933', 'Gerente', '31', 2000.00, '11002-000', 19830908),
('José Carlos Pedrosa',	'Zeca', 'Rua K nº 326',	'Jd Oliveiras',	'Campinas', 'SP', '3491-9944', 'Coordenador', '39', 3000.00, '13005-020', 19770808),
('Abigail Guternberg',	'Biga', 'Avenida II nº 55',	'Pão de Sal',	'Capivari', 'SP', '3491-9955', 'recursos humanos', '38', 800.00, '13360-999', 19810221),
('Francisco Almeida',	'Chico', 'Rua Sem Saída nº 302',	'Buraco Quente',	'Chapecó', 'RS', '3491-9977', 'Professor', '40', 790.00, '80052-005', 19531211),
('João Luis Medeiros',	'Jota', 'Rua XII nº 123',	'Centro',	'Capivari', 'SP', '3491-9988', 'Instrutor', '31', 900.00, '13360-999', 19760716);
#Necessário algumas abreviações para cumprir os requisitos do enunciado

#Alterar o Apelido do Pedro da Silva de Bigode para Pedrinho
UPDATE AMIGO SET APELIDO = "Pedrinho" where APELIDO = "Bigode";

#Alterar o Bairro da Biga para Pão de Açúcar
UPDATE AMIGO SET BAIRRO = "Pão de Açúcar" where APELIDO = "Biga";

#Alterar o CEP da Cidade de CAPIVARI para 13360-000
UPDATE AMIGO SET CEP = "13360-000" where CIDADE = "Capivari";

#Apagar o amigo Zeca
DELETE FROM AMIGO WHERE APELIDO = "Zeca";

select * from amigo;

#Desabilita o safe mode para poder fazer o UPDATE na tabela
SET SQL_SAFE_UPDATES = 0;

#Habilita o safe mode
SET SQL_SAFE_UPDATES = 1;

#Mostra as chaves primárias do banco de dados
SELECT t.table_name as nome_tabela, k.column_name as coluna
FROM information_schema.table_constraints t
JOIN information_schema.key_column_usage k
USING(constraint_name,table_schema,table_name)
WHERE t.constraint_type='PRIMARY KEY'









