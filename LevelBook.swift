//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import AVFoundation
import SwiftUI

struct LevelBook: View {
	
	@EnvironmentObject var levelStore: LevelStore
	
	@State var book: Book
	
	@State private var userInput = ""
	
	@State private var showingHelp = false
	
	@State private var showingHint = false
	
	@State private var showingCard = false
	
	@FocusState var textFieldIsFocused: Bool
	
	@State private var shakeAnimation = false
	
	let impact = UIImpactFeedbackGenerator(style: .medium)
	
	var bookIndex: Int {
		let bookIndex = levelStore.books.firstIndex(where:  {$0.id == book.id } )!
		return bookIndex
		
	}
	
	@State var audioPlayer: AVAudioPlayer?
	
	
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
				.offset(x: shakeAnimation ? -8 : 0)
				.animation(.default.repeatCount(3, autoreverses: true), value: shakeAnimation)
				.onSubmit {
						checkAnswer()
				}
			Text("Number of words: \(book.title.wordCount)")
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
			Text("Hint: \(book.hint)")
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
					
				CardBook(showingCard: $showingCard, book: book) { nextBook in
					book = nextBook
				}
			}
	}
		
		.navigationTitle(book.isForKids ? "Children - Level \(bookIndex + 1)" : "Level \(bookIndex + 1)")
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
							
								userInput = book.title
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
		
		if userInput.normalized() == book.title.normalized() {
			
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

