//
//  CurveView.swift
//  0420连续曲线
//
//  Created by 尹绪坤(YINXUKUN137) on 2018/4/20.
//  Copyright © 2018年 尹绪坤(YINXUKUN137). All rights reserved.
//

import UIKit

class CurveView: UIView {

    var pointCount = 5
    var waveRange = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var points = [(CGFloat, CGFloat)]()
        for i in 0...pointCount {
            let px = 5.0 + (UIScreen.main.bounds.width-10.0) / CGFloat(pointCount) *  CGFloat(i)
            let py = 250.0 + CGFloat(Int(arc4random()) % waveRange)
            points.append((px, py))
        }
        let bezierPath = UIBezierPath()
        var prevPoint: CGPoint?
        var isFirst = true
        // obv, there are lots of ways of doing this. let's
        // please refrain from yak shaving in the comments
        for p in points {
            let point = CGPoint(x: p.0, y: p.1)
            
            let pPath = UIBezierPath()
            pPath.addArc(withCenter: point, radius: 3, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
            UIColor.green.setStroke()
            pPath.stroke()
            if let prevPoint = prevPoint {
                let midPoint = CGPoint(
                    x: (point.x + prevPoint.x) / 2,
                    y: (point.y + prevPoint.y) / 2
                )
                if isFirst {
                    bezierPath.addLine(to: midPoint)
                }
                else {
                    bezierPath.addQuadCurve(to: midPoint, controlPoint: prevPoint)
                }
                isFirst = false
            }
            else {
                bezierPath.move(to: point)
            }
            prevPoint = point
        }
        if let prevPoint = prevPoint {
            bezierPath.addLine(to: prevPoint)
        }
        UIColor.red.setStroke()
        bezierPath.stroke()
        
    }
}
