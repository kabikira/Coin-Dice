//
//  HostingTabBar.swift
//  Coin-Dice
//
//  Created by koala panda on 2022/11/11.
//

import SwiftUI

struct HostingTabBar: View {
    private enum Tab: Hashable {
        case Dice
        case Coin
    }
    init() {
        UITabBar.appearance().backgroundColor = UIColor.secondarySystemBackground
    }
    
    @State private var selectedTab: Tab = .Coin
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                CoinView()

                    .tabItem {
                        Text("Coin")
                        Image(systemName: "c.circle")
                    }
                    .tag(0)
                DiceView()
                    
                    .tabItem {
                        Text("Dice")
                        Image(systemName: "dice.fill")
                    }
                    .tag(1)
            }

        }
        
        
    }
}

struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar()
    }
}
