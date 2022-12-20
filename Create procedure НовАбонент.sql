create procedure НовАбонент
@ID_Абонента int,
@ФИО nvarchar(50),
@Адрес nvarchar(50)
AS
Begin
Insert into Абоненты
Values
(
@ID_Абонента, 
@ФИО,
@Адрес
)
end