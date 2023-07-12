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
    @State var themeSelected = -1
    
    @State private var theme : [String] = []
    var body: some View {

        VStack {
            Text("Memorize game").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(theme[0..<theme.count], id: \.self)  { emoji in
                        CardView(symbol : emoji).aspectRatio(3.0/4.0, contentMode: .fit)
                    }
                }
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
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var selectTheme0 : some View {
        Button( action: {
            shuffle(0)
        }, label: {
            Text(symbols[0][0]).font(.largeTitle)
        })
    }

    var selectTheme1 : some View {
        Button( action: {
           shuffle(1)
        }, label: {
            Text(symbols[1][0]).font(.largeTitle)
        })
    }

    var selectTheme2 : some View {
        Button( action: {
            shuffle(2)
        }, label: {
            Text(symbols[2][0]).font(.largeTitle)
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
    
    var addButton : some View {
        Button(action: {
            if count < symbols[themeSelected].count  {
                count += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
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
