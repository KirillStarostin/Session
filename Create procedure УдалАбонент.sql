create procedure ”далјбонент
@ID_јбонента Int
AS
Begin
delete from јбоненты
Where ID_јбонента = @ID_јбонента
end