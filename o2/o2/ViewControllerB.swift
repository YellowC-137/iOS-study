//
//  ViewControllerB.swift
//  o2
//
//  Created by jsh on 2023/08/20.
//

import Foundation
import UIKit



/*
 class ViewControllerB:  UITableViewController {
     @IBOutlet var tableview: UITableView!
     var items = ["전체 선택", "하위 체크박스 1", "하위 체크박스 2"]
     var isCheckedAll = false
     var isCheckedSub1 = false
     var isCheckedSub2 = false
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
         tableview.dataSource = self
         tableview.delegate = self
         
     }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = true
         UIApplication.shared.isStatusBarHidden = true
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         navigationController?.navigationBar.isHidden = false
         UIApplication.shared.isStatusBarHidden = false
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
     }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxCell", for: indexPath) as! CheckboxTableViewCell
         let label = cell.viewWithTag(1) as? UILabel
         let checkbox = cell.viewWithTag(2) as? UIImageView
         
         label?.text = items[indexPath.row]
         
         switch indexPath.row {
         case 0:
             checkbox?.image = isCheckedAll ? UIImage(named: "checked") : UIImage(named: "unchecked")
         case 1:
             checkbox?.image = isCheckedSub1 ? UIImage(named: "checked") : UIImage(named: "unchecked")
         case 2:
             checkbox?.image = isCheckedSub2 ? UIImage(named: "checked") : UIImage(named: "unchecked")
         default:
             break
         }
         
         return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         
         switch indexPath.row {
         case 0:
             isCheckedAll.toggle()
             isCheckedSub1 = isCheckedAll
             isCheckedSub2 = isCheckedAll
         case 1:
             isCheckedSub1.toggle()
         case 2:
             isCheckedSub2.toggle()
         default:
             break
         }
         
         tableView.reloadData()
     }
     
     
 }

         
  

 */
