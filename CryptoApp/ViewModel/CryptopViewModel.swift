//
//  CryptopViewModel.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import Foundation

// indirdigimiz veriyi(service) isleyip direkt View'da hazir hale getirmek icin ViewModel'da kullaniyoruz.
//Prensipler geregi her bir View'un ViewModel'i olmak zorunda.
//ViewModel'lari sabitlemek ve basitlestirmek prensibiyle hareket ediyoruz.

struct CryptoListViewModel {
    //cryptoCurrency i liste halinde tutabiliriz.
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int{
        
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { //CryptoViewModel ile birbirine bagliyoruz
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}

struct CryptoViewModel {
    //tekil olan icin ayri ViewModel olusturuyoruz
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
    
}
