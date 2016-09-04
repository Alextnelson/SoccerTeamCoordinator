//Soccer Coordinator Teams

//Created a dictionary to hold all player names and attributes
let soccerPlayers: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [
    "Joe Smith": (true, 42, "Jim and Jan Smith"),
    "Jill Tanner": (true, 36, "Clara Tanner"),
    "Bill Bon": (true, 43, "Sara and Jenny Bon"),
    "Eva Gordon": (false, 45, "Wendy and Mike Gordon"),
    "Matt Gill": (false, 40, "Charles and Sylvia Gill"),
    "Kimmy Stein": (false, 41, "Bill and Hillary Stein"),
    "Sammy Adams": (false, 45, "Jeff Adams"),
    "Karl Saygan": (true, 42, "Heather Bledsoe"),
    "Suzane Greenberg": (true, 44, "Henrietta Dumas"),
    "Sal Dali": (false, 41, "Gala Dali"),
    "Joe Kavalier": (false, 39, "Sam and Elaine Kavalier"),
    "Ben Finkelstein": (false, 44, "Aaron and Jill Finkelstein"),
    "Diego Soto": (true, 41, "Robin and Sarika Soto"),
    "Chloe Alaska": (false, 47, "David and Jamie Alaska"),
    "Arnold Willis": (false, 43, "Claire Willis"),
    "Philip Helm": (true, 44, "Thomas Helm and Eva Jones"),
    "Les Clay": (true, 42, "Wyonna Brown"),
    "Herschel Krustofski": (true, 45, "Hyman and Rachel Krustofski")
]

//Create an array of team names for dividing up players evenly via count method
let teamsInLeague = ["Dragons", "Sharks", "Raptors"]

//Create three dictionaries of teams to store players
var dragons: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [:]
var sharks: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [:]
var raptors: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [:]

//Created two dictionaries to separate experienced & nonexperienced players
var experiencedPlayers: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [:]
var nonExperiencedPlayers: [String: (hasExperience: Bool, height: Double, guardianNames: String)] = [:]

//For loop to populate experienced & nonexperienced player dictionaries
for (key, value) in soccerPlayers {
    if value.hasExperience == false {
        experiencedPlayers.updateValue(value, forKey: key)
    } else {
        nonExperiencedPlayers.updateValue(value, forKey: key)
    }
}

//Create function to determine number of players per team
func numberOfPlayersPerTeam(numberOfPlayers: Int, numberOfTeams: Int) -> Int {
    let playersPerTeam = numberOfPlayers/numberOfTeams
    return playersPerTeam
}

//Constant of players per team established by function
let totalPlayersPerTeam = numberOfPlayersPerTeam(soccerPlayers.count, numberOfTeams: teamsInLeague.count)
let numberOfExperiencedPlayersPerTeam = numberOfPlayersPerTeam(experiencedPlayers.count, numberOfTeams: teamsInLeague.count)
let numberOfInexperiencedPlayersPerTeam = numberOfPlayersPerTeam(nonExperiencedPlayers.count, numberOfTeams: teamsInLeague.count)

//Divide up experienced players evenly
for (key, value) in experiencedPlayers {
    if dragons.count < numberOfExperiencedPlayersPerTeam {
        dragons.updateValue(value, forKey: key)
    } else if sharks.count < numberOfExperiencedPlayersPerTeam {
        sharks.updateValue(value, forKey: key)
    } else if raptors.count < numberOfExperiencedPlayersPerTeam {
        raptors.updateValue(value, forKey: key)
    } else {
        print("All teams filled with experienced players")
    }
}

//Divide up remaining players evenly; admit there might be a better way to do this via DRY
for (key, value) in nonExperiencedPlayers {
    if dragons.count < totalPlayersPerTeam {
        dragons.updateValue(value, forKey: key)
    } else if sharks.count < totalPlayersPerTeam {
        sharks.updateValue(value, forKey: key)
    } else if raptors.count < totalPlayersPerTeam {
        raptors.updateValue(value, forKey: key)
    } else {
        print("All teams filled with non-experienced players")
    }
}

print(dragons)
print(raptors)
print(sharks)

/*
 Create logic that iterates through all three teams of players and generates a personalized letter to the guardians, letting them know which team their child has been placed on and when they should attend their first team team practice. As long as you provide the necessary information (player name, team name, guardians’ names, practice date/time), feel free to have fun with the content of the letter. The team practice dates/times are as follows: Dragons - March 17, 1pm, Sharks - March 17, 3pm, Raptors - March 18, 1pm
 */

//Did three greeting letters via print function
for (key, value) in dragons {
    print("Hello \(value.guardianNames), we are thrilled to have \(key) on the \(teamsInLeague[0]) this year! Please note that our first practice will be held on March 17th at 1 pm. We look forward to seeing you and your child there!")
}

for (key, value) in sharks {
    print("Hello \(value.guardianNames), we are thrilled to have \(key) on the \(teamsInLeague[1]) this year! Please note that our first practice will be held on March 17th at 3 pm. We look forward to seeing you and your child there!")
}

for (key, value) in raptors {
    print("Hello \(value.guardianNames), we are thrilled to have \(key) on the \(teamsInLeague[2]) this year! Please note that our first practice will be held on March 18th at 3 pm. We look forward to seeing you and your child there!")
}