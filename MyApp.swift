import SwiftUI

@main
struct MyApp: App {
	
	@StateObject var levelStore = LevelStore()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(levelStore)
        }
    }
}
