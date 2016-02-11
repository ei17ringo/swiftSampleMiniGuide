//
//  ViewController.swift
//  sampleMiniGuideBook
//
//  Created by Eriko Ichinohe on 2016/02/11.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var selectedName:String = ""
    
    var guideList:[NSString] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //ファイルのパスを取得
        var filePath = NSBundle.mainBundle().pathForResource("guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        var dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            guideList.append(key as! NSString)
            
        }

    }
    
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }
    
    // 表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.purpleColor()
        //矢印を右側につける
        cell.accessoryType = .DisclosureIndicator
        
        cell.textLabel!.text = guideList[indexPath.row] as String
        return cell
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        selectedName = guideList[indexPath.row] as String
        performSegueWithIdentifier("showSecondView",sender: nil)
    }
    
    // Segueで画面遷移する時
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC = segue.destinationViewController as! secondViewController
        
        secondVC.scSelectedName = selectedName
    }


}

