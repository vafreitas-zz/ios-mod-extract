//
//  ExtractTransactionCell.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import UIKit

class ExtractTransactionCell: UITableViewCell {
    
    // MARK: Outlets

    @IBOutlet var movementDescriptionLabel: UILabel!
    @IBOutlet var dateTimeLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    // MARK: Setup Method
    
    func setup(_ model: ExtractTransaction) {
        movementDescriptionLabel.text = model.movementDescription
        
        if model.movement == .out {
            valueLabel.textColor = .systemRed
            setValue("-" + model.value)
            
        } else {
            valueLabel.textColor = .systemGreen
            setValue(model.value)
        }
        
        var iconName: String  {
            switch model.type {
            case .payment:
                return "payment-icon"
            case .pixSent:
                return "pix-sent-icon"
            case .recharge:
                return "recharge-icon"
            case .tedReceive:
                return "ted-receive-icon"
            }
        }
        
        iconImageView.image = UIImage(named: iconName)
        dateTimeLabel.text = model.dateTime
    }
    
    func setValue(_ value: String) {
        valueLabel.text = value
    }
}
