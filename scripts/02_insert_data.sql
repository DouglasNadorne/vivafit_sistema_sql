-- DML: INSERÇÃO DE DADOS INICIAIS

-- Aluno (3 Alunos)
INSERT INTO Aluno (nome, data_nascimento, cpf, email, telefone, peso_kg, altura_m) VALUES
('João Silva', '2000-05-15', '11122233344', 'joao.silva@email.com', '11988887777', 78.5, 1.75),
('Maria Souza', '1995-11-20', '55566677788', 'maria.souza@email.com', '11977776666', 62.1, 1.68),
('Pedro Santos', '2003-01-30', '99900011122', 'pedro.santos@email.com', '11966665555', 85.0, 1.88);

-- Professor (2 Professores)
INSERT INTO Professor (nome, cpf, email, telefone, especialidade) VALUES
('Ana Costa', '12345678901', 'ana.costa@vivafit.com', '11955554444', 'Musculação e Pilates'),
('Carlos Lima', '09876543210', 'carlos.lima@vivafit.com', '11944443333', 'Yoga e Spinning');

-- Plano (2 Planos)
INSERT INTO Plano (nome_plano, valor, duracao_meses) VALUES
('Mensal Padrão', 120.00, 1),
('Trimestral Gold', 300.00, 3);

-- Matrícula (3 Matrículas)
INSERT INTO Matrícula (id_aluno, id_plano, data_inicio, data_vencimento, status) VALUES
(1, 2, '2025-10-01', '2026-01-01', 'Ativa'), -- João (Plano Trimestral)
(2, 1, '2025-11-15', '2025-12-15', 'Ativa'), -- Maria (Plano Mensal)
(3, 1, '2025-08-01', '2025-09-01', 'Suspensa'); -- Pedro (Plano Mensal)

-- Pagamento (3 Pagamentos)
INSERT INTO Pagamento (id_matricula, data_pagamento, valor, status) VALUES
(1, '2025-10-01', 300.00, 'Pago'),
(2, '2025-11-15', 120.00, 'Pago'),
(3, '2025-08-01', 120.00, 'Atrasado'); -- Pagamento do Pedro está atrasado

-- Exercício (5 Exercícios)
INSERT INTO Exercício (nome_exercicio, grupo_muscular) VALUES
('Supino Reto', 'Peito'),
('Agachamento Livre', 'Pernas'),
('Remada Curvada', 'Costas'),
('Desenvolvimento Militar', 'Ombro'),
('Prancha', 'Abdômen');

-- FichaTreino (1 Ficha para João, criada por Ana)
INSERT INTO FichaTreino (id_aluno, id_professor, data_criacao, observacoes) VALUES
(1, 1, '2025-10-05', 'Foco em força e hipertrofia. Treino ABC.');

-- FichaExercicio (3 Exercícios na Ficha de João)
INSERT INTO FichaExercicio (id_ficha, id_exercicio, series, repeticoes, carga_kg, ordem) VALUES
(1, 1, 4, 10, 45.0, 1), -- Supino
(1, 3, 3, 12, 30.0, 2), -- Remada
(1, 5, 3, 60, 0.0, 3); -- Prancha

-- AulaColetiva (2 Aulas, 1 por Professor)
INSERT INTO AulaColetiva (id_professor, nome_aula, horario_inicio, dia_semana, capacidade) VALUES
(2, 'Spinning Matinal', '07:00:00', 'Segunda', 20), -- Carlos
(1, 'Pilates Terapêutico', '18:30:00', 'Quarta', 15); -- Ana

-- InscricaoAula (3 Inscrições)
INSERT INTO InscricaoAula (id_aluno, id_aula, data_inscricao) VALUES
(1, 1, '2025-10-02 08:00:00'), -- João se inscreve em Spinning
(2, 1, '2025-11-16 10:00:00'), -- Maria se inscreve em Spinning
(2, 2, '2025-11-16 10:05:00'); -- Maria se inscreve em Pilates (2 aulas)