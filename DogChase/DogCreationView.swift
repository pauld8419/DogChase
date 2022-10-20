import SwiftUI

struct DogCreationView: View {
    @State var dogName:String;
    @State var selectedClass:Class;
    @EnvironmentObject var gameState:GameState;
    
    enum Class:String, CaseIterable, Identifiable {
        case Large;
        case Medium;
        case Small;
        
        var id:Self {self};
    }
    
    init() {
        dogName = ""
        selectedClass = Class.Large;
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("DogClipart").resizable().frame(width: 200, height: 200);
                Text("Dog Chase").font(.largeTitle).bold();
            }.frame(minWidth: 200, idealWidth: 200, maxWidth: .infinity, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .topLeading).background(.green)
            CustomDivider(color:.green, height: 7);
            HStack {
                Text("Your Dog Name: ").font(.title2).foregroundColor(.green).bold();
                TextField("Enter Dog Name Here", text: $dogName);
            }
            HStack {
                Text("Your Dog Size: ").font(.title2).foregroundColor(.green).bold();
                Picker(selection: $selectedClass, label: Text("Dog Class")) {
                    ForEach(Class.allCases) {caseName in
                        Text(caseName.rawValue.capitalized)
                    }
                }.pickerStyle(.segmented).colorMultiply(.green);
            }
            Spacer();
            HStack {
                Button("Create Dog") {
                    gameState.dogName = dogName;
                    gameState.dogClass = selectedClass.rawValue.capitalized;
                    gameState.dogSpeed = Int.random(in: 1...10);
                    gameState.dogBoneCollection = Int.random(in: 1...10);
                    gameState.dogCurrentLives = Int.random(in: 1...10);
                    gameState.dogCurrentLives = gameState.dogMaxLives;
                    gameState.viewState = 1;
                }.foregroundColor(.black).font(.largeTitle).frame(minWidth: 250, idealWidth: 250, maxWidth: 250, minHeight: 150, idealHeight: 150, maxHeight: 150).background(.green);
            }
            Spacer();
        }
        Spacer();
    }
}
struct CustomDivider: View {
    var color:Color;
    var height:CGFloat;
    init(color:Color, height:CGFloat) {
        self.color = color;
        self.height = height;
    }
    var body: some View {
        Rectangle().fill(color).frame(height: height).edgesIgnoringSafeArea(.horizontal);
    }
}
