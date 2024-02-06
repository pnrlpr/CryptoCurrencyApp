//
//  TopMoversView.swift
//  CryptoCurrencyApp
//
//  Created by PINAR KALKAN on 30.01.2024.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView (.horizontal) {
                HStack (spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}



//Ya yorum satırı yap ya da aşağıdaki gibi initialize et
struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
