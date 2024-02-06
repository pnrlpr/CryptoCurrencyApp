//
//  AllCoinsView.swift
//  CryptoCurrencyApp
//
//  Created by PINAR KALKAN on 30.01.2024.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                    
                
                Spacer()
                
                Text("Price")
                    
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
        
    }
}

/*struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}*/
