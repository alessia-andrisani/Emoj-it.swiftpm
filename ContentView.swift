import SwiftUI

struct ContentView: View {
	

	
	@State private var userSelection = CategoryType.books
	
	@State private var navigateToMovieView = false
	
	@State private var navigateToBookView = false
	
    var body: some View {
		NavigationView {
			ZStack {
				
			VStack {
				
				
				NavigationLink(isActive: $navigateToMovieView) {  LevelsGridView(userSelection: $userSelection) } label: {
				
				Text("Movies 🎬")
					.font(.largeTitle)
					.foregroundColor(.black)
					.fontWeight(.medium)
					.padding()
					.frame(width: 464, height: 101)
					.background(Color.lightColor)
					.clipShape(RoundedRectangle(cornerRadius: 19))
					.padding()
					.onTapGesture {
						userSelection = CategoryType.movies
						
						Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
							navigateToMovieView = true
						}
					}
					
				}
				
				NavigationLink(isActive: $navigateToBookView) { LevelsGridView(userSelection: $userSelection) } label: {
					
				Text("Books 📙")
					.font(.largeTitle)
					.foregroundColor(.black)
					.fontWeight(.medium)
					.padding()
					.frame(width: 464, height: 101)
					.background(Color.lightColor)
					.clipShape(RoundedRectangle(cornerRadius: 19))
					.padding()
					.onTapGesture {
						userSelection = CategoryType.books
						
						Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
							navigateToBookView = true
						}
					}
				}
			}
				
				VStack {
					Spacer()
					HStack {
						Spacer()
						Button {
							//TODO: Add Instructions/ Credits
						} label: {
							Image(systemName: "questionmark.circle.fill")
								
						}
						.padding()
						.font(.largeTitle)
						.foregroundColor(.white.opacity(0.8))
						.background(Color("DarkColor"))
						.clipShape(RoundedRectangle(cornerRadius: 19))
						
					}
				}
			
			.padding()
			.navigationTitle("Emoj-it")
			
			
			}
			
		}
		
		.navigationViewStyle(.stack)
    }
}
