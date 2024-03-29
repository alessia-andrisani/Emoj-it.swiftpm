//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 16/04/22.
//

import AVFoundation
import SwiftUI

struct LevelMovie: View {
	
	@EnvironmentObject var levelStore: LevelStore
	
	@State var movie: Movie
	
	@State private var userInput = ""
	
	@State private var showingHelp = false
	
	@State private var showingHint = false
	
	@State private var showingCard = false
	
	@FocusState var textFieldIsFocused: Bool
	
	@State private var shakeAnimation = false
	
	let impact = UIImpactFeedbackGenerator(style: .medium)
	
	var movieIndex: Int {
		let movieIndex = levelStore.movies.firstIndex(where:  {$0.id == movie.id } )!
		return movieIndex
		
	}
	
	@State var audioPlayer: AVAudioPlayer?
	
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
				.font(.title3)
				.frame(width: UIScreen.main.bounds.width / 1.9, height: UIScreen.main.bounds.height / 20)
				.overlay(RoundedRectangle(cornerRadius: 19).stroke())
				.offset(x: shakeAnimation ? -8 : 0)
				.animation(.default.repeatCount(3, autoreverses: true), value: shakeAnimation)
				.focused($textFieldIsFocused)
				.onSubmit {
					checkAnswer()
				}
			Text("Number of words: \(movie.title.wordCount)")
			.font(.title2)
			.fontWeight(.medium)
			
			Button {
				checkAnswer()
				impact.impactOccurred()
			} label: {
				Text("Done")
					
			}
			.padding()
			.font(.title)
			.foregroundColor(.white)
			.background(Color("DarkColor"))
			.clipShape(RoundedRectangle(cornerRadius: 19))
			
			if showingHint {
			Text("Hint: \(movie.hint)")
				.font(.title2)
				.lineLimit(nil)
				.padding(.horizontal)
			}
			Spacer()
			Spacer()
				
		}
		.ignoresSafeArea(.keyboard)
			
			if showingCard {
				Color.black.opacity(0.6).ignoresSafeArea()
				
				CardMovie(showingCard: $showingCard, movie: movie) { nextMovie in
					movie = nextMovie
				}
	
			}
	}
		.navigationTitle(movie.isForKids ? "Children - Level \(movieIndex + 1)" : "Level \(movieIndex + 1)")
		.navigationBarTitleDisplayMode(.inline)
		
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing){
				Button {
					showingHelp = true
					impact.impactOccurred()
				} label: {
					Text("💡")
						.font(.system(size: 50))
				}
				.popover(isPresented: $showingHelp) {
					
				
					VStack {
						Text("Get a hint")
							.font(.title3)
							.onTapGesture {
								showingHint = true
								showingHelp = false
								textFieldIsFocused = false 
							}
						
						Divider()

						
						Text("See the solution")
							.font(.title3)
							.onTapGesture {
								
								userInput = movie.title
								showingHelp = false
								textFieldIsFocused = false 
								
								
							}
					}
					.padding()
				}
			}
		}
	}
	func checkAnswer() {
		if userInput.normalized() == movie.title.normalized() {
			
			withAnimation {
				showingCard = true
			}
			userInput = ""
			showingHint = false
			textFieldIsFocused = false 
			audioCorrect()
		} else {
			
			textFieldIsFocused = true
			audioWrong()
			withAnimation {
				
				shakeAnimation = true
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
					
					shakeAnimation = false
				}
			}
		}
	}
	func audioCorrect(){
		let audioURL = Bundle.main.url(forResource: "correctSound", withExtension: "mp3")
		
		guard audioURL != nil else {
			print("No audio found")
			return
		}
		do{
			audioPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
			audioPlayer?.play()
			
		}catch{
			print("errore \(error.localizedDescription)")
		}
		
	}
	
	func audioWrong(){
		let audioURL = Bundle.main.url(forResource: "wrongSound", withExtension: "mp3")
		
		guard audioURL != nil else {
			print("No audio found")
			return
		}
		do{
			audioPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
			audioPlayer?.play()
			
		}catch{
			print("error \(error.localizedDescription)")
		}
	}
}
