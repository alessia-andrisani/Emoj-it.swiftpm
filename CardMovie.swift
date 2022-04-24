//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 19/04/22.
//

import SwiftUI

struct CardMovie: View {
	
	@Environment (\.dismiss) var dismiss
	
	@Binding var showingCard: Bool
	
	@EnvironmentObject var levelStore: LevelStore
	
	var movie: Movie
	
	let impact = UIImpactFeedbackGenerator(style: .medium)
	
	var movieIndex: Int {
		let movieIndex = levelStore.movies.firstIndex(where:  {$0.id == movie.id } )!
		return movieIndex
		
	}
	
	var onNext: (Movie) -> Void
	
	var body: some View {
		ZStack {
			ZStack(alignment: .top) {
				ZStack(alignment: .topTrailing) {
					Image("Popover")
					
					Button {
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
					
					Text("Level \(movieIndex + 1) completed ⭐️")
						.foregroundColor(.white)
					
				}
				.padding(20)
			}
			
			VStack {
				
				VStack(alignment: .leading) {
					Text("\(movie.title)")
						.font(.title)
						.padding(.bottom)
						.multilineTextAlignment(.center)
						.frame(alignment: .center)
						
					Text("Genre: \(movie.genre) ")
						.font(.title2)
						.padding(.vertical)
					Text("Director: \(movie.director)")
						.font(.title2)
						.padding(.vertical)
					Text("Year: \(movie.date) ")
						.font(.title2)
						.padding(.vertical)
				}
				.foregroundColor(.black)
				
				
				Button {
					//Next
					if !isGameOver() {
						
						let nextMovie = levelStore.movies[movieIndex + 1]
						
						onNext(nextMovie)
					} else {
						
						dismiss()
						
					}
					
					showingCard = false
					
					impact.impactOccurred()
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
		.frame(width: 414 , height: 611)
		.transition(.scale)
		.onAppear {
			levelStore.movies[movieIndex].isCompleted = true
			levelStore.saveMovies()
		}
		
	}
	func isGameOver() -> Bool {
		 movieIndex == 9 || movieIndex == 19
			
	}
}


