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
    
    let coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toCurrency.dataSource = self
        toCurrency.delegate = self
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // # of columns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencies.count // # of rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencies[row] // for currently selected item in picker, give me (n-1)th item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getPrice(for: coinManager.getCurrency(nth: row))
    }
}

