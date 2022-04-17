//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct LevelsGridView: View {

	
	@EnvironmentObject var levelStore: LevelStore
	
	@Binding var userSelection: CategoryType
	

	let columns = [
		GridItem(.adaptive(minimum: 190))
	]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			VStack {
				
				LazyVGrid(columns: columns, spacing: 50) {
					
					if userSelection == .books {
						
						
						ForEach (levelStore.books.filter({$0.isForKids == false }), id: \.id) { book in
							BookItem(icon: "📙", color: .lightColor, book: book)
						}
					} else {
						ForEach (levelStore.movies.filter({$0.isForKids == false }), id: \.id) { movie in
							MovieItem(icon: "🎬", color: .lightColor, movie: movie)
						}
					}
				}
				.padding()
				
				if userSelection == .books {
					KidsSection(userSelection: $userSelection, icon: "📙")
				} else {
					KidsSection(userSelection: $userSelection, icon: "🎬")
					
				}
			}
		}
		.navigationTitle(userSelection == .books ? "Books" : "Movies")
		.navigationBarTitleDisplayMode(.inline)
		
	}
}

