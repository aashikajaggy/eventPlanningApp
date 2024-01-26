//
//  toDoTableViewCell.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 6/8/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit

// A protocol that the TableViewCell uses to inform its delegate of state change
protocol toDoTableViewCellDelegate {
    // indicates that the given item has been deleted
    func toDoItemDeleted(todoItem: ToDoItem)
}

protocol ChangeButton {
  func changeButton(completed : Bool, index: Int)
}


class toDoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var checkboxButton: UIButton!
  
  @IBOutlet weak var taskNameLabel: UILabel!
  
  @IBAction func checkboxPressed(_ sender: Any) {
    if toDoItems[indexP!].completed {
      delegate?.changeButton(completed: false, index: indexP!)
    }
    else {
      delegate?.changeButton(completed: true, index: indexP!)
    }
  }
    
  
  var delegate : ChangeButton?
  var indexP: Int?
  var toDoItems: [ToDoItem] = []
  
    //CUD BE USED
  /*
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
 */
  
  
    // The object that acts as delegate for this cell.
    //var delegate: toDoTableViewCellDelegate?
    // The item that this cell renders.
    //var toDoItem: ToDoItem?
    
    /*required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }*/
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
      super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ListPrototypeCell")
      
      
      // add a pan recognizer
      /*let recognizer = UIPanGestureRecognizer(target: self, action: Selector(("handlePan:")))
      recognizer.delegate = self
      addGestureRecognizer(recognizer) */
      
    }
  
  /*required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }*/
  
    
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

      /*override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      } */
    
  //CUD BE USED
  /*
    //MARK: - horizontal pan gesture methods
    func handlePan(recognizer: UIPanGestureRecognizer) {
      // 1
      if recognizer.state == .began {
        // when the gesture begins, record the current center location
        originalCenter = center
      }
      // 2
      if recognizer.state == .changed {
        let translation = recognizer.translation(in: self)
        //center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
        // has the user dragged the item far enough to initiate a delete/complete?
        deleteOnDragRelease = frame.origin.x < -frame.size.width / 2.0
      }
      // 3
      if recognizer.state == .ended {
        // the frame this cell had before user dragged it
        let originalFrame = CGRect(x: 0, y: frame.origin.y,
            width: bounds.size.width, height: bounds.size.height)
        if !deleteOnDragRelease {
          // if the item is not being deleted, snap back to the original location
          UIView.animate(withDuration: 0.2, animations: {self.frame = originalFrame})
        }
        if deleteOnDragRelease {
            if delegate != nil && toDoItem != nil {
                // notify the delegate that this item should be deleted
              delegate!.toDoItemDeleted(todoItem: toDoItem!)
            }
        }
      }
    }
 */
    
  //CUD BE USED
  /*
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
          let translation = panGestureRecognizer.translation(in: superview!)
          if abs(translation.x) > abs(translation.y) {
                return true
            }
            return false
        }
        return false
    }
*/

}
