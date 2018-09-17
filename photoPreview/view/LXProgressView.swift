//
//  LXProgressView.swift
//  智慧运营
//
//  Created by 李旭 on 2018/9/12.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit

class LXProgressView: UIView {
   private var currentProgress :CGFloat = 0.0
    let lineWith :CGFloat = 10.0
    let excircleLineWith :CGFloat = 3.0
    var progress :CGFloat = 0.0 {
        willSet (newValue){
            currentProgress=newValue
            self.setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        let size = rect.size
        let arcCenter = CGPoint(x: size.width*0.5, y: size.height*0.5)
        var radius = min(size.width, size.height)*0.5
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = currentProgress*2*CGFloat(Double.pi) + startAngle
        radius -= self.excircleLineWith
        let excircle = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat( 2 * Double.pi), clockwise: true)
        excircle.lineWidth = excircleLineWith
        UIColor.white.set()
        excircle.lineCapStyle = CGLineCap.round
        excircle.stroke()
        radius -= self.excircleLineWith * 2
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = self.lineWith
        path.lineCapStyle = CGLineCap.round
        
        UIColor.white.set()
        path.addLine(to: arcCenter)
        path.fill()
    }
}
