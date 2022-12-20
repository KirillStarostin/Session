create table Разговоры
(
ID_Разговора int Primary key not null,
ID_Телефона int not null,
ID_Тарифа int not null,
Город nvarchar(50) not null,
Дата_разговора date not null,
Продолжительность_в_минутах int not null,
Признак_оплаты nvarchar(50) not null,
)