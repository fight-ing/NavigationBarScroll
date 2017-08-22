//
//  ViewController.swift
//  NavigationBarScroll
//
//  Created by fei on 2017/8/22.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var navigationBarView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
        self.navigationItem.title = "透明"
        
        navigationBarView.alpha = 0;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    
    // MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        let offset = scrollView.contentOffset.y;
        if (offset <= 0 && offset <= -90) {
            navigationBarView.backgroundColor = UIColor.red
            navigationBarView.alpha = 0;
        }else if(offset<=300){
            navigationBarView.backgroundColor = UIColor.red
            //alpha最大值为1
            navigationBarView.alpha = offset/255;
            
        } else {
            navigationBarView.backgroundColor = UIColor.green
        }
        return;
        
    }
    
    func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!;
    }
    
  
    
    
    // MARK: UITableviewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! TestCell
        cell.itemImageView.image = UIImage.init(named: "bear\(indexPath.row%9+1)")
        cell.contentLbl.text = "这个内容有点多：\n\(indexPath.row*999999999) \n凑行数\n你猜猜还有多少\n应该没有了\n好吧"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

