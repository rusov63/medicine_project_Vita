-- Создание базы данных
create database Medicine_directory

-- Создание таблицы "Действующее вещество"
create table active_substance
(
	active_id serial primary key,
	active_substance varchar(100) not null
);

-- Наполнение таблицы "Действующее вещество"
insert into active_substance values
(1, 'Нитроглицерин'),
(2, 'Ксилометазолин'),
(3, 'Ибупрофен');


-- Создание таблицы "Лекарственные средства"
create table list_medications
(
	list_id serial primary key,
	name varchar(100) not null,
	active_substance varchar(100) not null,
	manufacturer varchar(100) not null,
	release_form varchar(100) not null,
	description text not null,
	category varchar(100) not null
);

-- Наполнение таблицы "Лекарственные средства"
insert into list_medications values
(1, 'Нитрокор', 'Нитроглицерин', 'Фармстандарт-Лексредства','Таблетки подъязычные', 'Таблетки белого или почти белого цвета', 'Сердечно Сосудистые'),
(2, 'Нитроглицерин', 'Нитроглицерин', 'Озон Фарм', 'Таблетки подъязычные', 
 'Таблетки от белого до белого с желтоватым оттенком цвета', 'Сердечно Сосудистые'),
(3, 'Нитроспрей', 'Нитроглицерин', 'Фармстандарт-Лексредства', 'Спрей подъязычный', 
 'прозрачная бесцветная жидкость, находящаяся во флаконе с механическим дозирующим насосом', 'Сердечно Сосудистые'),
(4, 'Отривин', 'Ксилометазолин', 'Гск Консьюмер Хелскер С А', 'Спрей назальный', 
 'Прозрачный, от бесцветного до слегка желтоватого цвета раствор, практически без запаха', 'Сосудосуживающие'),
(5, 'Ксилокт', 'Ксилометазолин', 'Гротекс ООО', 'Капли назальные', 'Прозрачная бесцветная или светло-желтая жидкость', 'Сосудосуживающие'),
(6, 'Ибупрофен', 'Ибупрофен', 'Озон Фарм ООО', 'Таблетки, покрытые пленочной оболочкой', 
 'Круглые, двояковыпуклые таблетки, покрытые пленочной оболочкой белого или почти белого цвета', 'Жаропонижающие'),
(7, 'Некст', 'Ибупрофен', 'Минскинтеркапс', 'Капсулы', 'Капсулы мягкие желатиновые овальной формы', 'Жаропонижающие')
 

-- Создание таблицы, связь между "Действующее вещество и Лекарственные средства"
create table ActiveSubstance_ListMedications
(
	active_id int references active_substance,
	list_id int references list_medications,
	primary key (active_id, list_id)
);

-- Наполнение таблицы "Действующее вещество и Лекарственные средства"
insert into ActiveSubstance_ListMedications values
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7)


-- Создание таблицы "Категории"
create table category
(
	category_id serial primary key,
	category varchar(100) not null
)

-- Наполнение таблицы "Категории"
insert into category values
(1, 'Сердечно-Сосудистые'),
(2, 'Сосудосуживающие'),
(3, 'Жаропонижающие')

-- Создание таблицы, связь между "Лекарственные средства и Категории"
create table ListMedications_Category
(
	category_id int references category,
	list_id int references list_medications,
	primary key (category_id, list_id)
);

-- Наполнение таблицы "Лекарственные средства и Категории"
insert into ListMedications_Category values
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7)