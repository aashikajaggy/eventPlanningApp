//
//  ToDoViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 6/4/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit


class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChangeButton {
  
  @IBOutlet weak var enterButton: UIButton!
  var item : ToDoItem = ToDoItem(itemName: "", completed: false)
  
  @IBOutlet weak var listView: UITableView!
  
  //@IBOutlet var swipeGestureRight: UISwipeGestureRecognizer!
  
//CUD BE USED
 /*@IBAction func swipeMade(_ sender: UISwipeGestureRecognizer) {
    /*let cell = listView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let item = toDoItems[indexPath.row]
    item.completed = true
    cell.accessoryType =  UITableViewCell.AccessoryType.checkmark
    cell.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.9)
    self.listView.reloadData() */
  listView.backgroundColor = UIColor.purple
  
  } */
  
  /* @IBAction func swipeMadeLeft(_ sender: UISwipeGestureRecognizer) {
    listView.backgroundColor = UIColor.red
    print("left")
  } */
  
  
  //let class1 = ToDoItem()
  
  var toDoItems : [ToDoItem] = [ToDoItem] ()
  
  @IBOutlet weak var addItem: UITextField!
  @IBOutlet weak var addItemButton: UIButton!
  
  //var originalCenter = CGPoint()
  //var deleteOnDragRelease = false
  
  func loadInitialData(){
    //var item1 = ToDoItem(itemName: "Buy dress", completed: true, dueDate: formatter4.date(from: "10/14/2000") ?? "Unknown date")
    
    //var item1 = ToDoItem(itemName: "Buy dress", completed: true, dueDate: dateFormatter.string(from: "10/14/2000 08:00"))
    /*
     let item1 = ToDoItem(itemName: "Buy dress", completed: true)
     self.toDoItems.append(item1)
     
     let item2 = ToDoItem(itemName: "Order candles", completed: false)
     self.toDoItems.append(item2)
     
     let item3 = ToDoItem(itemName: "Book DJ", completed: true)
     self.toDoItems.append(item3)
     */
    
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //return ToDoItem.returnArray()
    
    return toDoItems.count
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      self.toDoItems.remove(at: indexPath.row)
      self.listView.deleteRows(at: [indexPath], with: .fade)
      self.listView.reloadData()
    }
  }
  
  /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, sender: swipeGestureRight) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let item = toDoItems[indexPath.row]
    item.completed = true
    cell.accessoryType =  UITableViewCell.AccessoryType.checkmark
    cell.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.9)
    self.listView.reloadData()
  } */
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier:"ListPrototypeCell")
  
    let cell = listView.dequeueReusableCell(withIdentifier: "ListPrototypeCell", for: indexPath) as! toDoTableViewCell
    //THIS CUD BE USED
        //as! UITableViewCell
    
    //let item : (toDoItem) = toDoItems[indexPath.row]
    let item = toDoItems[indexPath.row]
    
    cell.taskNameLabel?.text = item.itemName
    cell.selectionStyle = .none
    
    
    /*let recognizer = UIPanGestureRecognizer(target: cell, action: Selector(("handlePan:")))
    recognizer.delegate = cell
    cell.addGestureRecognizer(recognizer) */
    
    /*let leftSwipe = UISwipeGestureRecognizer(target: cell, action: Selector(("handlePan:")))
    leftSwipe.direction = .left
    
    cell.addGestureRecognizer(leftSwipe) */
    
    //better backup code
    //let leftRecognizer = UISwipeGestureRecognizer(target: cell, action: #selector(swipeMade(_:)))
    //leftRecognizer.direction = .left
    
    //let rightRecognizer = UISwipeGestureRecognizer(target: cell, action: #selector(swipeMade(_:)))
    //rightRecognizer.direction = .right
    //cell.addGestureRecognizer(leftRecognizer)
    //cell.addGestureRecognizer(rightRecognizer)
    
    
    if item.completed == true {
      //THIS CUD BE USED
      //cell.accessoryType =  UITableViewCell.AccessoryType.checkmark
      cell.checkboxButton?.setBackgroundImage(UIImage(named: "checkedBox.png"), for: UIControl.State.normal)
      //cell.backgroundColor = UIColor(hex: #a4ff91)
      cell.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.9)
    }
    else {
      //THIS CUD BE USED
      //cell.accessoryType =  toDoTableViewCell.AccessoryType.none
      //cell.accessoryType = UITableViewCell.AccessoryType.none
      //cell.checkboxButton.setBackgroundImage(UIImage(named: "stop"), for: UIControl.State.normal)
      cell.checkboxButton?.setBackgroundImage(UIImage(named: "checkbox outline.png"), for: UIControl.State.normal)
      cell.backgroundColor = .white
    }
    
    cell.delegate = self
    cell.indexP = indexPath.row
    cell.toDoItems = toDoItems
    
    return cell
  }
  
  func changeButton(completed: Bool, index: Int) {
    toDoItems[index].completed = completed
    listView.reloadData()
  }
  
  /*@objc func handleSwipe(sender: UISwipeGestureRecognizer, cellForRowAt indexPath: IndexPath) {
    
    if sender.state == .ended {
      let item = toDoItems[indexPath.row]
      let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier:"ListPrototypeCell")
      switch sender.direction {
      //if user swipes left (deletes to-do)
      //case .left :
      case .right :
        item.completed = true
        cell.accessoryType =  UITableViewCell.AccessoryType.checkmark
        //cell.backgroundColor = UIColor(hex: #a4ff91)
        cell.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.9)
      
      default:
        break
      }
    }
  } */
  
  //Traditional Check off completed method
  /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    listView.deselectRow(at: indexPath, animated: false)
    let tappedItem : ToDoItem = self.toDoItems[indexPath.row]
    //tappedItem.completed = !tappedItem.completed
    tappedItem.completed = true
    listView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
    
  } */
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> UITextField? {
    return addItem
  }
  
  
  
  @IBAction func buttonPressed(_ sender: Any) {
    //if self.addItem.text?.count ?? 0 > 0 {
    if self.addItem?.text != "" {
      self.item = ToDoItem(itemName: self.addItem.text ?? "", completed: false)
      self.toDoItems.append(item)
    }
    self.listView.reloadData()
  }
  
  /*func reloadTheData () {
    self.reloadData()
  } */
  
  /*@IBAction func unwindToList(segue: UIStoryboardSegue) {
    if item != nil {
      self.toDoItems.append(item)
      self.tableView.reloadData()
    }
  } */
  
  //horizontal pan gesture method
  /*func handlePan(recognizer: UIPanGestureRecognizer, cellForRowAt indexPath: IndexPath) {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier:"ListPrototypeCell")
    //1
    if recognizer.state == .began {
      //when gesture begins, record current center location
      originalCenter = cell.center
    }
    //2
    if recognizer.state == .changed {
      let translation = recognizer.translation(in: cell)
      //listView.center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
      // has the user dragged the item far enough to initiate a delete/complete?
      deleteOnDragRelease = cell.frame.origin.x < -cell.frame.size.width / 2.0
    }
    //3
    if recognizer.state == .ended {
      // the frame this cell had before user dragged it
      let originalFrame = CGRect(x: 0, y: cell.frame.origin.y,
      width: cell.bounds.size.width, height: listView.bounds.size.height)
      if !deleteOnDragRelease {
        // if the item is not being deleted, snap back to the original location
        UIView.animate(withDuration: 0.2, animations: {cell.frame = originalFrame})
      }
    }
  } */
  
  /*func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
      if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
        let translation = panGestureRecognizer.translation(in: listView!)
        if abs(translation.x) > abs(translation.y) {
              return true
          }
          return false
      }
      return false
  } */
  
  //THIS CUD BE USED
  /*
  func toDoItemDeleted(toDoItem: ToDoItem) {
    let index = (toDoItems as NSArray).index(of: toDoItem)
    if index == NSNotFound { return }

    // could removeAtIndex in the loop but keep it here for when indexOfObject works
    //toDoItems.removeAtIndex(index)

    // use the UITableView to animate the removal of this row
    listView.beginUpdates()
    let indexPathForRow = NSIndexPath(row: index, section: 0)
    listView.deleteRows(at: [(indexPathForRow as IndexPath)], with: .fade)
    listView.endUpdates()
  } */
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      //loadInitialData()
    navigationController?.navigationBar.prefersLargeTitles = true
      listView.separatorStyle = .none
      //listView.backgroundColor = UIColor.blue
      listView.rowHeight = 50.0
      listView?.dataSource = self
      listView?.delegate = self
      //THIS CUD BE USED
      /*listView.register(toDoTableViewCell.self, forCellReuseIdentifier: "ListPrototypeCell") */
        // Do any additional setup after loading the view.
    }
   
  /*
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      let item : self.toDoItems[indexPath.row]
      cell.textLabel?.text = item.itemName
      return cell
    
    //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ListPrototypeCell")
    //cell.textLabel?.text = toDoItems[indexPath.row]
    
    
  }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
