Create Database TournamentTracker
Go

Use TournamentTracker;

Create table dbo.Tournaments (
	id int Identity(1,1) NOT NULL,
	TournamentName nvarchar(200) NOT NULL,
	EntryFee money NOT NULL
		Constraint DF_Tournaments_EntryFee Default 0,

	Constraint PK_Tournaments Primary Key Clustered (id asc),
);

Create table dbo.Prizes (
	id int Identity(1,1) NOT NULL,
	PlaceNumber int NOT NULL,
	PlaceName nvarchar(50) NOT NULL,
	PrizeAmount money NOT NULL
		Constraint DF_Prizes_PrizeAmount Default 0,
	PrizePercentage float
		Constraint DF_Prizes_PrizePercentage Default 0,

	Constraint PK_Prizes Primary Key Clustered (id asc),
);

Create table dbo.TournamentPrizes (
	id int Identity(1,1) NOT NULL,
	TournamentId int,
	PrizeId int

	Constraint PK_TournamentPrizes Primary Key Clustered (id asc),
	Constraint FK_TP_Prizes Foreign Key (PrizeId) References Prizes(id),
	Constraint FK_TP_Tournaments Foreign Key (TournamentId) References Tournaments(id)
);

Create table dbo.Teams (
	id int Identity(1,1) NOT NULL,
	TeamName nvarchar(150) NOT NULL

	Constraint PK_Teams Primary Key Clustered (id asc)
);

Create table dbo.TournamentEntries (
	id int Identity(1,1) NOT NULL,
	TournamentId int NOT NULL,
	TeamId int NOT NULL

	Constraint PK_TournamentEntries Primary Key Clustered (id asc),
	Constraint FK_TE_Teams Foreign Key (TeamId) References Teams(id),
	Constraint FK_TE_Tournaments Foreign Key (TournamentId) References Tournaments(id)
);

Create Table dbo.People (
	id int Identity(1,1) NOT NULL,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	EmailAddress nvarchar(200) NOT NULL,
	CellphoneNumber varchar(20),
	CreateDate datetime2(7) NOT NULL
		Constraint DF_People_CreateDate Default GetDate(),

	Constraint PK_People Primary Key Clustered (id asc)
);

Create table dbo.TeamMembers (
	id int Identity(1,1) NOT NULL,
	TeamId int NOT NULL,
	PersonId int NOT NULL

	Constraint PK_TeamMembers Primary Key Clustered (id asc),
	Constraint FK_TeamMembers_People Foreign Key (PersonId) References People(id),
	Constraint FK_TeamMembers_Team Foreign Key (TeamId) References Teams(id)
);

Create table dbo.Matchups (
	id int Identity(1,1) NOT NULL,
	WinnerId int NOT NULL,
	MatchupRound int NOT NULL

	Constraint PK_Matchups Primary Key Clustered (id asc),
	Constraint FK_Matchups_WinningTeam Foreign Key (WinnerId) References Teams(id)
);

Create table dbo.MatchupEntries (
	id int Identity(1,1) NOT NULL,
	MatchupId int NOT NULL,
	TeamCompetingId int NOT NULL,
	Score int NOT NULL
		Constraint DF_ME_Score Default (0),

	Constraint PK_MatchupEntries Primary Key Clustered (id asc),
	Constraint FK_ME_Matchup Foreign Key (MatchupId) References Matchups(id),
	Constraint FK_ME_TeamCompeting Foreign Key (TeamCompetingId) References Teams(id),
);