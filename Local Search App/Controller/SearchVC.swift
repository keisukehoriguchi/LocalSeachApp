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
    
    
    var getUrl:String = "https://map.yahooapis.jp/search/local/V1/localSearch"
    var responseValues = Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UINib(nibName: identifiers.resultTableViewCell, bundle: nil), forCellReuseIdentifier: identifiers.resultTableViewCell)
    }
    
    @IBAction func searchClicked(_ sender: Any) {
        
        guard let word = searchTxt.text, !word.isEmpty else {
            simpleAlert(title: "検索条件が不適切です。", msg: "条件を入力してください。")
            return
        }
        
        AF.request(getUrl, method: .get, parameters: [
                    "appid": "dj00aiZpPUNScGdxZEU4ZDdWOCZzPWNvbnN1bWVyc2VjcmV0Jng9YzQ-",
                    "output":"json",
                    "devise":"mobile"
                    ,"query":"\(word)"]).responseJSON { (response) in
                        
                        switch response.result {
                        case .success(let data):
                            self.responseValues = try? JSONDecoder().decode(Response.self, from: data)
                            self.resultTableView.reloadData()
                        case .failure(let error):
                            self.simpleAlert(title: "リクエスト/デコードに失敗しました", msg: "エラーメッセージは下記となります。\(error)")
                            print(error)
                        }
                    }
    }
    
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseValues?.stores.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: identifiers.resultTableViewCell, for: indexPath) as! ResultTableViewCell
        if let responseValues = responseValues {
            cell.configureCell(response: responseValues, index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: identifiers.toStoreDetailVC, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiers.toStoreDetailVC {
            if let row = resultTableView.indexPathForSelectedRow?.row {
                let vc = segue.destination as! StoreDetailVC
                vc.store = responseValues.stores[row]
            }
        }
    }
}
