//
//  ContentView.swift
//  Memorize (Assignment I)
//
//  Created by Carmen Morado on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
    var foodEmojis = ["🍕", "🌭", "🍟", "🍔", "🥘", "🍝", "🍜", "🎂", "🍰", "🍦"]
    var animalEmojis = ["🦄", "🦊", "🐥", "🦋", "🐬", "🐳", "🐞", "🐶", "🐱", "🐹", "🦉", "🐒"]
    @State var emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
        @State var emojiCount: Int = 8
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                Text("Memorize!")
                    .font(.largeTitle)
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.blue)
            HStack {
                vehicleTheme
                Spacer()
                animalTheme
                Spacer()
                foodTheme
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var vehicleTheme: some View {
        Button(action: {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4...16)
        }, label: {
            VStack{
                Image(systemName: "car").font(.largeTitle)
                   Text("Vehicles").font(.body)
            }
        })
    }
    
    var animalTheme: some View {
        Button(action: {
            emojis = animalEmojis.shuffled()
            emojiCount = Int.random(in: 4...12)
        }, label: {
            VStack{
                Image(systemName: "ladybug").font(.largeTitle)
                Text("Animals").font(.body)
            }
        })
    }
    
    var foodTheme: some View {
        Button(action: {
            emojis = foodEmojis.shuffled()
            emojiCount = Int.random(in: 4...10)
        }, label: {
            VStack{
                Image(systemName: "cart").font(.largeTitle)
                Text("Food").font(.body)
            }
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:3)
                Text(content).font(.largeTitle)
                
            }
            
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
