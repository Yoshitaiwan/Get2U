//
//  SettingTableViewController.swift
//  DeliveryMap
//
//  Created by Yoshi on 26/3/17.
//  Copyright © 2017 Yoshi. All rights reserved.
//

import UIKit

struct cellData{
    let item :String
    let description : String
    let price : Int
    let itemImage : UIImage?
}


class MenuTableViewController: UITableViewController {

    let list = ["","Payment","Order History","Help", "Setting", "","","Resgister in Get2U"]
    let arrayOfCellData = [cellData(item : "Coffee Latte"   ,  description : "12 onz",price : 120, itemImage:UIImage(named:"latte.png")),
                           cellData(item : "American Coffee", description : "Colombia Beans", price : 70, itemImage:UIImage(named:"Americano.png") )]
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfCellData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        //cell.textLabel?.text = list[indexPath.row]
        //return cell
        let cell = Bundle.main.loadNibNamed("MenuTableViewCell", owner: self, options:nil)?.first as! MenuTableViewCell
        
        cell.menuImageView.contentMode = UIViewContentMode.scaleAspectFit
        cell.menuImageView.image = arrayOfCellData[indexPath.row].itemImage
        
        cell.itemLabel.text = arrayOfCellData[indexPath.row].item
        cell.descriptionLabel.text = arrayOfCellData[indexPath.row].description
        cell.priceLabel.text = "NTD " + String(arrayOfCellData[indexPath.row].price)
        
        
        return cell 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
    }
    
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
        return 128
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
