//
//  CryptoCurrency.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import Foundation

struct CryptoCurrency : Decodable {
    //Api den cektigimiz isim ne ise onlarin adlarini tanimliyoruz.
    let currency : String
    let price : String
}
