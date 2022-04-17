//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct LevelBook: View {

	var book: Book 
	
	@State private var userInput = ""
	
	@State private var showingHint = false
	
	@State private var showingPopover = false
	
	@EnvironmentObject var levelStore: LevelStore
	
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
			
			TextField("Write your guess here...", text: $userInput)
				.padding()
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 20)
				.overlay(RoundedRectangle(cornerRadius: 19).stroke())
				.onSubmit { 
					
						checkAnswer()
						
				}
			Text("Number of words: \(book.title.wordCount)")
				.font(.title2)
				.fontWeight(.medium)
			Spacer()
			Spacer()
				
		}
			if showingPopover {
				Color.black.opacity(0.6).ignoresSafeArea()
					
				Popover(showingPopover: $showingPopover, book: book)
			}
	}
		.navigationTitle("Book")
		.navigationBarTitleDisplayMode(.inline)
		
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing){
				Button {
					showingHint = true
				} label: {
					Text("💡")
						.font(.largeTitle)
				}
				.popover(isPresented: $showingHint) {
					
				
					VStack {
						Text("This is a hint...")
							.font(.title)
							.onTapGesture {
								//TODO: Show hint here
								
								print(book.hint)
							}
						
						Divider()


						Text("See the solution...")
							.font(.title)
							.onTapGesture {
								//TODO: show the title here
								print(book.title)
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
				showingPopover = true
			}
		}
	}
}

