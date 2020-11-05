Create Procedure dbo.spMatchupEntries_GetByMatchup
	@MatchupId int
As
Begin
	Set NoCount On;

	Select me.*
	From dbo.MatchupEntries me
	Where me.MatchupId = @MatchupId;

End
Go

Create Procedure dbo.spMatchups_GetByTournament
	@TournamentId int
As
Begin
	Set NoCount On;

	Select m.*
	From dbo.Matchups m
	Where m.TournamentId = @TournamentId
	Order By MatchupRound;
End
Go

Create Procedure dbo.spPeople_GetAll
As

Begin
	Set NoCount On;

	Select p.*
	From dbo.People p;
End
Go

Create Procedure dbo.spPrizes_GetByTournament
	@TournamentId int
As
Begin
	Set NoCount On;

	Select p.*
	From dbo.Prizes p
	Inner Join dbo.TournamentPrizes tp On p.id = tp.PrizeId
	Where tp.TournamentId = @TournamentId;
End
Go

Create Procedure dbo.spTeam_GetByTournament
	@TournamentId int
As
Begin
	Set NoCount On;

	Select t.*
	From dbo.Teams t
	Inner Join dbo.TournamentEntries te On t.id = te.TeamId
	Where te.TournamentId = @TournamentId;
End
Go

Create Procedure dbo.spTeam_GetAll
As
Begin
	Set NoCount On;
	Select *
	From dbo.Teams;
End
Go


Create Procedure dbo.spTeamMembers_GetByTeam
	@TeamId int
As
Begin
	Set NoCount On;

	Select p.*
	From dbo.TeamMembers tm
	Inner Join dbo.People p On tm.PersonId = p.id
	Where tm.TeamId = @TeamId;
End
Go

Create Procedure dbo.spTournaments_GetAll
As
Begin
	Set NoCount On;

	Select t.*
	From dbo.Tournaments t
	Where Active = 1;
End
Go