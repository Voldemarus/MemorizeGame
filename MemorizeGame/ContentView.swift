//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 09.07.2023.
//

import SwiftUI

let gridItemSpacing = 7.0

struct ContentView: View {

    let viewModel:  EmojiMemoryGame
     
    
    private let gridFormat = [
        GridItem(.adaptive(minimum: 80, maximum: 140), spacing: gridItemSpacing),
    ]
    
     
    var body: some View {

        VStack {
            Text("Memorize game").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: gridFormat, spacing : gridItemSpacing ) {
                    ForEach(viewModel.model.cards)  { card in
                        CardView(card : card ).aspectRatio(1.0, contentMode: .fit)
                    }
                }
            }
             
            Spacer()
//            HStack {
//                Spacer()
//                selectTheme(0, icon : "wineglass", label: "Glasses")
//                Spacer()
//                selectTheme(1, icon: "basketball", label: "Sport")
//                Spacer()
//                selectTheme(2, icon : "car", label: "Transport")
//                Spacer()
//             }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
//    func selectTheme (_ theme: Int, icon : String, label : String) -> some View {
//        Button( action: {
//            shuffle(theme)
//        }, label: {
//            let v = tabBarLabel(iconName: icon, label: label, selected: themeSelected == theme)
//            if themeSelected == theme {
//                v.foregroundColor(.red)
//            } else {
//                v
//            }
//        }
//        ) // Button
    }
  
    
//    func shuffle(_ newTheme : Int) {
//        themeSelected = newTheme
//        theme.removeAll()
//        theme = symbols[themeSelected]
//        let cnt = theme.count
//        for i in 0..<cnt {
//            let newIndex = Int.random(in: 0..<cnt)
//            if newIndex != i {
//                let tmp = theme[i]
//                theme[i] = theme[newIndex]
//                theme[newIndex] = tmp
//            }
//        }
//    }


//
// Tab bar button
//

struct tabBarLabel : View {
    @State var iconName : String
    @State var label    : String
    @State var selected : Bool
    var body : some View {
        VStack {
            let v = VStack {
                Image(systemName: iconName)
                Text(label).font(.subheadline)
            }
            if selected == true {
                v.foregroundColor(.red)
            } else {
                v
            }
        }
    }
}


//
// Single Card
//

struct CardView : View {
   
    let card:  MemoryGame<String>.Card
 
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerSize: CGSizeMake(10,10))
            if card.isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                    .foregroundColor(.red)
                
                Text(card.content).font(.largeTitle)
            }
            else {
                ZStack {
                    shape.fill()
                        .foregroundColor(.red)
                    Image(systemName: "snowflake", variableValue: 3.0).foregroundColor(.white).font(.largeTitle)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game).preferredColorScheme(.dark)
        ContentView(viewModel: game).preferredColorScheme(.light)
    }
}
