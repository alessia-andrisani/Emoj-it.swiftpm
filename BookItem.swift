//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct BookItem: View {    
	
	enum LevelState {
		case incomplete
		case complete
	}
	
	@ObservedObject var levelStore: LevelStore
	
	
	var icon: String = "📙"
	var color: Color
	
	var book: Book
	
	var index: Int {
		 let bookIndex = levelStore.books.firstIndex(where:  {$0.id == book.id } )!
			return bookIndex
	 
	}
	
	var body: some View {
		
		NavigationLink { LevelBook(book: book) } label: {
			
			
			VStack(spacing: 0) {
				
				HStack {
					Spacer()
					Image(book.isCompleted ? "StarFilled" : "StarGrey" )
						.padding(.top, 50)
				}
				
				Text(icon)
					.font(.largeTitle)
				
				Text("\(index + 1)")
					.font(.title)
					.padding()
					.padding(.bottom, 25)
					.foregroundColor(.primary)
			}
		}
		.padding()
		.background(color)
		.frame(width: 160, height: 150)
		.clipShape(RoundedRectangle(cornerRadius: 19))
		
	}
}

