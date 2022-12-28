//
//  CryptopViewModel.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import Foundation

// We use the ViewModel to process the data we downloaded (from the service) and get it ready for the View directly
//According to the principles, each View must have a ViewModel
//We follow the principle of fixing and simplifying ViewModels

struct CryptoListViewModel {
    //cryptoCurrency i liste halinde tutabiliriz.
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int{
        
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { //We connect with CryptoViewModel
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}

struct CryptoViewModel {
    //We create a separate ViewModel for the unique one
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
    
}
