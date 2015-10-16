//
//  WindsAloftOverlayView.swift
//  circle tester
//
//  Created by Taylor H. Gilbert on 7/20/14.
//  Copyright (c) 2014 Taylor H. Gilbert. All rights reserved.
//

import Foundation
import MapKit
import QuartzCore

class WindsAloftOverlayView: MKOverlayView {
    
    let viewWidth: CGFloat = 100
    let viewHeight: CGFloat = 100
    let lineLengthConst: CGFloat = 0.025
/*
    override func drawMapRect(mapRect: MKMapRect, zoomScale: MKZoomScale, inContext context: CGContext!) {
        
        let angles = [90, 100,130, 170, 140, 110, 90, 60, 30, 0, 340]
        let velocities = [4, 12, 30, 50, 80, 140, 170, 110, 70, 30, 50]
        let temps = [40, 29, 18,7, -4,-15,-26,-37,-48,-59,-70]
        
        for index in 0...10 {
            let centerAngle:CGFloat = CGFloat(-angles[index]+90)*3.14159/180
            let angleDelta: CGFloat = lineLengthConst/(CGFloat(index)+1.5)*CGFloat(velocities[index])
            var hue: CGFloat = 0;
            switch temps[index] {
            case 44 ... 65:
                hue = 0
            case 22 ... 43:
                hue = CGFloat(-0.167/22.0*Float(temps[index]-43))
            case 1 ... 21:
                hue = CGFloat(-0.333/21.0*Float(temps[index]-21)+0.167)
            case -17 ... 0:
                hue = CGFloat(-0.167/18.0*Float(temps[index])+0.5)
            case -100 ... -18:
                hue = CGFloat(-0.166/42.0*Float(temps[index]+18)+0.667)
            default:
                hue = CGFloat(-0.166/42.0*Float(temps[index]+18)+0.667)
            }
            
            var tempArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(tempArc, nil,
                viewWidth/2, viewWidth/2,
                viewWidth/2/12*CGFloat(Float(index) + 1.5),
                centerAngle - angleDelta,
                centerAngle + angleDelta,
                false)
            var lineWidth:CGFloat = viewWidth/2/12
            var strokedTempArc: CGPathRef =
            CGPathCreateCopyByStrokingPath(tempArc, nil,
                lineWidth,
                kCGLineCapButt,
                kCGLineJoinMiter,
                10)
            var shapeLayer: CAShapeLayer = CAShapeLayer()
            shapeLayer.fillColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1).CGColor
            shapeLayer.strokeColor = UIColor.blackColor().CGColor
            shapeLayer.path = strokedTempArc
            shapeLayer.drawInContext(context)
            
            var haloArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(haloArc, nil, viewWidth/2, viewHeight/2, viewWidth/2/12*CGFloat(Float(index) + 1.5),
                0, 3.14159*2, false)
            var strokedHaloArc: CGPathRef = CGPathCreateCopyByStrokingPath(haloArc, nil, lineWidth, kCGLineCapButt, kCGLineJoinMiter, 10)
            var haloShapeLayer: CAShapeLayer = CAShapeLayer()
            haloShapeLayer.fillColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 0.35).CGColor
            haloShapeLayer.path = strokedHaloArc
            haloShapeLayer.drawInContext(context)
        }

        
    }
    
    */
    
}