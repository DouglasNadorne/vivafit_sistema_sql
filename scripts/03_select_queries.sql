-- DML: CONSULTAS (SELECT)

-- 1. Listar todos os alunos ATIVOS e o nome do Plano contratado (uso de JOIN e WHERE)
SELECT
    A.nome AS Aluno,
    P.nome_plano AS Plano,
    M.data_vencimento AS Vencimento
FROM
    Aluno A
JOIN
    Matrícula M ON A.id_aluno = M.id_aluno
JOIN
    Plano P ON M.id_plano = P.id_plano
WHERE
    M.status = 'Ativa';

-- 2. Listar os exercícios da Ficha de Treino 'Foco em força e hipertrofia. Treino ABC.', ordenados pela execução (uso de JOIN e ORDER BY)
SELECT
    A.nome AS Aluno,
    E.nome_exercicio AS Exercício,
    FE.series,
    FE.repeticoes,
    FE.carga_kg
FROM
    FichaTreino FT
JOIN
    FichaExercicio FE ON FT.id_ficha = FE.id_ficha
JOIN
    Exercício E ON FE.id_exercicio = E.id_exercicio
JOIN
    Aluno A ON FT.id_aluno = A.id_aluno
WHERE
    FT.observacoes LIKE '%hipertrofia%'
ORDER BY
    FE.ordem ASC;

-- 3. Listar os professores e as aulas coletivas que ministram às 'Segunda' (uso de JOIN e WHERE)
SELECT
    P.nome AS Professor,
    AC.nome_aula AS Aula
FROM
    Professor P
JOIN
    AulaColetiva AC ON P.id_professor = AC.id_professor
WHERE
    AC.dia_semana = 'Segunda';

-- 4. Calcular a receita total de pagamentos que estão 'Pago' (uso de SUM e WHERE)
SELECT
    SUM(valor) AS Receita_Total_Paga
FROM
    Pagamento
WHERE
    status = 'Pago';

-- 5. Listar os alunos inscritos em mais de uma Aula Coletiva (uso de GROUP BY e HAVING)
SELECT
    A.nome AS Aluno,
    COUNT(IA.id_inscricao) AS Total_Aulas
FROM
    Aluno A
JOIN
    InscricaoAula IA ON A.id_aluno = IA.id_aluno
GROUP BY
    A.id_aluno, A.nome
HAVING
    COUNT(IA.id_inscricao) > 1;