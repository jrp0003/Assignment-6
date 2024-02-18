//
//  ConversionAmountView.swift
//  Assignment 6
//
//  Created by Owner on 2/16/24.
//

import UIKit

class ConversionAmountView: UIViewController {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var krwAmountLabel: UILabel!
    @IBOutlet weak var twdAmountLabel: UILabel!
    @IBOutlet weak var jpyAmountLabel: UILabel!
    @IBOutlet weak var brlAmountLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!

    var amountInUSD: Int = 0
    var selectedCurrencies: [String] = []
    var converter = ConverterLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        print("Amount in USD:", amountInUSD)
        print("Selected currencies:", selectedCurrencies)
    }

    
    func setupUI() {
        amountLabel.text = "USD: \(amountInUSD)"
        
        print("Selected currencies: \(selectedCurrencies)")

        for currency in selectedCurrencies {
            switch currency {
            case "KRW":
                converter.setSwitch(true, for: 1)
            case "TWD":
                converter.setSwitch(true, for: 2)
            case "JPY":
                converter.setSwitch(true, for: 3)
            case "BRL":
                converter.setSwitch(true, for: 4)
            default:
                break
            }
        }
        
        let convertedAmounts = converter.convertAmount(amountInUSD)
        
        displayAmount(title: "KRW: ", amount: convertedAmounts.krwAmount, label: krwAmountLabel)
        displayAmount(title: "TWD: ", amount: convertedAmounts.twdAmount, label: twdAmountLabel)
        displayAmount(title: "JPY: ", amount: convertedAmounts.jpyAmount, label: jpyAmountLabel)
        displayAmount(title: "BRL: ", amount: convertedAmounts.brlAmount, label: brlAmountLabel)
    }

    @IBAction func returnButtonTapped() {
           dismiss(animated: true, completion: nil)
       }

    func displayAmount(title: String, amount: Int, label: UILabel) {
        if amount % 1 == 0 && amount > 0 {
            label.isHidden = false
            label.text = "\(title) \(amount)"
        } else {
            label.isHidden = true
        }
    }
}






