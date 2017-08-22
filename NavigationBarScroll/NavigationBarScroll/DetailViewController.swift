
//
//  DetailViewController.swift
//  NavigationBarScroll
//
//  Created by fei on 2017/8/22.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    var currentOffset:CGFloat = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "隐藏"
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blue;
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black;
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 100;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
    }

    // MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        //滚动判断 tableView的方向，确定是否隐藏navigationBar
        if scrollView.contentOffset.y > currentOffset && scrollView.contentOffset.y > 60 {
            UIView.animate(withDuration: 2, animations: {
                
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                
            }, completion: { (finish) in
                
            })
        } else {
            UIView.animate(withDuration: 2, animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: { (finish) in

            })
        }
    }
    
    //根据手指拖动方向判断是否隐藏，
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        currentOffset = scrollView.contentOffset.y;
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
        cell.contentLbl.text = "滑动隐藏navigationBar：\n\(indexPath.row*999999999)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
