//
//  Circle.swift
//  UkeTabs
//
//  Created by Seongmin on 12/6/15.
//  Copyright © 2015 Seongmin. All rights reserved.
//

import UIKit

class Circle: UIView {

    let size: CGFloat = 15.0
    
    init(origin: CGPoint) {
        super.init(frame: CGRectMake(0.0, 0.0, size, size))
        self.center = origin
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 7.5,y: 7.5), radius: CGFloat(7.5), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        UIColor.redColor().setFill()
        circlePath.fill()
    }
    
    

}
