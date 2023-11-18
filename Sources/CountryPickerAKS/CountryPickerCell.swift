//
//  CountryPickerCell.swift
//
//
//  Created by Amit Shah on 14/11/23.
//

import UIKit

class CountryPickerCell: UITableViewCell {
    
    @IBOutlet weak var countryFlag: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    
    var config: Config?{
        didSet{
            
            guard let config else { return }
            countryFlag.isHidden = !(config.display.Flag)
            countryCode.isHidden = !(config.display.CountryCode)
            countryName.isHidden = !(config.display.CountryName)
            
            let textColor = config.color.textColor
            countryFlag.textColor = textColor
            countryName.textColor = textColor
            countryCode.textColor = textColor
            
            let font = config.font
            countryCode.font = font.countryCode
            countryFlag.font = font.countryFlag
            countryName.font = font.countryName
            
        }
    }

    var data: CountryList?
    {
        didSet{
            countryFlag.text = data?.emoji
            countryName.text = data?.name
            countryCode.text = data?.dial_code
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier: String{
        return "CountryPickerCell"
    }
}
