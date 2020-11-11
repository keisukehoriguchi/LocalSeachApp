

import UIKit

class StoreDetailVC: UIViewController {
    
    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var accessLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    var name:String?
    var rating:String?
    var category:String?
    
    var store = Response.Store()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = store.property.leadImg {
            storeImg.kf.setImage(with: URL(string: url))
        }
        addressLbl.text = store.property.address
        accessLbl.text = store.property.access
        detailLbl.text = store.property.catchcopy
        
        let storeNameLbl = UILabel()
        let ratingTitle = UILabel()
        let ratingLbl = UILabel()
        let genreTitle = UILabel()
        let genreLbl = UILabel()
        
        storeNameLbl.text = store.name
        ratingTitle.text = "Rating"
        ratingLbl.text = store.property.rating
        genreTitle.text = "Genre"
        if store.category?.isEmpty ?? true {
            genreLbl.text = ""
        } else {
            genreLbl.text = store.category?[0]
        }
        
        storeNameLbl.frame = CGRect(x: 20, y: 10, width: UIScreen.main.bounds.size.width, height: 30)
        ratingTitle.frame = CGRect(x: 20, y: 40, width: UIScreen.main.bounds.size.width, height: 30)
        ratingLbl.frame = CGRect(x: 20, y: 70, width: UIScreen.main.bounds.size.width, height: 30)
        genreTitle.frame = CGRect(x: 20, y: 150, width: UIScreen.main.bounds.size.width, height: 30)
        genreLbl.frame = CGRect(x: 20, y: 180, width: UIScreen.main.bounds.size.width, height: 30)
        
        storeNameLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ratingTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ratingLbl.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        genreTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        genreLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        storeNameLbl.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        ratingTitle.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        ratingLbl.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        genreTitle.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        genreLbl.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        
        self.storeImg.addSubview(storeNameLbl)
        self.storeImg.addSubview(ratingTitle)
        self.storeImg.addSubview(ratingLbl)
        self.storeImg.addSubview(genreTitle)
        self.storeImg.addSubview(genreLbl)
    }
    

}
