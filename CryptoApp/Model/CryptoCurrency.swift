//
//  CryptoCurrency.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import Foundation

struct CryptoCurrency : Decodable {
    //We define the names of what we are getting from the API
    let currency : String
    let price : String
}
