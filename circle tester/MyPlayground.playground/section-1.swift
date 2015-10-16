// Playground - noun: a place where people can play

import XCPlayground
import Cocoa
import CoreGraphics
import QuartzCore

let viewWidth: CGFloat = 500
let viewHeight: CGFloat = 500
let lineLengthConst: CGFloat = 0.025

var str = "Hello, playground"
var view: NSView = NSView(frame: NSRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
view.wantsLayer = true
XCPShowView("view", view)

let angles = [90, 100,130, 170, 140, 110, 90, 60, 30, 0, 340]
let velocities = [4, 12, 30, 50, 80, 140, 170, 110, 70, 30, 50]
let temps = [40, 29, 18,7, -4,-15,-26,-37,-48,-59,-70]
let temperature = 39
let dewpoint = 10
let clouds = 4


for index in 0...15 {
    if index == 0 {
        var tempHue: CGFloat = 0;
        switch temperature {
        case 44 ... 65:
            tempHue = 0
        case 22 ... 43:
            tempHue = CGFloat(-0.167/22.0*Float(temperature-43))
        case 1 ... 21:
            tempHue = CGFloat(-0.333/21.0*Float(temperature-21)+0.167)
        case -17 ... 0:
            tempHue = CGFloat(-0.167/18.0*Float(temperature)+0.5)
        case -100 ... -18:
            tempHue = CGFloat(-0.166/42.0*Float(temperature+18)+0.667)
        default:
            tempHue = CGFloat(-0.166/42.0*Float(temperature+18)+0.667)
        }
        var dewHue: CGFloat = 0;
        switch dewpoint {
        case 44 ... 65:
            dewHue = 0
        case 22 ... 43:
            dewHue = CGFloat(-0.167/22.0*Float(dewpoint-43))
        case 1 ... 21:
            dewHue = CGFloat(-0.333/21.0*Float(dewpoint-21)+0.167)
        case -17 ... 0:
            dewHue = CGFloat(-0.167/18.0*Float(dewpoint)+0.5)
        case -100 ... -18:
            dewHue = CGFloat(-0.166/42.0*Float(dewpoint+18)+0.667)
        default:
            dewHue = CGFloat(-0.166/42.0*Float(dewpoint+18)+0.667)
        }
        
        var tempArc:CGMutablePathRef = CGPathCreateMutable()
        CGPathAddArc(tempArc, nil,
            viewWidth/2, viewWidth/2,
            viewWidth/2/16*CGFloat(Float(index-5) + 3.25),
            3.14159/4,
            -3.14159*5/4,
            true)
        var lineWidth:CGFloat = viewWidth/2/16*3.5
        var strokedTempArc: CGPathRef =
        CGPathCreateCopyByStrokingPath(tempArc, nil,
            lineWidth,
            kCGLineCapButt,
            kCGLineJoinMiter,
            10)
        var shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.fillColor = NSColor(hue: tempHue, saturation: 1, brightness: 1, alpha: 1).CGColor
        shapeLayer.path = strokedTempArc
        view.layer.addSublayer(shapeLayer)
        
        
        var dewArc:CGMutablePathRef = CGPathCreateMutable()
        CGPathAddArc(dewArc, nil,
            viewWidth/2, viewWidth/2,
            viewWidth/2/16*CGFloat(Float(index-5) + 3.25),
            3.14159/8,
            -3.14159*9/8,
            false)
        var dewLineWidth:CGFloat = viewWidth/2/16*3.5
        var dewStrokedArc: CGPathRef =
        CGPathCreateCopyByStrokingPath(dewArc, nil,
            dewLineWidth,
            kCGLineCapButt,
            kCGLineJoinMiter,
            10)
        var dewShapeLayer: CAShapeLayer = CAShapeLayer()
        dewShapeLayer.fillColor = NSColor(hue: dewHue, saturation: 1, brightness: 1, alpha: 1).CGColor
        dewShapeLayer.path = dewStrokedArc
        view.layer.addSublayer(dewShapeLayer)
        
        continue
    }
    if index == 1 {
        var tempArc:CGMutablePathRef = CGPathCreateMutable()
        CGPathAddArc(tempArc, nil,
            viewWidth/2, viewWidth/2,
            viewWidth/2/16*CGFloat(Float(index-5) + 8.25),
            0,
            3.1416*2,
            false)
        var lineWidth:CGFloat = viewWidth/2/16*1.5
        var strokedTempArc: CGPathRef =
        CGPathCreateCopyByStrokingPath(tempArc, nil,
            lineWidth,
            kCGLineCapButt,
            kCGLineJoinMiter,
            10)
        var shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.fillColor = NSColor(hue: 1, saturation: 1, brightness: 0, alpha: 0.25*CGFloat(clouds)).CGColor
        shapeLayer.path = strokedTempArc
        view.layer.addSublayer(shapeLayer)
        continue
    }
    if index == 2 || index == 3 || index == 4 {continue}
    
    let centerAngle:CGFloat = CGFloat(-angles[index-5]+90)*3.14159/180
    let angleDelta: CGFloat = lineLengthConst/(CGFloat(index-5)+3.5)*CGFloat(velocities[index-5])
    var hue: CGFloat = 0;
    switch temps[index-5] {
    case 44 ... 65:
        hue = 0
    case 22 ... 43:
        hue = CGFloat(-0.167/22.0*Float(temps[index-5]-43))
    case 1 ... 21:
        hue = CGFloat(-0.333/21.0*Float(temps[index-5]-21)+0.167)
    case -17 ... 0:
        hue = CGFloat(-0.167/18.0*Float(temps[index-5])+0.5)
    case -100 ... -18:
        hue = CGFloat(-0.166/42.0*Float(temps[index-5]+18)+0.667)
    default:
        hue = CGFloat(-0.166/42.0*Float(temps[index-5]+18)+0.667)
    }
    
    var tempArc:CGMutablePathRef = CGPathCreateMutable()
    CGPathAddArc(tempArc, nil,
        viewWidth/2, viewWidth/2,
        viewWidth/2/16*CGFloat(Float(index-5) + 5.5),
        centerAngle - angleDelta,
        centerAngle + angleDelta,
        false)
    var lineWidth:CGFloat = viewWidth/2/16
    var strokedTempArc: CGPathRef =
    CGPathCreateCopyByStrokingPath(tempArc, nil,
        lineWidth,
        kCGLineCapButt,
        kCGLineJoinMiter,
        10)
    var shapeLayer: CAShapeLayer = CAShapeLayer()
    shapeLayer.fillColor = NSColor(hue: hue, saturation: 1, brightness: 1, alpha: 1).CGColor
    shapeLayer.path = strokedTempArc
    view.layer.addSublayer(shapeLayer)
    
    var haloArc:CGMutablePathRef = CGPathCreateMutable()
    CGPathAddArc(haloArc, nil, viewWidth/2, viewHeight/2, viewWidth/2/16*CGFloat(Float(index-5) + 5.5),
        0, 3.14159*2, false)
    var strokedHaloArc: CGPathRef = CGPathCreateCopyByStrokingPath(haloArc, nil, lineWidth, kCGLineCapButt, kCGLineJoinMiter, 10)
    var haloShapeLayer: CAShapeLayer = CAShapeLayer()
    haloShapeLayer.fillColor = NSColor(hue: hue, saturation: 1, brightness: 1, alpha: 0.25).CGColor
    haloShapeLayer.path = strokedHaloArc
    view.layer.addSublayer(haloShapeLayer)
}
