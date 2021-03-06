//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct KidsSection: View {
	
	@EnvironmentObject var levelStore: LevelStore
	
	@Binding var userSelection: CategoryType
	
	let columns = [
		GridItem(.adaptive(minimum: 190))
	]
	
	var icon: String
	var body: some View {
		VStack(alignment: .leading) {
			Header(userSelection == .movies ? "Children's movies" : "Children's books")
				.padding(.leading, 30)
			
			LazyVGrid(columns: columns, spacing: 50) {
				if userSelection == .books {
					ForEach (levelStore.books.filter({$0.isForKids == true }), id: \.id) { book in
						BookItem(color: .darkColor, book: book)
					}
				} else {
					ForEach (levelStore.movies.filter({$0.isForKids == true }), id: \.id) { movie in
						MovieItem(color: .darkColor, movie: movie)
					}
				}
			}
			.padding()
			
		}
	}
}

