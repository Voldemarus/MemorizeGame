//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 09.07.2023.
//

import SwiftUI

let gridItemSpacing = 7.0

struct ContentView: View {

    
    var symbols = [
         ["🫖", "☕️", "🍵", "🧃", "🥤", "🧋", "🍺",
                    "🥂", "🍷", "🥃", "🍸", "🧊", "🍻"],
        
        ["⚽️","🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🎱", "🪀",
         "🏓", "🏸", "🏒", "🏏", "🛷", "🪂", "🥋", "🪂"],

        ["🚗", "🚕", "🚙", "🚌", "🚎", "🚲", "🩼", "🚲", "🚔", "🚃",
          "✈️", "⛵️", "🚀", "⚓️", "🪝", "🚁", "🛟", "⛽️"],
    ];
    
     @State var themeSelected = 0
    
    @State private var theme : [String] = []
    
    private let gridFormat = [
        GridItem(.adaptive(minimum: 80, maximum: 140), spacing: gridItemSpacing),
    ]
    
    
    init() {
        theme = symbols[0]
        shuffle(0)
    }
    
    var body: some View {

        VStack {
            Text("Memorize game").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: gridFormat, spacing : gridItemSpacing ) {
                    ForEach(theme[0..<theme.count], id: \.self)  { emoji in
                        CardView(symbol : emoji).aspectRatio(1.0, contentMode: .fit)
                    }
                }
            }
             
            Spacer()
            HStack {
                Spacer()
                selectTheme0
                Spacer()
                selectTheme1
                Spacer()
                selectTheme2
                Spacer()
             }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var selectTheme0 : some View {
        Button( action: {
            shuffle(0)
        }, label: {
            let v = tabBarLabel(iconName: "wineglass", label: "Glasses", selected: themeSelected == 0)
            if themeSelected == 0 {
                v.foregroundColor(.red)
            } else {
                v
            }
        }
        ) // Button
    }
  
 

    var selectTheme1 : some View {
        Button( action: {
           shuffle(1)
        }, label: {
            let v = VStack {
                tabBarLabel(iconName: "basketball", label: "Sport", selected: themeSelected == 1)
            }
            if themeSelected == 1 {
                v.foregroundColor(.red)
            } else {
                v
            }
        })
    }

    var selectTheme2 : some View {
        Button( action: {
            shuffle(2)
        }, label: {
            let v = tabBarLabel(iconName :"car", label: "Transport",
                        selected: themeSelected == 2)
            if themeSelected == 2 {
                v.foregroundColor(.red)
            } else {
                v
            }
        })
    }
    
     
    func shuffle(_ newTheme : Int) {
        themeSelected = newTheme
        theme.removeAll()
        theme = symbols[themeSelected]
        let cnt = theme.count
        for i in 0..<cnt {
            let newIndex = Int.random(in: 0..<cnt)
            if newIndex != i {
                let tmp = theme[i]
                theme[i] = theme[newIndex]
                theme[newIndex] = tmp
            }
        }
    }
}

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
    
    @State var faceUp : Bool = true
    @State var symbol : String = "?"
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerSize: CGSizeMake(10,10))
            if faceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                    .foregroundColor(.red)
                
                Text(symbol).font(.largeTitle)
            }
            else {
                ZStack {
                    shape.fill()
                        .foregroundColor(.red)
                    Image(systemName: "snowflake", variableValue: 3.0).foregroundColor(.white).font(.largeTitle)
                }
            }
        }
        .onTapGesture {
            faceUp = !faceUp
        }
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
