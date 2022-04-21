//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import Foundation

struct Book: Identifiable, Codable {
	var id: UUID
	var title: String
	var author: String
	var date: String
	var genre: String
	
	var isCompleted: Bool = false
	
	var isForKids: Bool = false 
	
	var emojis: [String]
	
	var hint: String 
}







let book1 = Book(id: UUID(), title: "The Lord of the rings", author: "J.R.R. Tolkien", date: "1968", genre: "Fantasy", emojis: ["🤴","💍","💍"], hint: "Frodo Baggins starts his journey to Mordor.")

let book2 = Book(id: UUID(), title: "War and Peace", author: "Leo Tolstoy", date: "1869", genre: "Historical Novel", emojis: ["⚔️","🕊"], hint: "The novel tells the story of 5 families and starts in 1805 in Saint Petersburg.")
let book3 = Book(id: UUID(), title: "The Old Man and the Sea", author: "Ernest Hemingway", date: "1952", genre: "Literary Fiction", emojis: ["👴🏻","🌊"], hint: "The main character is the old fisherman Santiago who couldn’t catch a fish for 84 days.")
let book4 = Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee", date: "1960", genre: "Novel", emojis: ["☠️🦜"], hint: "The story is told through the eyes of the six-year-old Scout, daughter of the lawyer Atticus Finch.")
let book5 = Book(id: UUID(), title: "The Secret Garden", author: "Frances Hodgson Burnett", date: "1911", genre: "Novel", emojis: ["🤫","🌻","🌷","🌲"], hint: "The 10-year-old girl Mary Lennox is the protagonist of this novel, considered a classic for children.")
let book6 = Book(id: UUID(), title: """
Harry Potter
and the deathly Hallows
""", author: "J.K. Rowling", date: "2007", genre: "Fantasy", emojis: ["👦","⚡️","☠️","🎁","🎁"], hint: "The last book about the most famous wizard with rounded glasses.")

let book7 = Book(id: UUID(), title: "Angels and Demons", author: "Dan Brown", date: "2000", genre: "Thriller", emojis: ["👼","👼","😈","😈"], hint: "This novel by Dan Brown introduces for the first time the character Robert Langdon, expert of symbology.")

let book8 = Book(id: UUID(), title: "Wuthering Heights", author: "Emily Brontë", date: "1847", genre: "Novel", emojis: ["💨","🍃","🏔","🏔"], hint: "The main theme of this novel is the destructive love story between Heathcliff and Catherine.")

let book9 = Book(id: UUID(), title: "Animal Farm", author: "George Orwell", date: "1945", genre: "Political Satire", emojis: ["🐷","🐶","🐓","🚜","👨‍🌾"], hint: "A group of  farm animals rebel against their human farmer to create a new society.")

let book10 = Book(id: UUID(), title: "A Thousand Splendid Suns", author: "Khaled Hosseini", date: "2007", genre: "Novel", emojis: ["∞","🤩","☀️","☀️"], hint: "Mariam, the protagonist, lives on the outskirts of Herat with her mother.")



//let book10 = Book(id: UUID(), title: "The Plot against America", author: "Philip Roth", date: "2004", genre: "Alternative History", emojis: ["📖","⚔️","🇺🇸"], hint: "In an alternative history Charles Lindbergh defeats Franklin D. Roosevelt in the presidential election of 1940.")


//For Kids

let book11 = Book(id: UUID(), title: "The Jungle Book", author: "Rudyard Kipling", date: "1894", genre: "Novel", isForKids: true, emojis: ["🌴","📖"], hint: "The young Mowgli is the protagonist and lives in the jungle.")
let book12 = Book(id: UUID(), title: "Never ending story", author: "Michael Ende", date: "1979", genre: "Fantasy", isForKids: true, emojis: ["∞","📖"], hint: "The young Bastian finds a book set in the magical land of Fantastica.")
let book13 = Book(id: UUID(), title: "The Sword in the stone", author: "T.H. White", date: "1938", genre: "Fantasy", isForKids: true, emojis: ["🗡","⤵️","🪨"], hint: "The young Wart meets the wizard Merlyn who starts training him to become king.")
let book14 = Book(id: UUID(), title: """
Harry Potter
and the chamber of Secrets
""", author: "J.K. Rowling", date: "1998", genre: "Fantasy", isForKids: true, emojis: ["👦","⚡️","🛌","🤫"], hint: "The house-elf Dobby tries to stop Harry from going back to Hogwarts for his second year of school. ")
let book15 = Book(id: UUID(), title: "The little prince", author: "Antoine de Saint-Exupéry", date: "1943", genre: "Novel", isForKids: true, emojis: ["👦","👑"], hint: "The young protagonist has golden hair and when he meets an aviator in the Sahara, starts asking him questions.")
let book16 = Book(id: UUID(), title: "Charlie and the chocolate factory", author: "Roald Dahl", date: "1964", genre: "Novel", isForKids: true, emojis: ["👦","🍫","🏭"], hint: "Charlie finds one of the golden tickets and visits Willy Wonka’s factory.")
let book17 = Book(id: UUID(), title: "Treasure island", author: "Robert Louis Stevenson", date: "1883", genre: "Adventure", isForKids: true, emojis: ["💎","👑","⚱️","🏝"], hint: "Some pirates led by Long John Silver set sail to find a precious treasure.")
let book18 = Book(id: UUID(), title: "The call of the wild", author: "Jack London", date: "1903", genre: "Adventure", isForKids: true, emojis: ["📞","🐾","🐺"], hint: "This is the story of the dog Buck and his adventures.")
let book19 = Book(id: UUID(), title: "Hans Brinker or the silver skates", author: "Mary Mapes Dodge", date: "1865", genre: "Novel", isForKids: true, emojis: ["👦","⛸","🥈"], hint: "Hans Brinker and his sister Gretel desire to participate in a ice skating race to win a pair of silver skates. ")
let book20 = Book(id: UUID(), title: "Journey to the center of the Earth", author: "Jules Verne", date: "1864", genre: "Adventure, Sci-Fi", isForKids: true, emojis: ["🛥","➡️","🎯","🌎"], hint: "Professor Otto Lidenbrock, an eccentric scientist believes that there are volcanic tubes that lead to the center of the Earth.")
