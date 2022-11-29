import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var gameState:GameState;
    var body: some View {
        VStack {
            Text("Dog Profile");
            HStack {
                Text("Dog Name: \(gameState.dogName!)").font(.title2).foregroundColor(.green).bold();
            }
            HStack {
                Text("Dog Size: \(gameState.dogClass!)").font(.title2).foregroundColor(.green).bold();
            }
            HStack {
                Text("Dog Speed: \(String(gameState.dogSpeed!))").font(.title2).foregroundColor(.green).bold();
            }
            HStack {
                Text("Dog Bone Collection Radius: \(String(gameState.dogBoneCollection!))").font(.title2).foregroundColor(.green).bold();
            }
            HStack {
                Text("Dog Max Lives: \(gameState.dogMaxLives!)").font(.title2).foregroundColor(.green).bold();
            }
        }
        Spacer();
    }
}
