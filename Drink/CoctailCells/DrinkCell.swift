//
//  DrinkCell.swift
//  Drink
//
//  Created by Денис Курлыков on 14.08.2022.
//

import UIKit

class DrinkCell: UICollectionViewCell {

    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var nameDrink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with drink: Drink) {
        nameDrink.text = drink.nameDrink
        guard let url = URL(string: drink.imageDrink ?? "") else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }

        drinkImage.image = UIImage(data: imageData)
    }
}
