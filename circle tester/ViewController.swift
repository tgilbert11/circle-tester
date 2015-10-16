//
//  ViewController.swift
//  circle tester
//
//  Created by Taylor H. Gilbert on 7/20/14.
//  Copyright (c) 2014 Taylor H. Gilbert. All rights reserved.
//

import UIKit
import MapKit
import QuartzCore

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var lowTable: NSString = ""
    var highTable: NSString = ""
    
    let lowAddresses = ["https://aviationweather.gov/products/nws/sanfrancisco?fint=06&lvl=lo",
        "https://aviationweather.gov/products/nws/saltlakecity?fint=06&lvl=lo",
        "https://aviationweather.gov/products/nws/chicago?fint=06&lvl=lo",
        "https://aviationweather.gov/products/nws/ftworth?fint=06&lvl=lo",
        "https://aviationweather.gov/products/nws/miami?fint=06&lvl=lo",
        "https://aviationweather.gov/products/nws/boston?fint=06&lvl=lo"]
        
    let highAddresses = ["https://aviationweather.gov/products/nws/sanfrancisco?fint=06&lvl=hi",
        "https://aviationweather.gov/products/nws/saltlakecity?fint=06&lvl=hi",
        "https://aviationweather.gov/products/nws/chicago?fint=06&lvl=hi",
        "https://aviationweather.gov/products/nws/ftworth?fint=06&lvl=hi",
        "https://aviationweather.gov/products/nws/miami?fint=06&lvl=hi",
        "https://aviationweather.gov/products/nws/boston?fint=06&lvl=hi"]
    
    let metarIDs: [NSString] = ["BIH","FAT","FOT","RBL","SAC","SAN","SBA","SFO","SIY","WJF","AST","LKV","OTH","PDX","RDM","GEG","SEA","YKM","PHX","PRC","TUS","ALS","DEN","GJT","PUB","BOI","LWS","PIH","BIL","DLN","GGW","GPI","GTF","MLS","ELY","LAS","RNO","ABQ","FMN","ROW","TCC","BCE","SLC","LND","RKS","BRL","DBQ","DSM","MCW","JOT","SPI","EVV","FWA","IND","GCK","GLD","ICT","SLN","LOU","MKG","TVC","AXN","DLH","INL","MSP","CGI","COU","MKC","SGF","STL","DIK","GFK","MOT","BFF","GRI","OMA","ONL","ABR","FSD","PIR","RAP","GRB","LSE","BHM","HSV","MGM","MOB","FSM","LIT","LCH","MSY","SHV","JAN","GAG","OKC","TUL","BNA","MEM","TRI","TYS","ABI","AMA","BRO","CLL","CRP","DAL","DRT","ELP","HOU","INK","LBB","LRD","MRF","PSX","SAT","SPS","EYW","JAX","MIA","MLB","PIE","TLH","ATL","CSG","SAV","ILM","RDU","CAE","CHS","FLO","GSP","BDL","BGR","CAR","PWM","ACK","BOS","BML","ACY","ALB","BUF","JFK","SYR","CLE","CMH","CVG","AGC","AVP","ORF","RIC","ROA","CRW","EKN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        testMetars()
            addWAOverlays()
            
        
    }
    
    func addWAOverlays() {

        // San Francisco
        map.addOverlay(WAOverlay(title:"Bishop", data: valuesForStation("BIH"), latitude: 37.3731111, longitude: -118.3636111))
        map.addOverlay(WAOverlay(title: "Blythe", data: valuesForStation("BLH"), latitude: 33.6191667, longitude: -114.7168889))
        map.addOverlay(WAOverlay(title: "Fresno", data: valuesForStation("FAT"), latitude: 36.7765556, longitude: -119.7188333))
        map.addOverlay(WAOverlay(title: "Fortuna", data: valuesForStation("FOT"), latitude: 40.5539444, longitude: -124.1326667))
        //map.addOverlay(WAOverlay(title: "Ontario", data: valuesForStation("ONT"), latitude: 34.0560000, longitude: -117.6011944))
        map.addOverlay(WAOverlay(title: "Red Bluff", data: valuesForStation("RBL"), latitude: 40.1503056, longitude: -122.2521944))
        map.addOverlay(WAOverlay(title: "Sacramento", data: valuesForStation("SAC"), latitude: 38.5125278, longitude: -121.4934722))
        map.addOverlay(WAOverlay(title: "San Diego", data: valuesForStation("SAN"), latitude: 32.7335556, longitude: -117.1896667))
        map.addOverlay(WAOverlay(title: "Santa Barbara", data: valuesForStation("SBA"), latitude: 34.4261944, longitude: -119.8415000))
        map.addOverlay(WAOverlay(title: "San Francisco", data: valuesForStation("SFO"), latitude: 37.6188172, longitude: -122.3754281))
        map.addOverlay(WAOverlay(title: "Siskiyou", data: valuesForStation("SIY"), latitude: 41.7814444, longitude: -122.4681111))
        map.addOverlay(WAOverlay(title: "Lancaster", data: valuesForStation("WJF"), latitude: 34.7410556, longitude: -118.2186389))
        map.addOverlay(WAOverlay(title: "Astoria", data: valuesForStation("AST"), latitude: 46.1579722, longitude: -123.8786944))
        map.addOverlay(WAOverlay(title: "Lake Valley", data: valuesForStation("LKV"), latitude: 42.1611111, longitude: -120.3990833))
        map.addOverlay(WAOverlay(title: "North Bend", data: valuesForStation("OTH"), latitude: 43.4169444, longitude: -124.2470278))
        map.addOverlay(WAOverlay(title: "Portland", data: valuesForStation("PDX"), latitude: 45.5887089, longitude: -122.5968694))
        map.addOverlay(WAOverlay(title: "Redmond", data: valuesForStation("RDM"), latitude: 44.2540556, longitude: -121.1499722))
        map.addOverlay(WAOverlay(title: "Spokane", data: valuesForStation("GEG"), latitude: 47.6190278, longitude: -117.5352222))
        map.addOverlay(WAOverlay(title: "Seattle", data: valuesForStation("SEA"), latitude: 47.4498889, longitude: -122.3117778))
        map.addOverlay(WAOverlay(title: "Yakima", data: valuesForStation("YKM"), latitude: 46.5681667, longitude: -120.5440556))
        map.addOverlay(WAOverlay(title: "Kimberly", data: valuesForStation("IMB"), latitude: 44.63333, longitude: -119.7))
        
        // Salt Lake City
        map.addOverlay(WAOverlay(title: "Phoenix", data: valuesForStation("PHX"), latitude: 33.4342778, longitude: -112.0115833))
        map.addOverlay(WAOverlay(title: "Prescott", data: valuesForStation("PRC"), latitude: 34.6548333, longitude: -112.4192222))
        map.addOverlay(WAOverlay(title: "Tuscon", data: valuesForStation("TUS"), latitude: 32.1160833, longitude: -110.9410278))
        map.addOverlay(WAOverlay(title: "Alamosa", data: valuesForStation("ALS"), latitude: 37.4349167, longitude: -105.8665556))
        map.addOverlay(WAOverlay(title: "Denver", data: valuesForStation("DEN"), latitude: 39.8616667, longitude: -104.6731667))
        map.addOverlay(WAOverlay(title: "Grand Junction", data: valuesForStation("GJT"), latitude: 39.1224125, longitude: -108.5267347))
        map.addOverlay(WAOverlay(title: "Pueblo", data: valuesForStation("PUB"), latitude: 38.2899478, longitude: -104.4980284))
        map.addOverlay(WAOverlay(title: "Boise", data: valuesForStation("BOI"), latitude: 43.5643611, longitude: -116.2228611))
        map.addOverlay(WAOverlay(title: "Lewiston", data: valuesForStation("LWS"), latitude: 46.3745000, longitude: -117.0153889))
        map.addOverlay(WAOverlay(title: "Pocatello", data: valuesForStation("PIH"), latitude: 42.9098056, longitude: -112.5959167))
        map.addOverlay(WAOverlay(title: "Billings", data: valuesForStation("BIL"), latitude: 45.8076667, longitude: -108.5428889))
        map.addOverlay(WAOverlay(title: "Dillon", data: valuesForStation("DLN"), latitude: 45.2553611, longitude: -112.5525000))
        map.addOverlay(WAOverlay(title: "Glasgow", data: valuesForStation("GGW"), latitude: 48.2124444, longitude: -106.6148056))
        map.addOverlay(WAOverlay(title: "Kalispel", data: valuesForStation("GPI"), latitude: 48.3104722, longitude: -114.2560000))
        map.addOverlay(WAOverlay(title: "Great Falls", data: valuesForStation("GTF"), latitude: 47.4826539, longitude: -111.3706100))
        map.addOverlay(WAOverlay(title: "Miles City", data: valuesForStation("MLS"), latitude: 46.4279722, longitude: -105.8862500))
        map.addOverlay(WAOverlay(title: "Battle Mountain", data: valuesForStation("BAM"), latitude: 40.5990556, longitude: -116.8743333))
        map.addOverlay(WAOverlay(title: "Ely", data: valuesForStation("ELY"), latitude: 39.2996944, longitude: -114.8418889))
        map.addOverlay(WAOverlay(title: "Las Vegas", data: valuesForStation("LAS"), latitude: 36.0800556, longitude: -115.1522500))
        map.addOverlay(WAOverlay(title: "Reno", data: valuesForStation("RNO"), latitude: 39.4991111, longitude: -119.7681111))
        map.addOverlay(WAOverlay(title: "Albuquerque", data: valuesForStation("ABQ"), latitude: 35.0389316, longitude: -106.6082622))
        map.addOverlay(WAOverlay(title: "Farmington", data: valuesForStation("FMN"), latitude: 36.7412500, longitude: -108.2299444))
        map.addOverlay(WAOverlay(title: "Roswell", data: valuesForStation("ROW"), latitude: 33.3015556, longitude: -104.5305556))
        map.addOverlay(WAOverlay(title: "Tucumcari", data: valuesForStation("TCC"), latitude: 35.1827781, longitude: -103.6031944))
        map.addOverlay(WAOverlay(title: "Zuni Pueblo", data: valuesForStation("ZUN"), latitude: 35.0832269, longitude: -108.7917769))
        map.addOverlay(WAOverlay(title: "Bryce Canyon", data: valuesForStation("BCE"), latitude: 37.7064444, longitude: -112.1458056))
        map.addOverlay(WAOverlay(title: "Salt Lake City", data: valuesForStation("SLC"), latitude: 40.7883878, longitude: -111.9777731))
        map.addOverlay(WAOverlay(title: "Crazy Woman", data: valuesForStation("CZI"), latitude: 43.983333, longitude: -106.433333))
        map.addOverlay(WAOverlay(title: "Lander", data: valuesForStation("LND"), latitude: 42.8155833, longitude: -108.7282500))
        map.addOverlay(WAOverlay(title: "Medicine Bow", data: valuesForStation("MBW"), latitude: 41.8839722, longitude: -106.1827778))
        map.addOverlay(WAOverlay(title: "Rock Springs", data: valuesForStation("RKS"), latitude: 41.5942222, longitude: -109.0651944))

        // Chicago
        map.addOverlay(WAOverlay(title: "Burlington", data: valuesForStation("BRL"), latitude: 40.7832222, longitude: -91.1255000))
        map.addOverlay(WAOverlay(title: "Dubuque", data: valuesForStation("DBQ"), latitude: 42.4020000, longitude: -90.7094722))
        map.addOverlay(WAOverlay(title: "Des Moines", data: valuesForStation("DSM"), latitude: 41.5339722, longitude: -93.6630833))
        map.addOverlay(WAOverlay(title: "Mason City", data: valuesForStation("MCW"), latitude: 43.1578056, longitude: -93.3312500))
        map.addOverlay(WAOverlay(title: "Joliet", data: valuesForStation("JOT"), latitude: 41.5176944, longitude: -88.1756111))
        map.addOverlay(WAOverlay(title: "Springfield", data: valuesForStation("SPI"), latitude: 39.8442222, longitude: -89.6780833))
        map.addOverlay(WAOverlay(title: "Evansville", data: valuesForStation("EVV"), latitude: 38.0408056, longitude: -87.5285000))
        map.addOverlay(WAOverlay(title: "Fort Wayne", data: valuesForStation("FWA"), latitude: 40.9784722, longitude: -85.1951667))
        map.addOverlay(WAOverlay(title: "Indianapolis", data: valuesForStation("IND"), latitude: 39.7172991, longitude: -86.2946612))
        map.addOverlay(WAOverlay(title: "Garden City", data: valuesForStation("GCK"), latitude: 37.9275278, longitude: -100.7244167))
        map.addOverlay(WAOverlay(title: "Goodland", data: valuesForStation("GLD"), latitude: 39.3706389, longitude: -101.6990000))
        map.addOverlay(WAOverlay(title: "Wichita", data: valuesForStation("ICT"), latitude: 37.6499444, longitude: -97.4330556))
        map.addOverlay(WAOverlay(title: "Salina", data: valuesForStation("SLN"), latitude: 38.7906111, longitude: -97.6522222))
        map.addOverlay(WAOverlay(title: "Louisville", data: valuesForStation("LOU"), latitude: 38.2279840, longitude: -85.6637491))
        map.addOverlay(WAOverlay(title: "Peck", data: valuesForStation("ECK"), latitude: 43.25, longitude: -82.7166666))
        map.addOverlay(WAOverlay(title: "Muskegon", data: valuesForStation("MKG"), latitude: 43.1676717, longitude: -86.2354387))
        map.addOverlay(WAOverlay(title: "Marquette", data: valuesForStation("MQT"), latitude: 46.3536389, longitude: -87.3953611))
        map.addOverlay(WAOverlay(title: "Sault Ste. Marie", data: valuesForStation("SSM"), latitude: 46.4792222, longitude: -84.3683889))
        map.addOverlay(WAOverlay(title: "Traverse City", data: valuesForStation("TVC"), latitude: 44.7415833, longitude: -85.5817778))
        map.addOverlay(WAOverlay(title: "Alexandria", data: valuesForStation("AXN"), latitude: 45.8663056, longitude: -95.3946667))
        map.addOverlay(WAOverlay(title: "Duluth", data: valuesForStation("DLH"), latitude: 46.8420833, longitude: -92.1936389))
        map.addOverlay(WAOverlay(title: "International Falls", data: valuesForStation("INL"), latitude: 48.5655833, longitude: -93.4021667))
        map.addOverlay(WAOverlay(title: "Minneapolis", data: valuesForStation("MSP"), latitude: 44.8819722, longitude: -93.2217778))
        map.addOverlay(WAOverlay(title: "Cape Girardeau", data: valuesForStation("CGI"), latitude: 37.2253056, longitude: -89.5707500))
        map.addOverlay(WAOverlay(title: "Columbia", data: valuesForStation("COU"), latitude: 38.8180931, longitude: -92.2196292))
        map.addOverlay(WAOverlay(title: "Kansas City", data: valuesForStation("MKC"), latitude: 39.1229444, longitude: -94.5928333))
        map.addOverlay(WAOverlay(title: "Springfield", data: valuesForStation("SGF"), latitude: 37.2456667, longitude: -93.3886389))
        map.addOverlay(WAOverlay(title: "St. Louis", data: valuesForStation("STL"), latitude: 38.7486972, longitude: -90.3700289))
        map.addOverlay(WAOverlay(title: "Dickinson", data: valuesForStation("DIK"), latitude: 46.7973333, longitude: -102.8018611))
        map.addOverlay(WAOverlay(title: "Grand Forks", data: valuesForStation("GFK"), latitude: 47.9472778, longitude: -97.1737778))
        map.addOverlay(WAOverlay(title: "Minot", data: valuesForStation("MOT"), latitude: 48.2576389, longitude: -101.2780278))
        map.addOverlay(WAOverlay(title: "Scottsbluff", data: valuesForStation("BFF"), latitude: 41.8740278, longitude: -103.5956389))
        map.addOverlay(WAOverlay(title: "Grand Island", data: valuesForStation("GRI"), latitude: 40.9675425, longitude: -98.3096389))
        map.addOverlay(WAOverlay(title: "Omaha", data: valuesForStation("OMA"), latitude: 41.3031667, longitude: -95.8940556))
        map.addOverlay(WAOverlay(title: "O'Neill", data: valuesForStation("ONL"), latitude: 42.4693611, longitude: -98.6877778))
        map.addOverlay(WAOverlay(title: "Aberdeen", data: valuesForStation("ABR"), latitude: 45.4483056, longitude: -98.4224444))
        map.addOverlay(WAOverlay(title: "Sioux Falls", data: valuesForStation("FSD"), latitude: 43.5820133, longitude: -96.7419136))
        map.addOverlay(WAOverlay(title: "Pierre", data: valuesForStation("PIR"), latitude: 44.3826944, longitude: -100.2859722))
        map.addOverlay(WAOverlay(title: "Rapid City", data: valuesForStation("RAP"), latitude: 44.0453333, longitude: -103.0573611))
        map.addOverlay(WAOverlay(title: "Green Bay", data: valuesForStation("GRB"), latitude: 44.4846389, longitude: -88.1297222))
        map.addOverlay(WAOverlay(title: "La Crosse", data: valuesForStation("LSE"), latitude: 43.8792778, longitude: -91.2566389))
        
        // Dallas
        map.addOverlay(WAOverlay(title: "Birmingham", data: valuesForStation("BHM"), latitude: 33.5638889, longitude: -86.7523056))
        map.addOverlay(WAOverlay(title: "Huntsville", data: valuesForStation("HSV"), latitude: 34.6371944, longitude: -86.7750556))
        map.addOverlay(WAOverlay(title: "Montgomery", data: valuesForStation("MGM"), latitude: 32.3006389, longitude: -86.3939722))
        map.addOverlay(WAOverlay(title: "Mobile", data: valuesForStation("MOB"), latitude: 30.6914167, longitude: -88.2428333))
        map.addOverlay(WAOverlay(title: "Fort Smith", data: valuesForStation("FSM"), latitude: 35.3365833, longitude: -94.3674444))
        map.addOverlay(WAOverlay(title: "Little Rock", data: valuesForStation("LIT"), latitude: 34.7294444, longitude: -92.2247778))
        map.addOverlay(WAOverlay(title: "Lake Charles", data: valuesForStation("LCH"), latitude: 30.1260833, longitude: -93.2234167))
        map.addOverlay(WAOverlay(title: "New Orleans", data: valuesForStation("MSY"), latitude: 29.9932778, longitude: -90.2590278))
        map.addOverlay(WAOverlay(title: "Shreveport", data: valuesForStation("SHV"), latitude: 32.4466111, longitude: -93.8256111))
        map.addOverlay(WAOverlay(title: "Jackson", data: valuesForStation("JAN"), latitude: 32.3111667, longitude: -90.0758889))
        map.addOverlay(WAOverlay(title: "Gage", data: valuesForStation("GAG"), latitude: 36.2955389, longitude: -99.7764236))
        map.addOverlay(WAOverlay(title: "Oklahoma City", data: valuesForStation("OKC"), latitude: 35.3930740, longitude: -97.6007617))
        map.addOverlay(WAOverlay(title: "Tulsa", data: valuesForStation("TUL"), latitude: 36.1983889, longitude: -95.8881111))
        map.addOverlay(WAOverlay(title: "Nashville", data: valuesForStation("BNA"), latitude: 36.1244722, longitude: -86.6781944))
        map.addOverlay(WAOverlay(title: "Memphis", data: valuesForStation("MEM"), latitude: 35.0424167, longitude: -89.9766667))
        map.addOverlay(WAOverlay(title: "Bristol/Johnson/Kingsport", data: valuesForStation("TRI"), latitude: 36.4751944, longitude: -82.4074167))
        map.addOverlay(WAOverlay(title: "Knoxville", data: valuesForStation("TYS"), latitude: 35.8109722, longitude: -83.9940278))
        map.addOverlay(WAOverlay(title: "Abilene", data: valuesForStation("ABI"), latitude: 32.4113333, longitude: -99.6818889))
        map.addOverlay(WAOverlay(title: "Amarillo", data: valuesForStation("AMA"), latitude: 35.2193611, longitude: -101.7059167))
        map.addOverlay(WAOverlay(title: "Brownsville", data: valuesForStation("BRO"), latitude: 25.9068333, longitude: -97.4258333))
        map.addOverlay(WAOverlay(title: "College Station", data: valuesForStation("CLL"), latitude: 30.5885833, longitude: -96.3638333))
        map.addOverlay(WAOverlay(title: "Corpus Christi", data: valuesForStation("CRP"), latitude: 27.7710906, longitude: -97.5012311))
        map.addOverlay(WAOverlay(title: "Dallas", data: valuesForStation("DAL"), latitude: 32.8471111, longitude: -96.8517778))
        map.addOverlay(WAOverlay(title: "Del Rio", data: valuesForStation("DRT"), latitude: 29.3742069, longitude: -100.9271569))
        map.addOverlay(WAOverlay(title: "El Paso", data: valuesForStation("ELP"), latitude: 31.8071944, longitude: -106.3763611))
        map.addOverlay(WAOverlay(title: "Houston", data: valuesForStation("HOU"), latitude: 29.6454186, longitude: -95.2788889))
        map.addOverlay(WAOverlay(title: "Wink", data: valuesForStation("INK"), latitude: 31.7798056, longitude: -103.2016944))
        map.addOverlay(WAOverlay(title: "Lubbock", data: valuesForStation("LBB"), latitude: 33.6636667, longitude: -101.8205556))
        map.addOverlay(WAOverlay(title: "Laredo", data: valuesForStation("LRD"), latitude: 27.5441944, longitude: -99.4615833))
        map.addOverlay(WAOverlay(title: "Marfa", data: valuesForStation("MRF"), latitude: 30.3711111, longitude: -104.0175278))
        map.addOverlay(WAOverlay(title: "Palacios", data: valuesForStation("PSX"), latitude: 28.7275000, longitude: -96.2509444))
        map.addOverlay(WAOverlay(title: "San Antonio", data: valuesForStation("SAT"), latitude: 29.5339580, longitude: -98.4690571))
        map.addOverlay(WAOverlay(title: "Wichita Falls", data: valuesForStation("SPS"), latitude: 33.9888028, longitude: -98.4919028))
        map.addOverlay(WAOverlay(title: "West Cameron", data: valuesForStation("T01"), latitude: 28.5, longitude: -93.5))
        map.addOverlay(WAOverlay(title: "Ship Shoal", data: valuesForStation("T06"), latitude: 28.5, longitude: -91))
        map.addOverlay(WAOverlay(title: "S Mobile South", data: valuesForStation("T07"), latitude: 28.5, longitude: -88))
        map.addOverlay(WAOverlay(title: "S Apalachicola South", data: valuesForStation("4J3"), latitude: 28.5, longitude: -85))
        map.addOverlay(WAOverlay(title: "Bay City", data: valuesForStation("H51"), latitude: 26.5, longitude: -95))
        map.addOverlay(WAOverlay(title: "Mid Gulf", data: valuesForStation("H52"), latitude: 26, longitude: -89.5))
        map.addOverlay(WAOverlay(title: "W Fort Myers West", data: valuesForStation("H61"), latitude: 26.5, longitude: -84))
        
        // Miami
        map.addOverlay(WAOverlay(title: "Key West", data: valuesForStation("EYW"), latitude: 24.5561111, longitude: -81.7595556))
        map.addOverlay(WAOverlay(title: "Jacksonville", data: valuesForStation("JAX"), latitude: 30.4940556, longitude: -81.6878333))
        map.addOverlay(WAOverlay(title: "Miami", data: valuesForStation("MIA"), latitude: 25.7953611, longitude: -80.2901111))
        map.addOverlay(WAOverlay(title: "Melbourne", data: valuesForStation("MLB"), latitude: 28.1027528, longitude: -80.6452569))
        map.addOverlay(WAOverlay(title: "Panama City", data: valuesForStation("PFN"), latitude: 30.3582500, longitude: -85.7956111))
        map.addOverlay(WAOverlay(title: "St Petersburg-Clearwater", data: valuesForStation("PIE"), latitude: 27.9099993, longitude: -82.6875447))
        map.addOverlay(WAOverlay(title: "Tallahassee", data: valuesForStation("TLH"), latitude: 30.3967500, longitude: -84.3508611))
        map.addOverlay(WAOverlay(title: "Atlanta", data: valuesForStation("ATL"), latitude: 33.6366995, longitude: -84.4278639))
        map.addOverlay(WAOverlay(title: "Columbus", data: valuesForStation("CSG"), latitude: 32.5163333, longitude: -84.9388611))
        map.addOverlay(WAOverlay(title: "Savannah", data: valuesForStation("SAV"), latitude: 32.1275833, longitude: -81.2021389))
        map.addOverlay(WAOverlay(title: "Hatteras", data: valuesForStation("HAT"), latitude: 35.2327875, longitude: -75.6177950))
        map.addOverlay(WAOverlay(title: "Wilmington", data: valuesForStation("ILM"), latitude: 34.2711529, longitude: -77.9028923))
        map.addOverlay(WAOverlay(title: "Raleigh/Durham", data: valuesForStation("RDU"), latitude: 35.8776389, longitude: -78.7874722))
        map.addOverlay(WAOverlay(title: "Columbia", data: valuesForStation("CAE"), latitude: 33.9388333, longitude: -81.1195278))
        map.addOverlay(WAOverlay(title: "Charleston", data: valuesForStation("CHS"), latitude: 32.8986389, longitude: -80.0405278))
        map.addOverlay(WAOverlay(title: "Florence", data: valuesForStation("FLO"), latitude: 34.1853611, longitude: -79.7238889))
        map.addOverlay(WAOverlay(title: "Greer", data: valuesForStation("GSP"), latitude: 34.8956667, longitude: -82.2188611))
        map.addOverlay(WAOverlay(title: "Gauge", data: valuesForStation("2XG"), latitude: 30.33333, longitude: -78.5))
        
        // Boston
        map.addOverlay(WAOverlay(title: "Windsor Locks", data: valuesForStation("BDL"), latitude: 41.9391451, longitude: -72.6833713))
        map.addOverlay(WAOverlay(title: "Bangor", data: valuesForStation("BGR"), latitude: 44.8074444, longitude: -68.8281389))
        map.addOverlay(WAOverlay(title: "Caribou", data: valuesForStation("CAR"), latitude: 46.8716389, longitude: -68.0181944))
        map.addOverlay(WAOverlay(title: "Portland", data: valuesForStation("PWM"), latitude: 43.6456435, longitude: -70.3086164))
        map.addOverlay(WAOverlay(title: "Westminster", data: valuesForStation("EMI"), latitude: 39.6082778, longitude: -77.0076667))
        map.addOverlay(WAOverlay(title: "Nantucket  ", data: valuesForStation("ACK"), latitude: 41.2529751, longitude: -70.0599114))
        map.addOverlay(WAOverlay(title: "Boston", data: valuesForStation("BOS"), latitude: 42.3629418, longitude: -71.0063931))
        map.addOverlay(WAOverlay(title: "Berlin", data: valuesForStation("BML"), latitude: 44.5753611, longitude: -71.1759167))
        map.addOverlay(WAOverlay(title: "Atlantic City", data: valuesForStation("ACY"), latitude: 39.4575833, longitude: -74.5771667))
        map.addOverlay(WAOverlay(title: "Albany", data: valuesForStation("ALB"), latitude: 42.7491111, longitude: -73.8019722))
        map.addOverlay(WAOverlay(title: "Buffalo", data: valuesForStation("BUF"), latitude: 42.9404167, longitude: -78.7305833))
        map.addOverlay(WAOverlay(title: "New York", data: valuesForStation("JFK"), latitude: 40.6397511, longitude: -73.7789256))
        map.addOverlay(WAOverlay(title: "Plattsburgh", data: valuesForStation("PLB"), latitude: 44.6509444, longitude: -73.4681389))
        map.addOverlay(WAOverlay(title: "Syracuse", data: valuesForStation("SYR"), latitude: 43.1111944, longitude: -76.1063056))
        map.addOverlay(WAOverlay(title: "Cleveland", data: valuesForStation("CLE"), latitude: 41.4094167, longitude: -81.8546944))
        map.addOverlay(WAOverlay(title: "Columbus", data: valuesForStation("CMH"), latitude: 39.9969444, longitude: -82.8921667))
        map.addOverlay(WAOverlay(title: "Covington", data: valuesForStation("CVG"), latitude: 39.0488367, longitude: -84.6678222))
        map.addOverlay(WAOverlay(title: "Pittsburgh", data: valuesForStation("AGC"), latitude: 40.3544376, longitude: -79.9290467))
        map.addOverlay(WAOverlay(title: "Wilkes-Barre/Scranton", data: valuesForStation("AVP"), latitude: 41.3384722, longitude: -75.7233889))
        map.addOverlay(WAOverlay(title: "Philipsburg", data: valuesForStation("PSB"), latitude: 40.8843914, longitude: -78.0873417))
        map.addOverlay(WAOverlay(title: "Norfolk", data: valuesForStation("ORF"), latitude: 36.8946111, longitude: -76.2012222))
        map.addOverlay(WAOverlay(title: "Richmond", data: valuesForStation("RIC"), latitude: 37.5051667, longitude: -77.3196667))
        map.addOverlay(WAOverlay(title: "Roanoke", data: valuesForStation("ROA"), latitude: 37.3254722, longitude: -79.9754167))
        map.addOverlay(WAOverlay(title: "Charleston", data: valuesForStation("CRW"), latitude: 38.3759291, longitude: -81.5930039))
        map.addOverlay(WAOverlay(title: "Elkins", data: valuesForStation("EKN"), latitude: 38.8894444, longitude: -79.8571389))
        
    }
    
    func testMetars() {
        
        let firstPart: NSString = "http://www.aviationweather.gov/adds/metars?station_ids=K"
        let secondPart: NSString = "&std_trans=standard&chk_metars=on&hoursStr=most+recent+only&submitmet=Submit"
        
        for id in metarIDs {
            let URL = NSURL(string: NSString(format: "%@%@%@", firstPart, id, secondPart))
            let metarSource: NSString = NSString(contentsOfURL: URL, usedEncoding: nil, error: nil)
            //println(metarSource)
            let lineSplit: [NSString] = metarSource.componentsSeparatedByString("\n") as [NSString]
            //println("\(lineSplit.count)")
            if lineSplit[17].length > 30 {
                let remarkRange: NSRange = lineSplit[17].rangeOfString("RMK")
                let METAR: NSString = lineSplit[17].substringWithRange(NSRange(location: 31, length: remarkRange.location-32))
                //println("\(METAR)")
                let METARSplit: [NSString] = METAR.componentsSeparatedByString(" ") as [NSString]
                //println("\(METARSplit.count)")
                let tempDew = METARSplit[METARSplit.count-2]
                //println(tempDew)
                let dewpoint: Int = (tempDew.componentsSeparatedByString("/")[1] as String).toInt()!
                //println("id: \(id), dewpoint: \(dewpoint)")
                let temperature: Int = (tempDew.componentsSeparatedByString("/")[0] as String).toInt()!
                
                var worstClouds: Int = -1
                     if METAR.rangeOfString("OVC").location != NSNotFound {worstClouds = 4}
                else if METAR.rangeOfString("VV").location != NSNotFound  {worstClouds = 4}
                else if METAR.rangeOfString("BKN").location != NSNotFound {worstClouds = 3}
                else if METAR.rangeOfString("SCT").location != NSNotFound {worstClouds = 2}
                else if METAR.rangeOfString("FEW").location != NSNotFound {worstClouds = 1}
                else if METAR.rangeOfString("SKC").location != NSNotFound {worstClouds = 0}
                else if METAR.rangeOfString("CLR").location != NSNotFound {worstClouds = 0}
                else if METAR.rangeOfString("NSC").location != NSNotFound {worstClouds = 0}
                
                
                
                println("id: \(id), temperature: \(temperature), dewpoint: \(dewpoint), cloudDegree: \(worstClouds)/4")
                
            }
            else {println(id)}
        }
        
    }
    
    func valuesForStation(id: NSString) -> (temperature: Int, dewpoint:Int, cloudCover:Int, windsAloft: [(direction: Int, velocity: Int, temperature: Int)]) {
//        print("\"\(id)\",")
        if lowTable.length == 0 {
            for index in 0...5 {
                let lowURL: NSURL = NSURL(string: lowAddresses[index])
                let lowPageSource: NSString = NSString(contentsOfURL: lowURL, usedEncoding: nil, error: nil)
                let lowFirstSplit: [NSString] = lowPageSource.componentsSeparatedByString("FT  3000    6000    9000   12000   18000   24000  30000  34000  39000") as [NSString]
                
                let lowSecondSplit: [NSString] = lowFirstSplit[1].componentsSeparatedByString("<") as [NSString]
                self.lowTable = NSString(format: "%@%@\n", self.lowTable, lowSecondSplit[0])
                
                let highURL: NSURL = NSURL(string: highAddresses[index])
                let highPageSource: NSString = NSString(contentsOfURL: highURL, usedEncoding: nil, error: nil)
                let highFirstSplit: [NSString] = highPageSource.componentsSeparatedByString("FT   45000  53000") as [NSString]
                let highSecondSplit: [NSString] = highFirstSplit[1].componentsSeparatedByString("<") as [NSString]
                self.highTable = NSString(format: "%@%@\n", self.highTable, highSecondSplit[0])

            }
        }
        //else {}
        
        //println(lowTable)
        //println(highTable)
        
        var temperature: Int = -1
        var dewpoint: Int = -1
        var worstClouds: Int = -1
        
        for testID in metarIDs {
            
            
            if id == testID {
                //println("yes: has \(id)")
                
                let firstPart: NSString = "http://www.aviationweather.gov/adds/metars?station_ids=K"
                let secondPart: NSString = "&std_trans=standard&chk_metars=on&hoursStr=most+recent+only&submitmet=Submit"
                
                let URL = NSURL(string: NSString(format: "%@%@%@", firstPart, id, secondPart))
                let metarSource: NSString = NSString(contentsOfURL: URL, usedEncoding: nil, error: nil)
                //println(metarSource)
                let lineSplit: [NSString] = metarSource.componentsSeparatedByString("\n") as [NSString]
                //println("\(lineSplit.count)")
                if lineSplit[17].length > 30 {
                    let remarkRange: NSRange = lineSplit[17].rangeOfString("RMK")
                    let METAR: NSString = lineSplit[17].substringWithRange(NSRange(location: 31, length: remarkRange.location-32))
                    //println("\(METAR)")
                    let METARSplit: [NSString] = METAR.componentsSeparatedByString(" ") as [NSString]
                    //println("\(METARSplit.count)")
                    if METARSplit.count < 6 {
                        //println("skipped: \(id)")
                        break
                    }
                    let tempDew = METARSplit[METARSplit.count-2]
                    //println(tempDew)
                    var tempString: NSString = tempDew.componentsSeparatedByString("/")[0] as NSString
                    var tempMultiplier: Int = 1
                    if tempString.componentsSeparatedByString("M").count > 1 {
                        tempString = tempString.substringFromIndex(1)
                        tempMultiplier = -1
                    }
                    temperature = tempMultiplier*(tempString as String).toInt()!
                    
                    var dewString: NSString = tempDew.componentsSeparatedByString("/")[1] as NSString
                    var dewMultiplier: Int = 1
                    if dewString.componentsSeparatedByString("M").count > 1 {
                        dewString = dewString.substringFromIndex(1)
                        dewMultiplier = -1
                    }
                    dewpoint = dewMultiplier*(dewString as String).toInt()!

                    
                    if METAR.rangeOfString("OVC").location != NSNotFound {worstClouds = 4}
                    else if METAR.rangeOfString("VV").location != NSNotFound  {worstClouds = 4}
                    else if METAR.rangeOfString("BKN").location != NSNotFound {worstClouds = 3}
                    else if METAR.rangeOfString("SCT").location != NSNotFound {worstClouds = 2}
                    else if METAR.rangeOfString("FEW").location != NSNotFound {worstClouds = 1}
                    else if METAR.rangeOfString("SKC").location != NSNotFound {worstClouds = 0}
                    else if METAR.rangeOfString("CLR").location != NSNotFound {worstClouds = 0}
                    else if METAR.rangeOfString("NSC").location != NSNotFound {worstClouds = 0}
                    
                    //println("id: \(id), temperature: \(temperature), dewpoint: \(dewpoint), cloudDegree: \(worstClouds)/4")
                
                    break
                }
            }
        }
        
        let lowStationIndexRange: NSRange = lowTable.rangeOfString(id)
        let highStationIndexRange: NSRange = highTable.rangeOfString(id)
        
        var lowLine: NSString = ""
        var didFindLowLine = false
        var highLine: NSString = ""
        var didFindHighLine = false
        
        if lowStationIndexRange.location != NSNotFound {
            lowLine = lowTable.substringWithRange(NSRange(location: lowStationIndexRange.location, length: 69))
            didFindLowLine = true
        }
        else {}
        
        if highStationIndexRange.location != NSNotFound {
            highLine = highTable.substringWithRange(NSRange(location: highStationIndexRange.location+3, length: 14))
            didFindHighLine = true
        }
        else {}
        
        let fullLine: NSString = NSString(format: "%@%@", lowLine, highLine)
        
        let dirs        = [4,  9, 17, 25, 33, 41, 49, 56, 63, 70, 77]
        let vels        = [6, 11, 19, 27, 35, 43, 51, 58, 65, 72, 79]
        let temps       = [0, 13, 21, 29, 37, 45, 53, 60, 67, 74, 81]
        let tempsLength = [0,  3,  3,  3,  3,  3,  2,  2,  2,  2,  2]
        
        var finalList: (temperature: Int, dewpoint:Int, cloudCover:Int, windsAloft: [(direction: Int, velocity: Int, temperature: Int)]) = (temperature,dewpoint,worstClouds,[])

        var numberOfCols = (didFindLowLine ? 9 : 0) + (didFindHighLine ? 2 : 0)
        for i in 0...numberOfCols-1 {
            var dir: Int? = fullLine.substringWithRange(NSRange(location: dirs[i], length: 2)).toInt()
            var vel: Int? = fullLine.substringWithRange(NSRange(location: vels[i], length: 2)).toInt()
            var temp: Int? = fullLine.substringWithRange(NSRange(location: temps[i], length: tempsLength[i])).toInt()
            
            if dir == nil {dir = -1}
            if vel == nil {vel = -1}
            if temp == nil {temp = 0}
            
            dir = dir!*10
            if dir > 360 && dir < 990 {dir = dir! - 500; vel = vel! + 100}
            if i>5 {temp = -temp!}
            
            finalList.windsAloft.append(direction: dir!, velocity: vel!, temperature: temp!)
        }
        //println("id: \(id), temperature: \(finalList.temperature), dewpoint: \(finalList.dewpoint), clouds: \(finalList.cloudCover)")
        
        return finalList
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        var overlayRenderer = WAOverlayRenderer(overlay: overlay)
        return overlayRenderer
        
//        var circleRenderer: MKCircleRenderer = MKCircleRenderer(circle: MKCircle(centerCoordinate: CLLocationCoordinate2D(latitude: 36, longitude: -121), radius: 100000))
//        circleRenderer.lineWidth = 1;
//        circleRenderer.strokeColor = UIColor.blackColor()
//        return circleRenderer;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func codeStorage(){
        /*
        var view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        view.transform = CGAffineTransformMakeScale(1, -1)
        
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
            view.layer.addSublayer(shapeLayer)
            
            var haloArc:CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(haloArc, nil, viewWidth/2, viewHeight/2, viewWidth/2/12*CGFloat(Float(index) + 1.5),
                0, 3.14159*2, false)
            var strokedHaloArc: CGPathRef = CGPathCreateCopyByStrokingPath(haloArc, nil, lineWidth, kCGLineCapButt, kCGLineJoinMiter, 10)
            var haloShapeLayer: CAShapeLayer = CAShapeLayer()
            haloShapeLayer.fillColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 0.35).CGColor
            haloShapeLayer.path = strokedHaloArc
            view.layer.addSublayer(haloShapeLayer)
        }
        
        var overlayView: MKOverlayView = MKOverlayView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        overlayView.addSubview(view)
        println("\(overlayView.subviews.count)")
        
        let waov: WindsAloftOverlayView = WindsAloftOverlayView()
        
        map.addOverlay(waov.overlay)
*/

    }

}

