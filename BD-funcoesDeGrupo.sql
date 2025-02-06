-- Exiba os salários maior, médio, menor e a soma de todos os salários de todos os funcionários. 
-- Coloque um label nas colunas Máximo, Mínimo, Soma e Média, respectivamente. 
-- Arredonde os resultados para o número inteiro mais próximo. Salve a instrução como EXEGRUP01.SQL.
SELECT ROUND(MAX(salary)) "Máximo", ROUND(MIN(salary)) "Mínimo", ROUND(SUM(salary)) "Soma", ROUND(AVG(salary)) "Média" FROM hr.employees;

-- Modifique o EXEGRUP01.SQL para exibir o salário maior, médio, menor e a soma de todos os salários para cada tipo de cargo. Salve 
-- novamente como EXEGRUP02.SQL. Execute a instrução
SELECT job_id, ROUND(MAX(salary)) "Maior", ROUND(AVG(salary)) "Médio", ROUND(MIN(salary)) "Menor", ROUND(SUM(salary)) "Soma"  FROM hr.employees GROUP BY job_id;

-- Crie uma consulta para exibir o número de pessoas com o mesmo cargo.
SELECT job_id, COUNT(job_id) FROM hr.employees GROUP BY job_id;

-- Determine o número de gerentes sem listá-los. Coloque um label (APELIDO NAS COLUNAS) na coluna Número de Gerentes.
SELECT COUNT(manager_id) "Número de Gerentes" FROM hr.employees GROUP BY department_id;

-- Crie uma consulta para exibir a diferença entre os maiores e menores salários; coloque um label na coluna DIFERENCA.
SELECT department_id, MAX(salary), MIN(salary), (MAX(salary)- MIN(salary)) "Diferença" FROM hr.employees GROUP BY department_id ORDER BY department_id;



