//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct LevelBook: View {
	
	@EnvironmentObject var levelStore: LevelStore
	
	@State var book: Book
	
	@State private var userInput = ""
	
	@State private var showingHelp = false
	
	@State private var showingHint = false
	
	@State private var showingCard = false
	
	@FocusState var textFieldIsFocused: Bool
	
	var bookIndex: Int {
		let bookIndex = levelStore.books.firstIndex(where:  {$0.id == book.id } )!
		return bookIndex
		
	}
	
	
	var body: some View {
		ZStack {
		VStack(spacing: 30) {
			Spacer()
			Text("Can you guess the book title?")
				.font(.title)
			
			Text(book.emojis.joined())
				.font(.system(size: 60))
				.padding()
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 6)
				.background(Color.lightColor)
				.cornerRadius(19)
			
			TextField("Type book title here...", text: $userInput)
				.padding()
				.font(.title3)
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 20)
				.overlay(RoundedRectangle(cornerRadius: 19).stroke())
				.focused($textFieldIsFocused)
				.onSubmit { 
					
						checkAnswer()
						
				}
			Text("Number of words: \(book.title.wordCount)")
				.font(.title2)
				.fontWeight(.medium)
			
			if showingHint {
			Text("Hint: \(book.hint)")
				.font(.title2)
				.lineLimit(nil)
			}
			Spacer()
			Spacer()
				
		}
			if showingCard {
				Color.black.opacity(0.6).ignoresSafeArea()
					
				CardBook(showingCard: $showingCard, book: book) { nextBook in
					book = nextBook
				}
			}
	}
		.navigationTitle(book.isForKids ? "Kids - Level \(bookIndex + 1)" : "Level \(bookIndex + 1)")
		.navigationBarTitleDisplayMode(.inline)
		
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing){
				Button {
					showingHelp = true
				} label: {
					Text("💡")
						.font(.largeTitle)
				}
				.popover(isPresented: $showingHelp) {
					
				
					VStack {
						Text("Get a hint")
							.font(.title3)
							.onTapGesture {
								
								showingHint = true
								
							}
						
						Divider()


						Text("See the solution")
							.font(.title3)
							.onTapGesture {
							
								userInput = book.title
								showingHelp = false
								textFieldIsFocused = true
								
							}

					}
					.padding()
				}
			}
		}
		
	}
	
	func checkAnswer() {
		if userInput.normalized() == book.title.normalized() {
			print("Correct!")
			withAnimation {
				showingCard = true
			}
			userInput = ""
		}
	}
}

