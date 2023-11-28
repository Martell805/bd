/*Customers*/
INSERT INTO customers VALUES (1, 'Company A', '8(495)123-12-12', 'a.company@gmail.com');
INSERT INTO customers VALUES (2, 'Company B', '8(495)321-12-12', 'b.company@b.com');
INSERT INTO customers VALUES (3, 'Company C', '8(495)111-11-11', 'c@company.com');
INSERT INTO customers VALUES (4, 'X-Company', '8(495)222-11-14', 'x@x.com');
INSERT INTO customers VALUES (5, 'O. Corp', '8(495)415-11-18', 'o@corp.com');
/*Notes*/
INSERT INTO notes VALUES (1, 1, 'Любят красные сайты');
INSERT INTO notes VALUES (2, 2, 'Любят зелёные сайты');
INSERT INTO notes VALUES (3, 2, 'Не любят синие сайты');
INSERT INTO notes VALUES (4, 5, 'Не любят сайты');
INSERT INTO notes VALUES (5, 5, 'Много платят');
/*Orders*/
INSERT INTO orders VALUES (1, 1, '2023-06-11', 'Создать сайт');
INSERT INTO orders VALUES (2, 1, '2023-06-15', 'Развернуть сайт');
INSERT INTO orders VALUES (3, 4, '2023-06-25', 'Создать чёрный сайт');
INSERT INTO orders VALUES (4, 5, '2023-07-14', 'Создать красивый сайт');
INSERT INTO orders VALUES (5, 5, '2023-07-30', 'Сделать сайт красивее');
/*Tses*/
INSERT INTO tses VALUES (1, 1, '2023-06-12', 'Создать красный дизайн сайта');
INSERT INTO tses VALUES (2, 1, '2023-06-13', 'Создать бекэнд сайта');
INSERT INTO tses VALUES (3, 1, '2023-06-13', 'Создать фронтэнд сайта');
INSERT INTO tses VALUES (4, 1, '2023-06-15', 'Развернуть сайт');

INSERT INTO tses VALUES (5, 4, '2023-07-14', 'Создать очень красивый дизайн сайта');
INSERT INTO tses VALUES (6, 4, '2023-07-15', 'Создать бекэнд сайта (очень важно!)');
INSERT INTO tses VALUES (7, 4, '2023-07-15', 'Создать фронтэнд сайта (очень важно!)');
/*Teams*/
INSERT INTO teams VALUES (1, 1, 'Дизайнерская команда', 5);
INSERT INTO teams VALUES (2, 1, 'Бекэнд команда', 6);
INSERT INTO teams VALUES (3, 1, 'Фронтэнд команда', 7);
INSERT INTO teams VALUES (4, 0, 'Девопс команда', 4);
/*Jobs*/
INSERT INTO jobs VALUES (1, 'Лидер команды', 4000);
INSERT INTO jobs VALUES (2, 'Старший разработчик', 2000);
INSERT INTO jobs VALUES (3, 'Разработчик', 1000);
INSERT INTO jobs VALUES (4, 'Дизайнер', 1000);
INSERT INTO jobs VALUES (5, 'Девопс', 1500);
INSERT INTO jobs VALUES (6, 'Аналитик', 1500);
/*Employees*/
INSERT INTO employees VALUES (1, 1, 'Лидер', 'Команды', 'Бекэнда', 2);
INSERT INTO employees VALUES (2, 2, 'Старший', 'Разработчик', 'Бекэнда', 2);
INSERT INTO employees VALUES (3, 3, 'Просто', 'Разработчик', 'Бекэнда', 2);

INSERT INTO employees VALUES (4, 1, 'Лидер', 'Команды', 'Дизайна', 1);
INSERT INTO employees VALUES (5, 4, 'Просто', null, 'Дизайнер', 1);

INSERT INTO employees VALUES (6, 1, 'Лидер', 'Команды', 'Фронтэнда', 3);
INSERT INTO employees VALUES (7, 3, 'Просто', 'Разработчик', 'Фронтэнда', 3);

INSERT INTO employees VALUES (8, 1, 'Единственный', 'В-Команде', 'Девопс', 4);
/*Specialisations*/
INSERT INTO specialisations VALUES (1, 'Дизайнер');
INSERT INTO specialisations VALUES (2, 'Бекендер');
INSERT INTO specialisations VALUES (3, 'Фронтендер');
INSERT INTO specialisations VALUES (4, 'Девопс');
/*employees_specialisations*/
INSERT INTO employees_specialisations VALUES (1, 2);
INSERT INTO employees_specialisations VALUES (1, 3);
INSERT INTO employees_specialisations VALUES (2, 2);
INSERT INTO employees_specialisations VALUES (3, 2);

INSERT INTO employees_specialisations VALUES (4, 1);
INSERT INTO employees_specialisations VALUES (4, 3);
INSERT INTO employees_specialisations VALUES (5, 1);

INSERT INTO employees_specialisations VALUES (6, 3);
INSERT INTO employees_specialisations VALUES (7, 3);

INSERT INTO employees_specialisations VALUES (8, 2);
INSERT INTO employees_specialisations VALUES (8, 4);
