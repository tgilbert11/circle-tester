//
//  WAOverlay.swift
//  circle tester
//
//  Created by Taylor H. Gilbert on 7/20/14.
//  Copyright (c) 2014 Taylor H. Gilbert. All rights reserved.
//

import Foundation
import MapKit

class WAOverlay: NSObject, MKOverlay {
    
    var data: (temperature: Int, dewpoint:Int, cloudCover:Int, windsAloft: [(direction: Int, velocity: Int, temperature: Int)]) = (-2,-2,-2,[])
    var title: NSString
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(title: NSString, data: (temperature: Int, dewpoint:Int, cloudCover:Int, windsAloft: [(direction: Int, velocity: Int, temperature: Int)]), latitude: Double, longitude: Double) {
        
        self.data = data
        self.title = title
        
        //println("temperature: \(self.data.temperature), dewpoint: \(self.data.dewpoint), clouds: \(self.data.cloudCover), title: \(self.title)")
        
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var center: MKMapPoint = MKMapPointForCoordinate(coordinate)
        var bottom:MKMapPoint = MKMapPointForCoordinate(CLLocationCoordinate2D(latitude: 36, longitude: -121))
        var top:MKMapPoint = MKMapPointForCoordinate(CLLocationCoordinate2D(latitude: 37.34, longitude: -121))
        
        var halfOffset: MKMapPoint = MKMapPoint(x: top.y-bottom.y, y: top.y-bottom.y)
        center.x = center.x - halfOffset.y/2
        center.y = center.y - halfOffset.y/2
        
        boundingMapRect = MKMapRect(origin: center, size: MKMapSize(width: top.y-bottom.y, height: top.y-bottom.y))
    }
    
}