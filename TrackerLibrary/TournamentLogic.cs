using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackerLibrary.Models;

namespace TrackerLibrary {
    public static class TournamentLogic {

        public static void CreateRounds(TournamentModel model) {

            // Order our list of teams randomly
            List<TeamModel> randomizedTeams = RandomizeTeamOrder(model.EnteredTeams);
            // Check if it is big enough - if not, add in byes - 2*2*2*2 - 2^4
            int rounds = FindNumberOfRounds(randomizedTeams.Count);
            int byes = NumberOfByes(rounds, randomizedTeams.Count);

            // Create our first round of matchups
            model.Rounds.Add(CreateFirstRound(byes, randomizedTeams));

            // Create every round after that - 8 matchups - 4 matchups - 2 matchups - 1 matchup
            CreateOtherRounds(model, rounds);
        }

        private static List<TeamModel> RandomizeTeamOrder(List<TeamModel> teams) {
            return teams.OrderBy(x => Guid.NewGuid()).ToList(); // Guid - random unique id
        }

        private static int FindNumberOfRounds(int teamCount) {
            int output = 1;
            int val = 2;

            while(val < teamCount) {
                output += 1;
                val *= 2; // 2*2*2*2
            }

            return output;
        }

        private static int NumberOfByes(int rounds, int numberOfTeams) {
            int totalTeams = 1;

            for(int i = 1; i <= rounds; i++) {
                totalTeams *= 2;
            }

            int output = totalTeams - numberOfTeams;

            return output;
        }

        private static List<MatchupModel> CreateFirstRound(int byes, List<TeamModel> teams) {
            List<MatchupModel> output = new List<MatchupModel>();
            MatchupModel curr = new MatchupModel();

            foreach(TeamModel team in teams) {
                curr.Entries.Add(new MatchupEntryModel { TeamCompeting = team });
                
                if(byes > 0 || curr.Entries.Count > 1) {
                    curr.MatchupRound = 1;
                    output.Add(curr);
                    curr = new MatchupModel();
                    
                    if(byes > 0) {
                        byes -= 1;
                    }
                }
            }

            return output;
        }

        private static void CreateOtherRounds(TournamentModel model, int rounds) {
            int round = 2;
            List<MatchupModel> previousRound = model.Rounds[0];
            List<MatchupModel> currRound = new List<MatchupModel>();
            MatchupModel currMatchup = new MatchupModel();

            while(round <= rounds) {
                foreach(MatchupModel match in previousRound) {
                    currMatchup.Entries.Add(new MatchupEntryModel { ParentMatchup = match });

                    if(currMatchup.Entries.Count > 1) {
                        currMatchup.MatchupRound = round;
                        currRound.Add(currMatchup);
                        currMatchup = new MatchupModel();
                    }
                }

                model.Rounds.Add(currRound);
                previousRound = currRound;

                currRound = new List<MatchupModel>();
                round += 1;
            }
        }
    }
}
