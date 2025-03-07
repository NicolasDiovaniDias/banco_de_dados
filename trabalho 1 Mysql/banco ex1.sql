/* para relembrar, crio 2 databases(bancos) entro em uma por vez
e crio uma tabela, na tabela eu crio o cliente*/
CREATE DATABASE SENAC;
CREATE DATABASE UDEMY;
USE UDEMY;
CREATE TABLE CLIENTES(
    NOME VARCHAR(30),
    NASCIMENTO INT(8),
    SEXO CHAR(1)
);
USE SENAC;
CREATE TABLE CLIENTES(
    NOME VARCHAR(30),
    NASCIMENTO INT(8),
    SEXO CHAR(1)
);
