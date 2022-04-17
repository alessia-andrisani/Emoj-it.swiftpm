//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 16/04/22.
//

import SwiftUI

struct MovieItem: View {
	
	enum LevelState {
		case incomplete
		case complete
	}
	
	@ObservedObject var levelStore: LevelStore
	
	
	var icon: String = "🎬"
	var color: Color
	
	var movie: Movie
	
	var index: Int {
		 let movieIndex = levelStore.movies.firstIndex(where:  {$0.id == movie.id } )!
			return movieIndex
	 
	}
	
	var body: some View {
		
		NavigationLink { LevelMovie(movie: movie) } label: {
			
			
			VStack(spacing: 0) {
				
				HStack {
					Spacer()
					Image(movie.isCompleted ? "StarFilled" : "StarGrey" )
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
