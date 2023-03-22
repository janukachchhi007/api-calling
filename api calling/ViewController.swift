//
//  ViewController.swift
//  api calling
//
//  Created by R94 on 17/03/23.
//

import UIKit
import Alamofire

struct GetApi : Codable
{
    var userId :Int
    var id : Int
    var title : String
    var body : String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var arr : [GetApi] = []

    @IBOutlet weak var dataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
//    func getData()
//         {
//              let url = URL(string:  "https://jsonplaceholder.typicode.com/posts")
//              var ur = URLRequest(url: url!)
//              ur.httpMethod = "GET"
//
//              URLSession.shared.dataTask(with: ur) { data, response, error in
//              do
//                {
//                  if  error == nil
//                  {
//                      self.arr = try JSONDecoder().decode([GetApi].self, from: data!)
//                      print(self.arr)
//                      DispatchQueue.main.async {
//                      self.dataTableView.reloadData()
//                          }
//                       }
//                 }
//                 catch
//                {
//                     print(error.localizedDescription)
//                }
//            }.resume()
//        }
    func getData()
         {
             AF.request("https://jsonplaceholder.typicode.com/posts",method: .get).responseData { respo in
             switch respo.result{
            case.success(let data):
            do
            {
               if  data == respo.value
               {
                    self.arr = try JSONDecoder().decode([GetApi].self, from: data)
                    print(self.arr)
                    DispatchQueue.main.async {
                    self.dataTableView.reloadData()
                                }
                }
           }
           catch
          {
               print(error.localizedDescription)
          }
          case .failure(let fail):
                print(fail.localizedDescription)
               }
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TableViewCell
        cell.lable1.text = "\(arr[indexPath.row].userId)"
        cell.lable2.text = arr[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

