//
//  ViewController.swift
//  Assignment 6
//
//  Created by Owner on 2/16/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    var selectedCurrencies: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        guard let currency = sender.accessibilityIdentifier else { return }
        if sender.isOn {
            if !selectedCurrencies.contains(currency) {
                selectedCurrencies.append(currency)
            }
        } else {
            selectedCurrencies.removeAll(where: { $0 == currency })
        }

        print("Switch changed - Selected currencies:", selectedCurrencies)
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            showError(message: "Amount must be an integer")
            return
        }
        errorLabel.isHidden = true

        print("Before segue - Selected currencies:", selectedCurrencies)

        performSegue(withIdentifier: "toConversionAmount", sender: amount)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConversionAmount",
           let amount = sender as? Int,
           let destinationVC = segue.destination as? ConversionAmountView {
            destinationVC.amountInUSD = Int(amount)
            destinationVC.selectedCurrencies = selectedCurrencies

            print("Amount in USD:", amount)
            print("Selected currencies:", selectedCurrencies)
        }
    }

    func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}









