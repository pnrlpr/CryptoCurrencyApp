//
//  HomeViewModel.swift
//  CryptoCurrencyApp
//
//  Created by PINAR KALKAN on 30.01.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init () {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response Code \(response.statusCode)")
            }
            
            
            guard let data = data else {return}
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print ("DEBUG: Failed to decode with error \(error)")
            }
            
            
            //Alttaki iki satırı, modeli oluşturmadan önce yapmıştık. Modelden sonra silinmeli.
           // let dataAsString = String(data: data, encoding: .utf8)
           // print("DEBUG: Data \(dataAsString)")
        } .resume()
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
    
}
