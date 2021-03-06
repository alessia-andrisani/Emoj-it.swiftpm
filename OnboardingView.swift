//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 20/04/22.
//

import SwiftUI

struct OnboardingView: View {
	
	@Binding var showOnboarding: Bool
	
	let impact = UIImpactFeedbackGenerator(style: .medium)
	
	var body: some View {
		
		ZStack {
			Color.lightColor
				.ignoresSafeArea()
			
			RoundedRectangle(cornerRadius: 23)
				.frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)
				.foregroundColor(Color(uiColor: .secondarySystemBackground))
			
			
			VStack(alignment: .center, spacing: 50) {
				Text("😄 Welcome to Emoj-it!")
					.font(.system(size: 50))
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
					.padding([.bottom, .top])
					
					
				Group {
				
				Text("Choose between movies 🎬 and books 📙 and try to guess their title written in emojis.")
					.font(.system(size: 25))
					.fontWeight(.regular)
					.multilineTextAlignment(.center)
				
				Text("Use your imagination and conceptual reasoning skills to identify the concept behind each emoji.")
					.font(.system(size: 25))
					.fontWeight(.regular)
					.multilineTextAlignment(.center)
				
				Text("If you need help tap the 💡 and remember that the emojis describe the title and not the plot of the movie or book!")
					.font(.system(size: 25))
					.fontWeight(.regular)
					.multilineTextAlignment(.center)
				}

				
				Button {
					showOnboarding = false
					impact.impactOccurred()
				} label: {
					Text("Let's start!")
						
				}
				.padding()
				.font(.title)
				.foregroundColor(.white)
				.background(Color("DarkColor"))
				.clipShape(RoundedRectangle(cornerRadius: 19))
				
			}
			.foregroundColor(.primary)
			.frame(width: UIScreen.main.bounds.width * 1 / 1.9, alignment: .leading)
			.padding(.bottom)
		}
	}
}
