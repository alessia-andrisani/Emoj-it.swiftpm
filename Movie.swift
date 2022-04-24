//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import Foundation

struct Movie: Identifiable, Codable {
	
	var id: UUID
	var title: String
	var director: String
	var date: String
	var genre: String
	
	var isCompleted: Bool = false 
	
	var isForKids: Bool = false
	
	var emojis: [String]
	
	var hint: String 
}





let movie1 = Movie(id: UUID(), title: "Infinity War", director: "Anthony and Joe Russo", date: "2018", genre: "Action, Sci-Fi", emojis: ["∞","⚔️"], hint: "The Avengers have to fight against the titan Thanos.")

let movie2 = Movie(id: UUID(), title: "The Dark Knight", director: "Christopher Nolan", date: "2008", genre: "Action, Thriller", emojis: ["⚫️","♞"], hint: "It is about a famous comics hero with a double identity and a faithful butler.")


let movie3 = Movie(id: UUID(), title: "The Golden Compass", director: "Chris Weitz", date: "2007", genre: "Fantasy", emojis: ["🥇","🧭"], hint: "12-year-old Lyra Belacqua lives in Oxford with her daemon Pan.")

let movie4 = Movie(id: UUID(), title: "Taxi Driver", director: "Martin Scorsese", date: "1976", genre: "Thriller, Dramatic", emojis: ["🚕","👨‍✈️"], hint: "A Vietnam War veteran suffering from post-traumatic stress disorder takes a job as a night shift taxi driver.")

let movie5 = Movie(id: UUID(), title: "Star Wars", director: "George Lucas", date: "1977", genre: "Fantasy, Sci-Fi", emojis: ["🌟","⚔️","⚔️"], hint: "It is a famous saga made up of 9 episodes.")

let movie6 = Movie(id: UUID(), title: "Back to the Future", director: "Robert Zemeckis", date: "1985", genre: "Sci-Fi, Adventure", emojis: ["🔙","🔮"], hint: "The main character is Marty McFly played by Michael J. Fox.")

let movie7 = Movie(id: UUID(), title: "Singing in the rain", director: "Stanley Donen, Gene Kelly", date: "1952", genre: "Musical", emojis: ["🎤","🎶","⤵️","☔️"], hint: "Famous musical of the 50’s with Gene Kelly and Donald O’Connor.")


let movie8 = Movie(id: UUID(), title: """
Harry Potter
and the Goblet of Fire
""", director: "Mike Newell", date: "2005", genre: "Fantasy", emojis: ["👦","⚡️","🍷","🔥"], hint: "Harry Potter is now in his 4th year at Hogwarts and is chosen as Triwizard Champion. ")

let movie9 = Movie(id: UUID(), title: "The Wolf of Wall Street", director: "Martin Scorsese", date: "2013", genre: "Biography, Dramatic, Comedy", emojis: ["🐺","🧱","🛣","💰"], hint: "Leonardo DiCaprio is the protagonist and plays an unscrupulous broker of New York.")

let movie10 = Movie(id: UUID(), title: """
Fantastic Beasts
and where to find them
""", director: "David Yates", date: "2016", genre: "Fantasy", emojis: ["🤩","🦄","🐲","❓","🔎"], hint: "Spin-off of the Harry Potter series with magical creatures.")


//let movie10 = Movie(id: UUID(), title: """
// Indiana Jones and the Kingdom
// of the Crystal Skull
//""", director: "Steven Spielberg", date: "2008", genre: "Adventure, Action", emojis: ["🤠","🏞","👑","💀","💎"], hint: "Fourth chapter of the adventures of the famous archeologist played by Harrison Ford.")



//For Kids

let movie11 = Movie(id: UUID(), title: "The Princess and the Frog", director: "Ron Clements, John Musker", date: "2009", genre: "Animated Film", isForKids: true, emojis: ["👸","🐸"], hint: "Tiana dreams of opening her own restaurant in New Orleans…")

let movie12 = Movie(id: UUID(), title: "The Lion King", director: "Roger Allers, Rob Minkoff", date: "1994", genre: "Animated Film", isForKids: true, emojis: ["🦁","👑"], hint: "Simba, after his father’s death begins his journey to become a king.")

let movie13 = Movie(id: UUID(), title: "Toy Story", director: "John Lasseter", date: "1995", genre: "Animated Film", isForKids: true, emojis: ["🧸","📖"], hint: "Woody and Buzz try to reunite with their human, Andy.")

let movie14 = Movie(id: UUID(), title: "Finding Nemo", director: "Andrew Stanton, Lee Unkrich", date: "2003", genre: "Animated Film", isForKids: true, emojis: ["🔎","🐟"], hint: "Marlin goes on a journey in the sea to find his son.")

let movie15 = Movie(id: UUID(), title: "Turning Red", director: "Domee Shi", date: "2022", genre: "Animated Film", isForKids: true, emojis: ["🔃","🔴"], hint: "The young Mei Lee discovers her power to transform into a large red panda.")

let movie16 = Movie(id: UUID(), title: "Kung Fu Panda", director: "John Stevenson, Mark Osborne", date: "2008", genre: "Animated Film", isForKids: true, emojis: ["🥋","🐼"], hint: "Po the panda learns martial arts.")

let movie17 = Movie(id: UUID(), title: "Pirates of The Caribbean", director: "Gore Verbinski", date: "2003", genre: "Fantasy, Adventure", isForKids: true, emojis: ["🏴‍☠️","🏴‍☠️","🏝"], hint: "The pirate Jack Sparrow and his crew navigate the seas on the Black Pearl.")

let movie18 = Movie(id: UUID(), title: "Sleeping Beauty", director: "Clyde Geronimi, Eric Larson", date: "1959", genre: "Animated Film", isForKids: true, emojis: ["💤","👸"], hint: "The princess Aurora falls asleep because of a spell cast by the cruel Maleficent.")

let movie19 = Movie(id: UUID(), title: "How to train your dragon", director: "Dean DeBlois", date: "2010", genre: "Animated Film", isForKids: true, emojis: ["❓","🏋️‍♀️","🐉"], hint: "A young Viking, Hiccup, becomes friend of a dragon.")

let movie20 = Movie(id: UUID(), title: "The Nightmare before Christmas", director: "Henry Selick", date: "1993", genre: "Animated Film", isForKids: true, emojis: ["👹","💤","⬅️","🎄","🎅"], hint: "The protagonist is Jack Skellington, the “Pumpkin King” who lives in Halloween Town.")


