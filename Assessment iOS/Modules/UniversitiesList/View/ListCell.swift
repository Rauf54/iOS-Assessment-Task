//
//  ListCell.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//
//

import UIKit
import AlamofireImage

class ListCell: UITableViewCell {

    @IBOutlet weak var universtyNameLbl: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var rightArrowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rightArrowView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
    }
    func setValue(forList list: ListDataModel) {
        self.selectionStyle = .none
        universtyNameLbl?.text = list.name
        if list.stateProvince?.isEmpty == true{
            universityStateLabel.text = "Not Found"
        }else{
        universityStateLabel.text = list.stateProvince
        }

        
    }
}
//MARK: - UiView Extension 
extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.cornerRadius = 15
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
