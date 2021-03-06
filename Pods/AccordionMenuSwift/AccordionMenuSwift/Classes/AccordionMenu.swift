//
//  AccordionMenu.swift
//  AccordionMenu
//
//  Created by Victor on 7/6/16.
//  Copyright © 2016 Victor Sigler. All rights reserved.
//

import UIKit

open class AccordionTableViewController: UITableViewController {
    
    /// The number of elements in the data source
    fileprivate var total = 0
    
    /// The identifier for the parent cells.
    let parentCellIdentifier = "ParentCell"
    
    /// The identifier for the child cells.
    let childCellIdentifier = "ChildCell"
    
    /// The data source
    open var dataSource: [Parent] = [] {
        willSet {
            total = newValue.count
        }
    }
    
    var previous = 5
    var current = Int()
    
    /// Define wether can exist several cells expanded or not.
    open var numberOfCellsExpanded: NumberOfCellExpanded = .one
    
    /// Constant to define the values for the tuple in case of not exist a cell expanded.
    let NoCellExpanded = (-1, -1)
    
    /// The index of the last cell expanded and its parent.
    var lastCellExpanded : (Int, Int)!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.lastCellExpanded = NoCellExpanded
        self.tableView.tableFooterView = UIView()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /**
     Expand the cell at the index specified.
     
     - parameter index: The index of the cell to expand.
     */
    open func expandItemAtIndex(_ index : Int, parent: Int) {
        
        //NSLog("total before expand: \(total)")
        
        // the data of the childs for the specific parent cell.
        let currentSubItems = self.dataSource[parent].childs
        
        // update the state of the cell.
        self.dataSource[parent].state = .expanded
        
        // position to start to insert rows.
        var insertPos = index + 1
        
        let indexPaths = (0..<currentSubItems.count).map { _ -> IndexPath in
            let indexPath = IndexPath(row: insertPos, section: 0)
            insertPos += 1
            return indexPath
        }
        
        // insert the new rows
        self.tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.fade)
        
        // update the total of rows
        self.total += currentSubItems.count
        //NSLog("total after expand: \(total)")
    }
    
    /**
     Collapse the cell at the index specified.
     
     - parameter index: The index of the cell to collapse
     */
    open func collapseSubItemsAtIndex(_ index : Int, parent: Int) {
        //NSLog("total before collapse: \(total)")
        var indexPaths = [IndexPath]()
        
        let numberOfChilds = self.dataSource[parent].childs.count
        
        // update the state of the cell.
        self.dataSource[parent].state = .collapsed
        
        guard index + 1 <= index + numberOfChilds else { return }
        
        // create an array of NSIndexPath with the selected positions
        indexPaths = (index + 1...index + numberOfChilds).map { IndexPath(row: $0, section: 0)}
        
        // remove the expanded cells
        self.tableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.fade)
        
        // update the total of rows
        
        if !(current == previous){
            self.total -= numberOfChilds
        }
        //NSLog("total after collapse: \(total)")
        //self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    /**
     Update the cells to expanded to collapsed state in case of allow severals cells expanded.
     
     - parameter parent: The parent of the cell
     - parameter index:  The index of the cell.
     */
    open func updateCells(_ parent: Int, index: Int) {
        
        switch (self.dataSource[parent].state) {
            
        case .expanded:
            self.collapseSubItemsAtIndex(index, parent: parent)
            self.lastCellExpanded = NoCellExpanded
            
        case .collapsed:
            switch (numberOfCellsExpanded) {
            case .one:
                // exist one cell expanded previously
                if self.lastCellExpanded != NoCellExpanded {
                    
                    let (indexOfCellExpanded, parentOfCellExpanded) = self.lastCellExpanded
                    
                    self.collapseSubItemsAtIndex(indexOfCellExpanded, parent: parentOfCellExpanded)
                    
                    // cell tapped is below of previously expanded, then we need to update the index to expand.
                    if parent > parentOfCellExpanded {
                        let newIndex = index - self.dataSource[parentOfCellExpanded].childs.count
                        self.expandItemAtIndex(newIndex, parent: parent)
                        self.lastCellExpanded = (newIndex, parent)
                    }
                    else {
                        self.expandItemAtIndex(index, parent: parent)
                        self.lastCellExpanded = (index, parent)
                    }
                }
                else {
                    self.expandItemAtIndex(index, parent: parent)
                    self.lastCellExpanded = (index, parent)
                }
            case .several:
                self.expandItemAtIndex(index, parent: parent)
            }
        }
    }
    
    /**
     Find the parent position in the initial list, if the cell is parent and the actual position in the actual list.
     
     - parameter index: The index of the cell
     
     - returns: A tuple with the parent position, if it's a parent cell and the actual position righ now.
     */
    open func findParent(_ index : Int) -> (parent: Int, isParentCell: Bool, actualPosition: Int) {
        
        var position = 0, parent = 0
        guard position < index else { return (parent, true, parent) }
        
        var item = self.dataSource[parent]
        
        repeat {
            
            switch (item.state) {
            case .expanded:
                position += item.childs.count + 1
            case .collapsed:
                position += 1
            }
            
            parent += 1
            
            // if is not outside of dataSource boundaries
            if parent < self.dataSource.count {
                item = self.dataSource[parent]
            }
            
        } while (position < index)
        
        // if it's a parent cell the indexes are equal.
        if position == index {
            return (parent, position == index, position)
        }
        
        item = self.dataSource[parent - 1]
        return (parent - 1, position == index, position - item.childs.count - 1)
    }
}

