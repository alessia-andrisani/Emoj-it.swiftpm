//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 19/04/22.
//

import SwiftUI

struct CardMovie: View {
	
	@Binding var showingCard: Bool
	
	@EnvironmentObject var levelStore: LevelStore
	
	var movie: Movie
	
	var index: Int {
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
					
					Text("Level \(index + 1) completed ⭐️")
						.foregroundColor(.white)
					
				}
				.padding(20)
			}
			
			VStack {
				
				VStack(alignment: .leading) {
					Text("\(movie.title)")
						.font(.title)
						.padding(.bottom)
					Text("Genre: \(movie.genre) ")
						.font(.title2)
						.padding(.vertical)
					Text("Author: \(movie.director)")
						.font(.title2)
						.padding(.vertical)
					Text("Year: \(movie.date) ")
						.font(.title2)
						.padding(.vertical)
				}
				
				Button {
					//Next
					let nextMovie = levelStore.movies[index + 1]
					
					onNext(nextMovie)
					
					showingCard = false
					
				} label: {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.frame(width: 243, height: 74, alignment: .center)
							.foregroundColor(Color.darkColor)
						
						
						Text("Next")
							.foregroundColor(.white)
							.font(.largeTitle)
					}
					
				}
				.offset(y: 65)
				
				Button {
					//Back to levels
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
		.transition(.asymmetric(insertion: .scale, removal: .identity))
		.onAppear {
			levelStore.movies[index].isCompleted = true
		}
		
	}
}


