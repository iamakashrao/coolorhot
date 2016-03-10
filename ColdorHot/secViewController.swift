//
//  secViewController.swift
//  ColdorHot
//
//  Created by chitranjan on 10/03/16.
//  Copyright © 2016 akash. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class secViewController: UIViewController,CLLocationManagerDelegate {
    
    var CurrentTemp:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
    let baseurl = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=09b5cfa631beb3b775f5cc650443ca5b"
        
        let session = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: baseurl)!) { (data:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
            if let data = data {
                do{
                    let jsondata = try NSJSONSerialization.JSONObjectWithData(data
                    , options: NSJSONReadingOptions.AllowFragments)as! Dictionary<String, AnyObject>
                
                    
                    
                     let temp = jsondata["main"]as! Dictionary<String, AnyObject>
                    
                    
                    print(temp["temp"])
                    let inkel = temp["temp"] as! Int
                    let incel = inkel - 271
                    print("\(incel)C")
                    self.CurrentTemp = incel
                    
                    if incel > 40 {
                        status.hot
                    }else
                    {
                        status.cool
                    }
                    
                    
                }catch{
                    print("asdas")
                }
            }
            
        }
           session.resume()
        }
        
        
        
        
    }