extension AccordionTableViewController {
    
    // MARK: UITableViewDataSource
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.total
    }
    
    override  open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (String(describing: self).range(of: "ResourceViewController") != nil) {
            if (indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
                if let titleCell = cell as? ResourceTitleCell {
                    titleCell.courseLabel.text = self.dataSource[0].score[self.dataSource[0].score.count - 1]
                }
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                cell.isUserInteractionEnabled = false
                return cell
            }
        }
        
        let (parent, isParentCell, actualPosition) = self.findParent(indexPath.row)
        
        if (String(describing: self).range(of: "GradeAccordionViewController") != nil) {
            if (indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
               /* if let titleCell = cell as? ResourceTitleCell {
                    titleCell.courseLabel.text = "All Courses"
                } */
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                cell.isUserInteractionEnabled = false
                return cell
            }
            if !isParentCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: childCellIdentifier, for: indexPath)
                if let childCell = cell as? ChildTableViewCell {
                    childCell.nameLabel.text = self.dataSource[parent].childs[indexPath.row - actualPosition - 1]
                    childCell.scoreLabel.text = self.dataSource[parent].score[indexPath.row - actualPosition - 1]
                    childCell.selectionStyle = UITableViewCellSelectionStyle.none
                }
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: parentCellIdentifier, for: indexPath)
                if let parentCell = cell as? ParentTableViewCell {
                    parentCell.nameLabel!.text = self.dataSource[parent].title
                    parentCell.percentLabel.text = calculatePercent(scores: self.dataSource[parent].score)
                    if (self.dataSource[parent].state == .expanded){
                        parentCell.plusView.plus = false
                        parentCell.plusView.setNeedsDisplay()
                    } else {
                        parentCell.plusView.plus = true
                        parentCell.plusView.setNeedsDisplay()
                    }
                    parentCell.selectionStyle = UITableViewCellSelectionStyle.none
                }
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
            }
        } else {
            if !isParentCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: childCellIdentifier, for: indexPath)
                if let childCell = cell as? ResourceChildCell {
                    
                    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(self.dataSource[parent].childs[indexPath.row - actualPosition - 1])")
                    attributeString.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))                    
                    childCell.nameLabel.attributedText = attributeString
                    childCell.selectionStyle = UITableViewCellSelectionStyle.none
                }
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                
                
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: parentCellIdentifier, for: indexPath)
                if let parentCell = cell as? ResourceParentCell {
                    parentCell.nameLabel!.text = self.dataSource[parent].title
                    if (self.dataSource[parent].state == .expanded){
                        parentCell.plusView.plus = false
                        parentCell.plusView.setNeedsDisplay()
                    } else {
                        parentCell.plusView.plus = true
                        parentCell.plusView.setNeedsDisplay()
                    }
                    
                    parentCell.selectionStyle = UITableViewCellSelectionStyle.none
                }
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
            }
        }
        

    }
    
    // MARK: UITableViewDelegate
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let (parent, isParentCell, actualPosition) = self.findParent(indexPath.row)
        
        previous = current
        //current = indexPath.row
        current = parent
        
        guard isParentCell else {
            NSLog("A child was tapped!!!")
            
            // The value of the child is indexPath.row - actualPosition - 1
            return
        }
        
        
        self.tableView.beginUpdates()
        self.updateCells(parent, index: indexPath.row)
        self.tableView.endUpdates()
        for i in 0...total-1 {
           self.tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
        }
        
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 65
        }
        return !self.findParent(indexPath.row).isParentCell ? 44.0 : 64.0
    }
}

func calculatePercent(scores: [String]) -> String {
    var total = 0.0
    var score = 0.0
    for i in scores {
        var myStringArr = i.components(separatedBy: "/")
        score += Double(myStringArr[0])!
        total += Double(myStringArr[1])!
    }
    var percent = Int(round((score/total)*100.0))
    return "\(percent)%"
}
