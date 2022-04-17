//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 16/04/22.
//

import SwiftUI

struct LevelMovie: View {
	
	var movie: Movie
	
	@State private var userInput = ""
	
	@State private var showingHint = false
	
	@State private var showingPopover = false
	
	var body: some View {
		ZStack {
		VStack(spacing: 30) {
			Spacer()
			Text("Can you guess the title?") //TODO: Make dynamic Movie or Book, increase font
			
			Text(movie.emojis.joined())
				.font(.system(size: 60))
				.padding()
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 6)
				.background(Color.lightColor)
				.cornerRadius(19)
			
			TextField("Write your guess here...", text: $userInput)
				.padding()
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 20)
				.overlay(RoundedRectangle(cornerRadius: 19).stroke())
				.onSubmit { //TODO: Only if the answer is correct
					withAnimation {
					showingPopover = true
					}
				}
				
			Spacer()
			Spacer()
				
		}
			if showingPopover {
				Color.black.opacity(0.6).ignoresSafeArea()
					
				Popover(showingPopover: $showingPopover)
			}
	}
		.navigationTitle("Movie")
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
								
								print(movie.hint)
							}
						
						Divider()


						Text("See the solution...")
							.font(.title)
							.onTapGesture {
								//TODO: show the title here
								print(movie.title)
							}

					}
					.padding()
				}
			}
		}
		
	}
}
