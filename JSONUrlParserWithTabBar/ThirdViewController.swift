//
//  ThirdViewController.swift
//  JSONUrlParserWithTabBar
//
//  Created by Greeens5 on 04/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
    var linkkey = "https://www.foodpalette.in/Chennai/Api/UserHomeApi.php"
    var name = [String] ()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid3", for: indexPath) as! TableViewCell
        cell.label3.text = name[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: linkkey)
        URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if error != nil
            {
                print(error!)
            }else{
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    {
                        
                        let myarray = json["ourpicks"] as! NSArray
                        for arr in myarray
                        {
                            if let path = arr as?[String: Any]
                            {
                                
                                self.name.append(path["ProductId"] as! String)
                                self.name.append(path["ProductName"] as! String)
                                self.name.append(path["Availability"] as! String)
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
            }.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
