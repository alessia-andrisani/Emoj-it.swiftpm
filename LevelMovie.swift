//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 16/04/22.
//

import SwiftUI

struct LevelMovie: View {
	
	@State var movie: Movie
	
	@State private var userInput = ""
	
	@State private var showingHelp = false
	
	@State private var showingHint = false
	
	@State private var showingCard = false
	
	var body: some View {
		ZStack {
		VStack(spacing: 30) {
			Spacer()
			Text("Can you guess the movie title?")
				.font(.title)
			
			Text(movie.emojis.joined())
				.font(.system(size: 60))
				.padding()
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 6)
				.background(Color.lightColor)
				.cornerRadius(19)
			
			TextField("Type movie title here...", text: $userInput)
				.padding()
				.font(.largeTitle)
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 20)
				.overlay(RoundedRectangle(cornerRadius: 19).stroke())
				.onSubmit {
					checkAnswer()
				}
			Text("Number of words: \(movie.title.wordCount)")
			.font(.title2)
			.fontWeight(.medium)
			
			if showingHint {
			Text("Hint: \(movie.hint)")
				.font(.title2)
			}
			Spacer()
			Spacer()
				
		}
			if showingCard {
				Color.black.opacity(0.6).ignoresSafeArea()
				
				CardMovie(showingCard: $showingCard, movie: movie) { nextMovie in
					movie = nextMovie
				}
	
			}
	}
		.navigationTitle("Movie")
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
							.font(.title)
							.onTapGesture {
								
								showingHint = true
								print(movie.hint)
							}
						
						Divider()


						Text("See the solution")
							.font(.title)
							.onTapGesture {
								
								userInput = movie.title
								print(movie.title)
							}

					}
					.padding()
				}
			}
		}
		
	}
	func checkAnswer() {
		if userInput.normalized() == movie.title.normalized() {
			print("Correct!")
			withAnimation {
				showingCard = true
			}
			userInput = ""
		}
	}
}
