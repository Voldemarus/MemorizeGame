//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 09.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    var symbols = [
         ["🫖", "☕️", "🍵", "🧃", "🥤", "🧋", "🍺",
                    "🥂", "🍷", "🥃", "🍸", "🧊", "🍻"],
        
        ["⚽️","🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🎱", "🪀",
         "🏓", "🏸", "🏒", "🏏", "🛷", "🪂", "🥋", "🪂"],

        ["🚗", "🚕", "🚙", "🚌", "🚎", "🚲", "🩼", "🚲", "🚔", "🚃",
          "✈️", "⛵️", "🚀", "⚓️", "🪝", "🚁", "🛟", "⛽️"],
        
    ];
    
    @State var count = 6
    @State var themeSelected = 2
    
    var body: some View {

        VStack {
            Text("Memorize game").font(.largeTitle)
            var theme = symbols[themeSelected]

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(symbols[themeSelected][0..<count], id: \.self, content: { emoji in
                    CardView(symbol : emoji).aspectRatio(2/3, contentMode: .fit)
                })
            }
            Spacer()
            HStack {
                removeButton
                Spacer()
                selectTheme0
                selectTheme1
                selectTheme2
                Spacer()
                addButton
            }
        }
        .padding()
    }
    
    var selectTheme0 : some View {
        Button( action: {
            themeSelected = 0
        }, label: {
            Text(symbols[0][0]).font(.largeTitle)
        })
    }

    var selectTheme1 : some View {
        Button( action: {
            themeSelected = 0
        }, label: {
            Text(symbols[1][0]).font(.largeTitle)
        })
    }

    var selectTheme2 : some View {
        Button( action: {
            themeSelected = 0
        }, label: {
            Text(symbols[2][0]).font(.largeTitle)
        })
    }
    
    var removeButton : some View {
        Button( action: {
            if count > 1 {
                count -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var addButton : some View {
        Button(action: {
            if count < symbols[themeSelected].count  {
                count += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
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
            let shape = RoundedRectangle(cornerSize: CGSizeMake(20,20))
            if faceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                
                Text(symbol).font(.largeTitle)
            }
            else {
                shape.fill()
                    .foregroundColor(.red)
                    .padding(.horizontal)
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
