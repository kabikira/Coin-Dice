//
//  CoinView.swift
//  Coin-Dice
//
//  Created by koala panda on 2022/11/11.
//

import SwiftUI

struct CoinView: View {
    let number = [true, false]
    @State var num = true
    @State var animationAmount = 0.0
    @State var timer :Timer?
    @State var isButton = false
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(self.num ? .red: .blue)
                .frame(width: 200, height: 200)
                .padding()
                .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: CGFloat(10), y: CGFloat(0), z: CGFloat(0)))
            Spacer()

            Button (action:{
                isButton = true
                for _ in 1...5 {
                coinAnime()
                }
                timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {_ in
                    num.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    num = number.randomElement()!
                    timer?.invalidate()
                    timer = nil
                    isButton = false
                }
            } ) {
                Text("START")
                    .padding(.all, 30.0)
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(isButton)
    
        }
        
       
    }
    func coinAnime() {
        withAnimation(.linear(duration: 2)) {
            num.toggle()
            self.animationAmount += 1080
        }
        
    
    }}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
