select *
from list_medications

-- Сортировка по возрастанию
select * 
from list_medications
order by name
-- или по убыванию
select * 
from list_medications
order by name desc

-- Сортировка с помощью оператора max, min 
select max(list_id), min(list_id)
from list_medications

-- Фильтрация строк с помощью where
select manufacturer
from list_medications
where manufacturer is null


-- вывести все Сердечно Сосудистые или Жаропонижающие
select *
from list_medications
where category = 'Сердечно-Сосудистые' or category = 'Жаропонижающие'

-- находит значения  которые начинаются на "Н" первые две записи по убыванию
select *
from list_medications
where active_substance like 'Н%'
order by name desc
limit 2

-- возвращает только те строки которые присутствуют в обоих запросах
select category
from list_medications
intersect
select category
from category


-- Удаление таблицы
drop table list_medications;
-- удаление столбца в таблице list_medications
alter table list_medications drop column release_form;

-- Переименовать таблицу
alter table active_substance rename to activeSubstance;
-- переименовать столбец
alter table active_substance rename active_id to number_id;

-- Добавление нового столбца
alter table category add column description text;

-- Изменение типа данных столбца
alter table list_medications alter column name set data type varchar(50);