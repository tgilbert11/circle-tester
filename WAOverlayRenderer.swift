
//
//  WAOverlayRenderer.swift
//  circle tester
//
//  Created by Taylor H. Gilbert on 7/20/14.
//  Copyright (c) 2014 Taylor H. Gilbert. All rights reserved.
//

import Foundation
import QuartzCore
import MapKit

class WAOverlayRenderer: MKOverlayPathRenderer {
    
    init(overlay: MKOverlay!) {
        super.init(overlay: overlay)
    }
    
    // this is the one I expect it to use
    override func drawMapRect(mapRect: MKMapRect, zoomScale: MKZoomScale, inContext context: CGContext!) {

        let lineLengthConst: CGFloat = 0.05

        var sizeCGRect: CGRect = rectForMapRect(overlay.boundingMapRect)
        
        CGContextAddRect(context, sizeCGRect)
        CGContextClip(context)
        
        CGContextScaleCTM(context, 1, -1)
        CGContextTranslateCTM(context, 0, -sizeCGRect.size.height)
        
        let data: (temperature: Int, dewpoint:Int, cloudCover:Int, windsAloft: [(direction: Int, velocity: Int, temperature: Int)]) = (overlay as WAOverlay).data
        
        if data.cloudCover > -1 {
            //println("oh hell yeah")
            let tempHue: CGFloat = hueForTemperature(data.temperature)
            let dewHue: CGFloat = hueForTemperature(data.dewpoint)
            
            var tempArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(tempArc, nil,
                CGRectGetMidX(sizeCGRect), CGRectGetMidY(sizeCGRect),
                abs(sizeCGRect.size.width)/2/16*CGFloat(1.75),
                -3.14159/8,
                3.14159*9/8,
                false)
            CGContextAddPath(context, tempArc)
            CGContextSetStrokeColorWithColor(context, UIColor(hue: tempHue, saturation: 1, brightness: 1, alpha: 1).CGColor)
            CGContextSetLineWidth(context, abs(sizeCGRect.size.width)/2/16*3.5)
            CGContextStrokePath(context)
            
            var dewArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(dewArc, nil,
                CGRectGetMidX(sizeCGRect), CGRectGetMidY(sizeCGRect),
                abs(sizeCGRect.size.width)/2/16*CGFloat(1.75),
                -3.14159/8,
                3.14159*9/8,
                true)
            CGContextAddPath(context, dewArc)
            CGContextSetStrokeColorWithColor(context, UIColor(hue: dewHue, saturation: 1, brightness: 1, alpha: 1).CGColor)
            CGContextSetLineWidth(context, abs(sizeCGRect.size.width)/2/16*3.5)
            CGContextStrokePath(context)
            
            var cloudArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(cloudArc, nil,
                CGRectGetMidX(sizeCGRect), CGRectGetMidY(sizeCGRect),
                abs(sizeCGRect.size.width)/2/16*CGFloat(4.25),
                0,
                3.1416*2,
                false)
            CGContextAddPath(context, cloudArc)
            CGContextSetStrokeColorWithColor(context, UIColor(hue: 1, saturation: 1, brightness: 0, alpha: 0.25*CGFloat(data.cloudCover)).CGColor)
            CGContextSetLineWidth(context, abs(sizeCGRect.size.width)/2/16*1.5)
            CGContextStrokePath(context)
            
            
            
            
        }
        
        for index in 1...data.windsAloft.count-1 {
            //println("\(overlay.title), index: \(index), data.count: \(data.count)")
            if data.windsAloft[index].direction != -10 {
                let centerAngle:CGFloat = CGFloat(-data.windsAloft[index].direction+90)*3.14159/180
                let angleDelta: CGFloat = lineLengthConst/(CGFloat(index)+0.5)*CGFloat(data.windsAloft[index].velocity)
                
                let hue: CGFloat = hueForTemperature(data.windsAloft[index].temperature)
                
                var tempArc:CGMutablePathRef = CGPathCreateMutable()
                CGPathAddArc(tempArc, nil,
                    CGRectGetMidX(sizeCGRect), CGRectGetMidY(sizeCGRect),
                    abs(sizeCGRect.size.width)/2/16*CGFloat(Float(index) + 4.5),
                    centerAngle - angleDelta,
                    centerAngle + angleDelta,
                    false)
                CGContextAddPath(context, tempArc)
                CGContextSetStrokeColorWithColor(context, UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1).CGColor)
                CGContextSetLineWidth(context, abs(sizeCGRect.size.width)/2/16)
                CGContextStrokePath(context)
                
                
                var haloArc:CGMutablePathRef = CGPathCreateMutable()
                CGPathAddArc(haloArc, nil, CGRectGetMidX(sizeCGRect), CGRectGetMidY(sizeCGRect), abs(sizeCGRect.size.width)/2/16*CGFloat(Float(index) + 4.5),
                    0, 3.14159*2, false)
                CGContextAddPath(context, haloArc)
                CGContextSetStrokeColorWithColor(context, UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 0.25).CGColor)
                CGContextSetLineWidth(context, abs(sizeCGRect.size.width)/2/16)
                CGContextStrokePath(context)
            }
            else {}
        }
    }
    
    func hueForTemperature(temperature: Int) -> CGFloat {
        var hue: CGFloat = 0;
        switch temperature {
        case 44 ... 65:
            hue = 0
        case 22 ... 43:
            hue = CGFloat(-0.167/22.0*Float(temperature-43))
        case 1 ... 21:
            hue = CGFloat(-0.333/21.0*Float(temperature-21)+0.167)
        case -17 ... 0:
            hue = CGFloat(-0.167/18.0*Float(temperature)+0.5)
        case -100 ... -18:
            hue = CGFloat(-0.166/42.0*Float(temperature+18)+0.667)
        default:
            hue = CGFloat(-0.166/42.0*Float(temperature+18)+0.667)
        }
        return hue
    }
    
    override func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {}
    
    override func createPath() {
        
    }
    
}