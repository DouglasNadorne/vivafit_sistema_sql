Sistema de Gestão para Academia 'VivaFit' (Experiência Prática IV)
Este repositório contém os scripts SQL (DDL e DML) para a implementação e manipulação de dados do Modelo Lógico da Academia VivaFit, desenvolvido na disciplina de Modelagem de Banco de Dados.

O projeto visa demonstrar a correta conversão do modelo lógico normalizado em um modelo físico funcional e a aplicação de comandos de manipulação de dados (DML).

🛠️ Tecnologias e Requisitos
SGBD (Sistema Gerenciador de Banco de Dados): MySQL ou PostgreSQL (Os scripts foram escritos com sintaxe compatível com MySQL).

Cliente SQL: MySQL Workbench, PGAdmin, DBeaver ou extensão SQL do VS Code.

Requisito: Servidor de Banco de Dados deve estar ativo para a execução dos scripts.

🏛️ Modelo Lógico (Entidades Principais)
O banco de dados é composto por 10 tabelas, representando os processos centrais da academia:

Aluno, Professor, Plano, Matrícula, Pagamento.

FichaTreino, Exercício, FichaExercicio (N:N).

AulaColetiva, InscricaoAula (N:N).

📂 Estrutura do Repositório
Os scripts estão organizados numericamente dentro da pasta scripts/ para garantir a correta ordem de execução:

Arquivo,Conteúdo
01_create_tables.sql. Primeiro script a ser executado.
02_insert_data.sql.
03_select_queries.sql.
04_update_delete.sql.


Instruções de Execução
Siga a ordem abaixo para recriar o banco de dados vivafit:

Crie o Esquema: No seu cliente SQL (Workbench/pgAdmin), crie um novo esquema/banco de dados chamado vivafit.

Execução DDL: Execute o script 01_create_tables.sql no esquema vivafit para criar a estrutura das tabelas.

Execução INSERT: Execute o script 02_insert_data.sql para inserir os dados iniciais.

Teste de Consultas: Execute o script 03_select_queries.sql para visualizar os resultados das consultas complexas.

Teste de Modificação: Execute o script 04_update_delete.sql para testar os comandos de atualização e exclusão.

✨ Destaques (Consultas Complexas)
O script 03_select_queries.sql inclui consultas importantes como:

Listagem de Alunos Ativos e Seus Planos (usando JOIN entre 3 tabelas).

Detalhes da Ficha de Treino por ordem de execução.

Cálculo da Receita Total de pagamentos.

Identificação de Alunos Inscritos em Múltiplas Aulas Coletivas (usando GROUP BY e HAVING).