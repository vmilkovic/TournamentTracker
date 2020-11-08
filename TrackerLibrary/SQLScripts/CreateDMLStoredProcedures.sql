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

Create Procedure dbo.spTournaments_Insert
	@TournamentName nvarchar(200),
	@EntryFee money,
	@id int = 0 output
As
Begin
	Set NoCount On;
	
	Insert Into dbo.Tournaments (TournamentName, EntryFee, Active)
	Values(@TournamentName, @EntryFee, 1);

	Select @id = SCOPE_IDENTITY();
End
Go

Create Procedure dbo.spTournamentPrizes_Insert
	@TournamentId int,
	@PrizeId int,
	@id int = 0 output
As
Begin
	Set NoCount On;
	
	Insert Into dbo.TournamentPrizes (TournamentId, PrizeId)
	Values (@TournamentId, @PrizeId);

	Select @id = SCOPE_IDENTITY();
End
Go

Create Procedure dbo.spTournamentEntries_Insert
	@TournamentId int,
	@TeamId int,
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert Into dbo.TournamentEntries (TournamentId, TeamId)
	Values (@TournamentId, @TeamId);

	Select @id = SCOPE_IDENTITY();
End
Go

Create Procedure dbo.spMatchups_Insert
	@TournamentId int,
	@MatchupRound int,
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert Into dbo.Matchups (TournamentId, MatchupRound)
	Values (@TournamentId, @MatchupRound);

	Select @id = SCOPE_IDENTITY();
End
Go

Create Procedure dbo.spMatchupEntries_Insert
	@MatchupId int,
	@ParentMatchupId int,
	@TeamCompetingId int,
	@id int = 0 output
As
Begin
	Set NoCount On;

	Insert Into dbo.MatchupEntries (MatchupId, ParentMatchupId, TeamCompetingId)
	Values (@MatchupId, @ParentMatchupId, @TeamCompetingId)

	Select @id = SCOPE_IDENTITY();
End
Go

Create Procedure dbo.spMatchups_Update
	@id int,
	@WinnerId int
As
Begin
	Set NoCount On;
	
	Update dbo.Matchups
	Set WinnerId = @WinnerId
	Where id = @id;
End
Go

Create Procedure spMatchupEntries_Update
	@id int,
	@TeamCompetingId int = null,
	@Score float = null
As
Begin
	Set NoCount On;

	Update dbo.MatchupEntries
	set TeamCompetingId = @TeamCompetingId, Score = @Score
	Where id = @id;
End
Go

Create Procedure dbo.spTournaments_Complete
	@id int
As
Begin
	Set NoCount On;

	Update dbo.Tournaments 
	Set Active = 0
	Where id = @id;
End
Go