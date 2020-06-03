//
//  ViewController.swift
//  ConflictingEvents
//
//  Created by Nicholas Sharp on 7/26/19.
//

import UIKit

class ViewController: UIViewController {
  
  struct Events : Decodable {
    let title : String
    let start : URL
    let end : String
  }
  
  var events = [Events]()
  
  func parseEvents() {
    let url = Bundle.main.url(forResource:"mock", withExtension: "json")!
    let jsonData = try! Data(contentsOf: url)
    self.events = try! JSONDecoder().decode([Events].self, from: jsonData)
    self.tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    parseEvents()
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    
    var dict = Array[indexPath.row]
    cell.lbl1.text = dict["title"] as? String
    cell.lbl2.text = dict["start"] as? String
    cell.lbl3.text = dict["end"] as? String
 
 
    let imageUrl:URL = URL(string: imageUrlString as! String)!
    let imageData:NSData = NSData(contentsOf: imageUrl)!
    cell.img.image = UIImage(data: imageData as Data)
    
    
    
    return cell
  }
}



