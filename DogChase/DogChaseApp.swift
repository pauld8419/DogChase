import SwiftUI

class GameState: ObservableObject {
    @Published var viewState:Int;
    @Published var dogName:String?;
    @Published var dogClass:String?;
    @Published var dogSpeed:Int?;
    @Published var dogBoneCollection:Int?;
    @Published var dogMaxLives:Int?;
    @Published var dogCurrentLives:Int? ;
    
    init(viewState:Int) {
        self.viewState = viewState;
    }
}

@main
struct DogChaseApp: App {
    @ObservedObject var gameState:GameState = GameState(viewState: 0);
    var body: some Scene {
        WindowGroup {
            if (gameState.viewState == 0) {
                DogCreationView().environmentObject(gameState);
            } else {
                ProfileView().environmentObject(gameState);
            }
            
        }
    }
}
