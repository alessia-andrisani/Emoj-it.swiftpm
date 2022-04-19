//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct CardBook: View {
	
	@Environment (\.dismiss) var dismiss
	
	@Binding var showingCard: Bool
	
	@EnvironmentObject var levelStore: LevelStore
	
	var book: Book
	
	var bookIndex: Int {
		let bookIndex = levelStore.books.firstIndex(where:  {$0.id == book.id } )!
		return bookIndex
		
	}
	
	var onNext: (Book) -> Void
	
	var body: some View {
		ZStack {
			ZStack(alignment: .top) {
				ZStack(alignment: .topTrailing) {
					Image("Popover")
					
					Button {
						//Dismiss
						showingCard = false
					} label: {
						Image(systemName: "x.circle")
							.foregroundColor(.black)
							.font(.title)
							.padding()
					}
				}
				VStack {
					Text("Good Job!")
						.font(.largeTitle)
						.foregroundColor(.white)
						.padding(.bottom, 3)
					
					Text("Level \(bookIndex + 1) completed ⭐️")
						.foregroundColor(.white)
					
				}
				.padding(20)
			}
			
			VStack {
				
				VStack(alignment: .leading) {
					Text("\(book.title)")
						.font(.title)
						.padding(.bottom)
						.multilineTextAlignment(.center)
					Text("Genre: \(book.genre) ")
						.font(.title2)
						.padding(.vertical)
					Text("Author: \(book.author)")
						.font(.title2)
						.padding(.vertical)
					Text("Year: \(book.date) ")
						.font(.title2)
						.padding(.vertical)
				}
				.foregroundColor(.black)
				
				Button {
					//Next
					if !isGameOver() {
						let nextBook = levelStore.books[bookIndex + 1]
						
						onNext(nextBook)
						
						
					} else {
						dismiss()
					}
					showingCard = false
				} label: {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.frame(width: 243, height: 74, alignment: .center)
							.foregroundColor(Color.darkColor)
						
						
						Text(!isGameOver() ? "Next": "Back to Levels")
							.foregroundColor(.white)
							.font(.largeTitle)
					}
					
				}
				.offset(y: 65)
				if !isGameOver() {
					Button {
						
						dismiss()
						
					} label: {
						HStack {
							Image(systemName: "arrowshape.turn.up.backward.fill")
								.foregroundColor(.black)
							Text("Back to levels")
								.foregroundColor(.black)
								.font(.headline)
						}
					}
					.offset(y: 85)
				}
			}
			
		}
		.transition(.asymmetric(insertion: .scale, removal: .identity))
		.onAppear {
			levelStore.books[bookIndex].isCompleted = true
		}
		
	}
	func isGameOver() -> Bool {
		bookIndex == 9 || bookIndex == 19
		
	}
}

