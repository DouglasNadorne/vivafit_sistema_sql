-- DML: ATUALIZAÇÃO (UPDATE) E EXCLUSÃO (DELETE)

-- ** COMANDOS UPDATE **

-- 1. Atualizar o status da matrícula do aluno Pedro Santos (id_aluno = 3) para 'Ativa'
UPDATE
    Matrícula
SET
    status = 'Ativa'
WHERE
    id_aluno = 3;

-- 2. Aumentar o valor do plano 'Mensal Padrão' em 10%
UPDATE
    Plano
SET
    valor = valor * 1.10
WHERE
    nome_plano = 'Mensal Padrão';

-- 3. Atualizar as observações da Ficha de Treino com 'Treino ABC'
UPDATE
    FichaTreino
SET
    observacoes = CONCAT(observacoes, ' Revisada em 2025-11-25.')
WHERE
    observacoes LIKE '%Treino ABC%';

-- ** COMANDOS DELETE **

-- 1. Excluir a inscrição da aluna Maria Souza (id_aluno = 2) na aula 'Pilates Terapêutico'
DELETE FROM
    InscricaoAula
WHERE
    id_aluno = 2 AND id_aula = (
        SELECT id_aula FROM AulaColetiva WHERE nome_aula = 'Pilates Terapêutico'
    );

-- 2. Excluir o registro de pagamento 'Atrasado' do aluno Pedro Santos (id_matricula = 3)
DELETE FROM
    Pagamento
WHERE
    status = 'Atrasado' AND id_matricula = 3;

-- 3. Excluir a Ficha de Treino criada em '2025-10-05' (É necessário deletar primeiro os registros dependentes na tabela FichaExercicio)

-- 3a. Deleta registros dependentes
DELETE FROM
    FichaExercicio
WHERE
    id_ficha = (SELECT id_ficha FROM FichaTreino WHERE data_criacao = '2025-10-05' LIMIT 1);

-- 3b. Deleta a FichaTreino
DELETE FROM
    FichaTreino
WHERE
    data_criacao = '2025-10-05' LIMIT 1;