//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 17/04/22.
//

import Foundation

class LevelStore: ObservableObject {
	@Published var books: [Book] = [book1, book2, book3, book4, book5, book6, book7, book8, book9, book10, book11, book12, book13, book14, book15, book16, book17, book18, book19, book20]
	
	@Published var movies: [Movie] = [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10, movie11, movie12, movie13, movie14, movie15, movie16, movie17, movie18, movie19, movie20]
}
