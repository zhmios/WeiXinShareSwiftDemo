//
//  RootViewController.swift
//  WeiXinSwiftDemo
//
//  Created by user on 14-9-20.
//  Copyright (c) 2014年 jianguo. All rights reserved.
//

import UIKit
protocol sendMessageDelegate : NSObjectProtocol{

    func changeMesgScene(secene:Int32);
    func senderLinkContent();
    
    

}
class RootViewController: UIViewController {
    
    var alertView:UIAlertView?
    
    var delegate:sendMessageDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
//        self.createUI()
       createUI();
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createUI(){
    
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.83, blue: 0.93, alpha: 1.0);
        self.navigationItem.title = "微信link分享---swift版";
        self.view.addSubview(titleLabel());
        self.view.addSubview(userImageview());
        linkShare();
        createAlertView()
    }
    
    func titleLabel()->UILabel{
    
        var title = UILabel (frame: CGRectMake(0, 90, self.view.bounds.width, 60));
        title.textAlignment = NSTextAlignment.Center;
        title.font = UIFont(name: "Helvetica-Bold", size: 15);
        title.text = "微信link分享尚未封装,集成其中的两项功能:1.分享给好友 2.分享到朋友圈";
        title.textColor = UIColor.blackColor();
        title.numberOfLines = 0;
        return title;
    }
    
    func userImageview()->UIImageView{
    
        var userImageView = UIImageView(frame:CGRectMake(self.view.bounds.size.width / 2 - 60, self.view.bounds.size.height / 2 - 70, 120, 120));
    
        userImageView.image = UIImage(named:"image");
        
        if self.view.bounds.height > 480 {
        
        userImageView.frame = CGRectMake(self.view.bounds.size.width / 2 - 60, self.view.bounds.size.height / 2 - 120, 120, 120);
        
            
            
        }
        return userImageView;
        
    }
    
    func createAlertView()->UIAlertView{
    
        if self.alertView == nil {
        
            self.alertView = UIAlertView(title: "温馨提示", message: "亲,你没有按照微信哦", delegate: nil, cancelButtonTitle: "确定");
        
        }
    
        return self.alertView!;
    
    }
    
    func linkShare() {
    
        var nameArr = ["分享给好友","分享给朋友圈"];
        for var i = 0 ; i < 2; i++ {
            var btn = UIButton.buttonWithType(UIButtonType.System) as UIButton;
            btn.setTitle(nameArr[i], forState: UIControlState.Normal);
            btn.titleLabel?.font  = UIFont.systemFontOfSize(14);
            btn.tag = i;
            btn.setTitleColor(UIColor.blackColor(), forState:.Normal);
            
            btn.frame = CGRectMake(CGFloat(130 * i), 320.0, 130.0, 60.0)
            btn.addTarget(self, action: "sendsendLinkContent:", forControlEvents:UIControlEvents.TouchUpInside);
            self.view.addSubview(btn);
            
        }
    
    }
    
    
    func sendsendLinkContent(sender:UIButton){
        
       var isinstall = WXApi.isWXAppInstalled()
        if isinstall {
            if sender.tag == 0 {
            
                println("第一个button按下");
                
                delegate?.changeMesgScene(0);
                
            }else{
                
                println("第二个button按下");
                delegate?.changeMesgScene(1);
            
            }
            delegate?.senderLinkContent();
        
        }else{
        
            self.alertView?.show();
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
