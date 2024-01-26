//
//  ToDoItem.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 6/4/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit
//@interface NSDateFormatter : NSFormatter

class ToDoItem: NSObject {
  
  //init(itemName : String, completed : Bool, dueDate : NSDate)
  
  //var toDoItems : [ToDoItem] = [ToDoItem] ()
  
  /*var itemName: String
  var completed : Bool */
  
  var itemName = ""
  var completed = false
  
  //convenience init(itemName : String, completed : Bool)
    convenience init(itemName : String, completed : Bool)
  {
    self.init()
    self.itemName = itemName
    self.completed = completed
  }
  

  
  
  /*DateFormatter *dateFormatter = [[DateFormatter alloc] init]
  dateFormatter.dateStyle = NSDateFormatterMediumStyle
  dateFormatter.timeStyle = NSDateFormatterNoStyle
   
  NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:118800]
   
  // US English Locale (en_US)
  dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]
  NSLog(@"%@", [dateFormatter stringFromDate:date]) // Jan 2, 2001 */
  
  /*let dateFormatter = DateFormatter()
  dateFormatter.dateStyle = .medium
  dateFormatter.timeStyle = .none
  dateFormatter.locale = Locale(identifier: "en_US")
  print(dateFormatter.string(from: date)) // Jan 2, 2001 */
  
  /*var formatter4 = DateFormatter()
  DateFormatter() = "MM/dd/yyyy"*/
 
  //USE THIS
  /*
  var dateFormatter : DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.dateFormat = "MM/dd/yyyy HH:mm"
    return formatter
  }
  */
  
  
  /*func loadInitialData() {
    //var item1 = ToDoItem(itemName: "Buy dress", completed: true, dueDate: formatter4.date(from: "10/14/2000") ?? "Unknown date")
    
    //var item1 = ToDoItem(itemName: "Buy dress", completed: true, dueDate: dateFormatter.string(from: "10/14/2000 08:00"))
    var item1 = ToDoItem(itemName: "Buy dress", completed: true, dueDate: "10/14/2000")
    self.toDoItems.append(item1)
    
    var item2 = ToDoItem(itemName: "Order candles", completed: false, dueDate: "10/18/2000")
    self.toDoItems.append(item2)
    
    var item3 = ToDoItem(itemName: "Book DJ", completed: true, dueDate: "10/12/2000")
    self.toDoItems.append(item3)
  } */
  
  //var dueDate : NSDate

  /*func returnArray () -> Int {
    return toDoItems.count
  } */
}
