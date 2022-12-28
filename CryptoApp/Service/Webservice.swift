//
//  Webservice.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import Foundation

class Webservice {
    // veri cekme islemi
    func downloadCurrencies(url : URL, completion : @escaping ([CryptoCurrency]?) -> ()) { //api den dizi icinde cektigimiz icin CryptoCurrency dizi icinde olmak zorunda
        // completion block olusturuyoruz. internetten cektigimiz bir veriyle islem yapiyorsak onunla ilgili dondurme islemiyo yapiyorsak @escaping kullanmak mantikli
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // hata varsa data olmadigi icin nil veriyorum.
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) //datayi cekip islemi yapan kodumuz
                print(cryptoList)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }

                
            }
        }.resume()
        
    }
    
}
