//
//  secondViewController.swift
//  sampleMiniGuideBook
//
//  Created by Eriko Ichinohe on 2016/02/11.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import MapKit

class secondViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myMap: MKMapView!
    
    var scSelectedName:String = ""

    override func viewDidLoad() {
       
                super.viewDidLoad()

        //ファイルのパスを取得
        var filePath = NSBundle.mainBundle().pathForResource("guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        var dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            if(key as! NSString == scSelectedName){
                navigationItem.title = scSelectedName
                myTextView.text = data["description"] as! String
                myImageView.image = UIImage(named:data["image"] as! String)
                
                var latitude:String = data["latitude"] as! String
                var longitude:String = data["longitude"] as! String
                
                let coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegionMake(coordinate, span)
                myMap.setRegion(region, animated:true)
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
