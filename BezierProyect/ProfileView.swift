//
//  ProfileView.swift
//  BezierProyect
//
//  Created by Misael Pérez Chamorro on 5/12/15.
//  Copyright (c) 2015 Misael Pérez Chamorro. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ProfileView: UIView {
  
  let NoOfSections = 4
  let π:CGFloat = CGFloat(M_PI)
  
  @IBInspectable var counter: Int = 2
  @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
  @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
  
  override func drawRect(rect: CGRect) {
    // 1
    let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
    
    // 2
    let radius: CGFloat = max(bounds.width, bounds.height) - 5
    
    // 3
    let arcWidth: CGFloat = 12
    
    // 4
    let startAngle: CGFloat = 2 * π / 3
    let endAngle: CGFloat = π / 3
    
    // 5
    
    
    let angleDifference: CGFloat = 2 * π - startAngle + endAngle
    
    //then calculate the arc for each single glass
    let arcLengthPerGlass = angleDifference / CGFloat(NoOfSections)
    
    var currentStartAngle: CGFloat = startAngle
    
    for index in 1...NoOfSections{
      
      
      //multiply out by the current index
      let outlineEndAngle = arcLengthPerGlass * CGFloat(index) + startAngle
      
      if NoOfSections != index {
        
        
        var path = UIBezierPath(arcCenter: center,
          radius: radius/2 - arcWidth/2,
          startAngle: currentStartAngle,
          endAngle: outlineEndAngle - π/15,
          clockwise: true)
        
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
          radius: radius/2,
          startAngle: currentStartAngle,
          endAngle: outlineEndAngle - π/15,
          clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArcWithCenter(center,
          radius: radius/2 - arcWidth,
          startAngle: outlineEndAngle - π/15,
          endAngle: currentStartAngle,
          clockwise: false)
        
        //4 - close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 3.0
        outlinePath.stroke()
        currentStartAngle = outlineEndAngle
        

        
      } else {
        
        var path = UIBezierPath(arcCenter: center,
          radius: radius/2 - arcWidth/2,
          startAngle: currentStartAngle,
          endAngle: outlineEndAngle,
          clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
          radius: radius/2,
          startAngle: currentStartAngle,
          endAngle: outlineEndAngle,
          clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArcWithCenter(center,
          radius: radius/2 - arcWidth,
          startAngle: outlineEndAngle,
          endAngle: currentStartAngle,
          clockwise: false)
        
        //4 - close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 3.0
        outlinePath.stroke()
        currentStartAngle = outlineEndAngle

        
      }
      

      
    }
    
  }
  
}
