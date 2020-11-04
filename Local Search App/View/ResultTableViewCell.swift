//
//  ResultTableViewCell.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var telLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    
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
        guard let category = response.stores[index].category?[0] else { return }
        tagLbl.text = category
    }
}
