//
//  ConverterLogic.swift
//  Assignment 6
//
//  Created by Owner on 2/16/24.
//

import Foundation

struct ConverterLogic {
    var currencyOneSwitch = false
    var currencyTwoSwitch = false
    var currencyThreeSwitch = false
    var currencyFourSwitch = false

    mutating func setSwitch(_ switchValue: Bool, for currencyIndex: Int) {
        switch currencyIndex {
        case 1:
            currencyOneSwitch = switchValue
        case 2:
            currencyTwoSwitch = switchValue
        case 3:
            currencyThreeSwitch = switchValue
        case 4:
            currencyFourSwitch = switchValue
        default:
            break
        }
    }

    func convertAmount(_ amount: Int) -> (krwAmount: Int, twdAmount: Int, jpyAmount: Int, brlAmount: Int) {
        var krwAmount = 0
        var twdAmount = 0
        var jpyAmount = 0
        var brlAmount = 0

        if currencyOneSwitch {
            krwAmount = amount * 1333 //South Korean won
        }

        if currencyTwoSwitch {
            twdAmount = amount * 31 //New Taiwan dollar
        }

        if currencyThreeSwitch {
            jpyAmount = amount * 150 //Japanese Yen
        }

        if currencyFourSwitch {
            brlAmount = amount * 5 //Brazilian Real
        }

        return (krwAmount, twdAmount, jpyAmount, brlAmount)
    }

}
