//
//  ViewController.swift
//  CryptoApp
//
//  Created by Halis Kayar on 28.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { cryptoes in
            if let cryptoes = cryptoes {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoes)
                
                //We need to trigger reloadData on the tableview
                //For data we will download from the internet
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //To prevent the application from crashing, we set the code before it runs to 0
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceLabel.text = cryptoViewModel.price
        cell.cryptoLabel.text = cryptoViewModel.name
        
        return cell
    }
}

