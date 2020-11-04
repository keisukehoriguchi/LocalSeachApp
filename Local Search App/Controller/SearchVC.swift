//
//  ViewController.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import UIKit
import Alamofire

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    // appid = "dj00aiZpPUNScGdxZEU4ZDdWOCZzPWNvbnN1bWVyc2VjcmV0Jng9YzQ-"
    var getUrl:String = "https://map.yahooapis.jp/search/local/V1/localSearch"
    var word:String = "市川市"
    var responseValues = Response(stores: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UINib(nibName: identifiers.resultTableViewCell, bundle: nil), forCellReuseIdentifier: identifiers.resultTableViewCell)
    }
    
    @IBAction func searchClicked(_ sender: Any) {
        
        AF.request(getUrl, method: .get, parameters: [
                  "appid": "dj00aiZpPUNScGdxZEU4ZDdWOCZzPWNvbnN1bWVyc2VjcmV0Jng9YzQ-",
                  "output":"json",
                  "devise":"mobile"
                  ,"query":"\(word)"]).responseJSON { (response) in
                    
                    guard let data = response.data else { return }
            
                    do {self.responseValues = try JSONDecoder().decode(Response.self, from: data)
                        print(self.responseValues.stores[0])
                self.resultTableView.reloadData()
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseValues.stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = resultTableView.dequeueReusableCell(withIdentifier: identifiers.resultTableViewCell, for: indexPath) as? ResultTableViewCell {
            cell.configureCell(response: responseValues, index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
