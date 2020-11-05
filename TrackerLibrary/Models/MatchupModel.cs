using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary.Models {

    /// <summary>
    /// Represents one match in the tournament.
    /// </summary>
    public class MatchupModel {

        public int Id { get; set; }
        /// <summary>
        /// The set of teams that were involved in this match.
        /// </summary>
        public List<MatchupEntryModel> Entries { get; set; } = new List<MatchupEntryModel>();

        /// <summary>
        /// The ID from the database that will be used to look up the winner.
        /// </summary>
        public int WinnerId { get; set; }

        /// <summary>
        /// The winner of the match.
        /// </summary>
        public TeamModel Winner { get; set; }

        /// <summary>
        /// Which round this match is part of.
        /// </summary>
        public int MatchupRound { get; set; }
    }
}