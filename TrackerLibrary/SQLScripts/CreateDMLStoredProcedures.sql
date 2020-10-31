Create Procedure dbo.spPrizes_Insert
	@PlaceNumber int, 
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output
As
Begin
	Set NoCount On;
	
	Insert into dbo.Prizes (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	Values (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	Select @id = SCOPE_IDENTITY();
End

Go

Create Procedure dbo.spPeople_Insert
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@EmailAddress nvarchar(200),
	@CellphoneNumber varchar(20),
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert into dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	Values (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	Select @id = SCOPE_IDENTITY();
End

Go

Create Procedure dbo.spTeams_Insert
	@TeamName nvarchar(100),
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert Into dbo.Teams (TeamName)
	Values (@TeamName);

	Select @id = SCOPE_IDENTITY();
End

Go

Create Procedure dbo.spTeamMembers_Insert
	@TeamId int, 
	@PersonId int,
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert Into dbo.TeamMembers (TeamId, PersonId)
	Values (@TeamId, @PersonId);

	Select @id = SCOPE_IDENTITY();

End

Go