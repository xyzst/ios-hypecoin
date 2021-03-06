//
//  ViewController.swift
//  HypeCoin
//
//  Created by Darren Rambaud on 02/17/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoin: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var toCurrency: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        toCurrency.dataSource = self
        toCurrency.delegate = self
    }
}

// MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate { // ?? extract to file ??
    func didFailWith(error: Error) {
        print(error) // ?? ux decision: display some type of error to user ??
    }
    
    func didUpdateWith(data: CoinData) {
        DispatchQueue.main.async {
            self.bitcoin.text = data.rate.toString()
            self.currency.text = data.asset_id_quote
        }
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // # of columns
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencies.count // # of rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencies[row] // for currently selected item in picker, give me (n-1)th item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getPrice(for: coinManager.getCurrency(nth: row)) // for each update in the view picker, send the currently selected value to coin manager to find current rate
    }
}

