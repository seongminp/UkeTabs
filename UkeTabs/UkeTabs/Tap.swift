//
//  Class.swift
//  UkeTabs
//
//  Created by Seongmin on 12/6/15.
//  Copyright © 2015 Seongmin. All rights reserved.
//

import UIKit

class Tap {
    var row : Int = 0
    var col : Int = 0
    var imageView : UIImageView? = nil
    var circle : Circle? = nil
    var key: String = ""
    static let tabXCoordinates: [CGFloat] = [23,101,182,257]
    static let tabYCoordinates: [CGFloat] = [80,195,302.5,410]
    
    init(location: CGPoint, parentView: UIImageView) {
        print("xTouched: " + String(location.x) + ", yTouched: " + String(location.y))
        row = getRow(location)
        col = getCol(location)
        imageView = parentView
        key = String(row) + String(col)
    }
    
    func getRow(point: CGPoint) -> Int {
        let yCoord = point.y
        // Move to fixed position within tab.
        switch yCoord {
            case 0...140: return 0
            case 140...248.5: return 1
            case 248.5...355: return 2
            default: return 3
        }
    }
    
    func getCol(point: CGPoint) -> Int {
        let xCoord = point.x
        // Move to fixed position within tab.
        switch xCoord {
            case 0...50: return 0
            case 50...142.5: return 1
            case 142.5...222.5: return 2
            default: return 3
        }
    }
    
    func drawDot() {
        let xCoord = Tap.tabXCoordinates[col]
        let yCoord = Tap.tabYCoordinates[row]
        let originPoint  = CGPoint(x: xCoord, y: yCoord)
        circle = Circle(origin: originPoint)
        imageView!.addSubview(circle!)
        print ("xCoord:" + String(xCoord) + ", yCoord: " + String(yCoord))
    }
    
    func removeTap() {
        circle!.removeFromSuperview()
    }


}
