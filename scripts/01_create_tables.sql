-- DDL: CRIAÇÃO DO MODELO FÍSICO VIVAFIT

-- 1. Criação da Tabela Aluno
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    peso_kg DECIMAL(5, 2),
    altura_m DECIMAL(3, 2)
);

-- 2. Criação da Tabela Professor
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    especialidade VARCHAR(50)
);

-- 3. Criação da Tabela Plano
CREATE TABLE Plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(50) UNIQUE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    duracao_meses INT NOT NULL
);

-- 4. Criação da Tabela Matrícula (FKs para Aluno e Plano)
CREATE TABLE Matrícula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    status VARCHAR(20) NOT NULL, -- Ativa, Suspensa, Cancelada
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);

-- 5. Criação da Tabela Pagamento (FK para Matrícula)
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL, -- Pago, Pendente, Atrasado
    FOREIGN KEY (id_matricula) REFERENCES Matrícula(id_matricula)
);

-- 6. Criação da Tabela FichaTreino (FKs para Aluno e Professor)
CREATE TABLE FichaTreino (
    id_ficha INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    data_criacao DATE NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- 7. Criação da Tabela Exercício
CREATE TABLE Exercício (
    id_exercicio INT PRIMARY KEY AUTO_INCREMENT,
    nome_exercicio VARCHAR(100) UNIQUE NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL
);

-- 8. Criação da Tabela FichaExercicio (Entidade Associativa N:N - Ficha/Exercício)
CREATE TABLE FichaExercicio (
    id_fichaex INT PRIMARY KEY AUTO_INCREMENT,
    id_ficha INT NOT NULL,
    id_exercicio INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga_kg DECIMAL(6, 2),
    ordem INT,
    FOREIGN KEY (id_ficha) REFERENCES FichaTreino(id_ficha),
    FOREIGN KEY (id_exercicio) REFERENCES Exercício(id_exercicio)
);

-- 9. Criação da Tabela AulaColetiva (FK para Professor)
CREATE TABLE AulaColetiva (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT NOT NULL,
    nome_aula VARCHAR(50) NOT NULL,
    horario_inicio TIME NOT NULL,
    dia_semana VARCHAR(15) NOT NULL,
    capacidade INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- 10. Criação da Tabela InscricaoAula (Entidade Associativa N:N - Aluno/Aula)
CREATE TABLE InscricaoAula (
    id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    data_inscricao DATETIME NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_aula) REFERENCES AulaColetiva(id_aula),
    UNIQUE (id_aluno, id_aula) -- Garante que um aluno se inscreva uma única vez por aula
);