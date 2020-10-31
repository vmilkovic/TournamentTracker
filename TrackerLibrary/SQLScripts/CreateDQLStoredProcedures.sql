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
	Join dbo.MatchupEntries me On m.id = me.MatchupId
	Join dbo.Teams tm On tm.id = me.TeamCompetingId
	Join dbo.TournamentEntries te On tm.id = te.TeamId
	Where te.TournamentId = @TournamentId;
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
	From Prizes p
	Join dbo.TournamentPrizes tp On p.id = tp.PrizeId
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
	Join dbo.TournamentEntries te On t.id = te.TeamId
	Where te.TournamentId = @TournamentId;
End

Go

Create Procedure dbo.spTeamMembers_GetByTeam
	@TeamId int
As
Begin
	Set NoCount On;

	Select tm.*
	From dbo.TeamMembers tm
	Join dbo.Teams t On t.id = tm.TeamId
	Where tm.TeamId = @TeamId;
End

Go

Create Procedure dbo.spTournaments_GetAll
As
Begin
	Set NoCount On;

	Select t.*
	From dbo.Tournaments t
End

Go