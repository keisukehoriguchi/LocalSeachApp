//
//  ResultTableViewCell.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import UIKit
import Kingfisher

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var telLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var storeImg: UIImageView!
    
    var storeImgUrl:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(response: Response, index:Int) {
        nameLbl.text = response.stores[index].name
        addressLbl.text = response.stores[index].property.address
        telLbl.text = response.stores[index].property.telephone ?? ""
        if response.stores[index].category?.isEmpty ?? true {
            tagLbl.text = ""
        } else {
            tagLbl.text = response.stores[index].category?[0]
        }
        
        if let url = response.stores[index].property.leadImg {
            storeImg.kf.setImage(with: URL(string: url))
        }
    }
    
}
