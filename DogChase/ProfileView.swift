import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var gameState:GameState;
    var body: some View {
        VStack {
            Text("Dog Profile").font(.largeTitle).foregroundColor(.green).bold();
            HStack {
                Text("Dog Name: \(gameState.dogName!)").font(.largeTitle).foregroundColor(.green).bold();
            }
            HStack {
                Text("Dog Size: \(gameState.dogClass!)").font(.largeTitle).foregroundColor(.green).bold();
            }
        }
        Spacer();
        Button("Create A Dog") {
            gameState.viewState = 0;
        }.foregroundColor(.black).font(.largeTitle).frame(minWidth: 250, idealWidth: 250, maxWidth: 250, minHeight: 150, idealHeight: 150, maxHeight: 150).background(.green);
    }
}
