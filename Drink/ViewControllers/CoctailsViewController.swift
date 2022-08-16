//
//  CoctailsViewController.swift
//  Drink
//
//  Created by Денис Курлыков on 14.08.2022.
//

import UIKit
import Alamofire

class CoctailsViewController: UIViewController {
    
    var coctails = [Drink]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
//        NetworkManadger.fetchData(url: Link.drinksURL.rawValue) { drink in
//            DispatchQueue.main.async {
//                self.coctails = drink.drinks
//                self.collectionView.reloadData()
//            }
//        }
        
        
        self.collectionView.register(UINib(nibName: "DrinkCell", bundle: nil), forCellWithReuseIdentifier: "DrinkCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
}

extension CoctailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return coctails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCell", for: indexPath) as! DrinkCell
        
        let drink = coctails[indexPath.item]
      cell.configure(with: drink)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CoctailsViewController {
    private func fetchData() {
        AF.request(Link.drinksURL.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let drinksData = value as? [String:[[String:Any]]] else { return }
                    for drinkData in drinksData {
                        let drink = Drink(
                            nameDrink: drinkData["strDrink"] as? String ?? "",
                            nameGlass: drinkData["strGlass"] as? String,
                            instruction: drinkData["strInstructions"] as? String,
                            imageDrink: <#T##String?#>,
                            ingredientOne: <#T##String#>,
                            ingredientTwo: <#T##String#>,
                            ingredientThree: <#T##String#>,
                            ingredientFour: <#T##String?#>,
                            ingredientFive: <#T##String?#>,
                            ingredientSix: <#T##String?#>,
                            ingredientSeven: <#T##String?#>,
                            measureOne: <#T##String#>,
                            measureTwo: <#T##String#>,
                            measureThree: <#T##String#>,
                            measureFour: <#T##String?#>,
                            measureFive: <#T##String?#>,
                            measureSix: <#T##String?#>,
                            measureSeven: <#T##String?#>
                        )
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
//    private func getData() {
//        guard let url = URL(string: link) else { return }
//        URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let drink = try JSONDecoder().decode(Drinks.self, from: data)
//              DispatchQueue.main.async {
//                  self?.coctails = drink.drinks
//                  self?.collectionView.reloadData()
//              }
//
//            } catch let error {
//                print(error.localizedDescription)
//            }
//
//        }.resume()
//    }

}
