-- Exiba o número do funcionário, o nome, o slário eo aumento salarial de 15%
-- expresso como número inteiro. Coloque um label na coluna Novo Salário
-- Para adicionar uma coluna que subtrairá o salário antigo do novo salário
-- Coloque um label na coluna Diferença. Execute novamente a consulta

select * from hr.employees
select employee_id, first_name, salary, ROUND(salary*1.15) "new_salary", ((salary*1.15)-salary) "diferenca" from hr.employees

    
-- Crie uma consulta que exiba os sobrenomes dos funcionários, a primeira letra 
-- maiuscula e o tamanho dos nomes para todos os funcionários cujo nome seja iniciado por A, J ou M. Classifique os resultados em order alfabética.
select INITCAP(last_name), length(last_name) from hr.employees where last_name like 'A%' or last_name like 'J%' or last_name like 'M%' Order By last_name

-- Funções de Grupo:
-- Exibir a data de admissão mais antiga e a mais nova
SELECT MIN(hire_date), MAX(hire_date) FROM hr.employees

-- Exibir o menor e maior salário da empresa
SELECT MIN(salary), Max(salary) FROM hr.employees

--Tambem com string
SELECT MIN(first_name), MAX(first_name) FROM hr.employees

-- Exibir a media aritmetica salarial, a soma salarial e a quantidade de empregados
SELECT ROUND(AVG(salary),2), SUM(salary), COUNT(employee_id), COUNT(*) FROM hr.employees;

-- Exibir a quantidade de departamentos com funcionarios
SELECT COUNT(department_id), COUNT(DISTINCT department_id) FROM hr.employees

-- GROUP BY: cria grupos, divisões com funções de grupo
-- Exibir a quantidade de empregados agrupados por departamento
-- a) FORMA INCORRETA
SELECT department_id, COUNT(employee_id) FROM hr.employees

-- b) FORMA CORRETA SEM EXIBIR O DEPTO
select COUNT (employee_id) from hr.employees group by department_id

-- c) FORMA CORRETA. EXIBINDO O DEPTO
SELECT department_id, COUNT(employee_id) from hr.employees GROUP BY department_id;

-- Podemos fazer grupo, sob grupo
-- Alterar para exibir por depto e por cargo, a soma e a quantidade de empregados
SELECT department_id, job_id, SUM(salary), COUNT(*)
FROM hr.employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- CONDIÇÕES (RESTRIÇÕES) COM FUNÇÕES DE GRUPO: HAVING
-- A clausula WHERE não permite ter funções de grupo
-- Exibir somente quando a quantidade de empregados do depto for acima de 5
-- a) WHERE (NÃO FUNCIONA)
SELECT department_id, COUNT (employee_id)
FROM hr.employees
WHERE COUNT(employee_id) > 5
GROUP BY department_id;

-- b) HAVING (RESTRIÇÃO COM FUNÇÕES DE GRUPO)
SELECT department_id, COUNT (employee_id)
FROM hr.employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

-- JUNTANDO TUDO
-- EXIBIR O ID DO DEPARTAMENTO, A SOMA SALARIAL DOS EMPREGADOS DOS DEPARTAMENTOS COM ID
-- MENORES QUE 50. SOMENTE QUANDO A SOMA SALARIAL FOR MAIOR OU IGUAL A 15000. OREDENANDO PELO DPTO
SELECT department_id "Depto", SUM(salary) "Soma"
FROM hr.employees
WHERE department_id < 50
GROUP BY department_id
HAVING SUM(salary) >= 15000
ORDER BY department_id

-- EXERCICIOS JUNTOS
-- Exibir a soma salarial por cargo de cada depto dos deptos com id menor que 60.
SELECT department_id, job_id, SUM(salary)
FROM hr.employees
WHERE department_id < 60
GROUP BY department_id, job_id;

-- GROUP BY AVANÇADO - SOMENTE ORACLE
-- alterar para exibir colunas de sub totais por departamento incluindo um total geral (ROLLUP)
SELECT department_id, job_id, SUM (salary) FROM hr.employees
WHERE department_id < 60
GROUP BY ROLLUP(department_id, job_id);

-- alterar para exibir colunas de sub totais por departamento, a soma por 
-- cargo independete do depto, incluindo um total geral (CUBE) - somente ORACLE
SELECT department_id, job_id, SUM (salary) FROM hr.employees
WHERE department_id < 60
GROUP BY CUBE(department_id, job_id);






