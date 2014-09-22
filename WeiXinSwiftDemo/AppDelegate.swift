//
//  AppDelegate.swift
//  WeiXinSwiftDemo
//
//  Created by user on 14-9-20.
//  Copyright (c) 2014年 jianguo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,sendMessageDelegate,WXApiDelegate {
  
    var window: UIWindow?
    var senceType: Int32?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var root = RootViewController();
        root.delegate = self;
        var na = UINavigationController(rootViewController: root);
        self.window?.rootViewController = na;
        
        WXApi.registerApp("wxd930ea5d5a258f4f");
        
        // Override point for customization after application launch.
        return true
    }

   func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
    
    return WXApi.handleOpenURL(url, delegate:self)
    
    }
    
     func application(application: UIApplication, openURL url: NSURL, sourceApplication: String, annotation: AnyObject?) -> Bool {
        
        var isSuc = WXApi.handleOpenURL(url, delegate: self);
        
        return isSuc
    }

     func onResp(resp: BaseResp!) {
       
        if resp.isKindOfClass(SendMessageToWXResp){
        var alert = UIAlertView(title: "温馨提示", message: "发送成功", delegate: self, cancelButtonTitle: "确定")
            alert.show();
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
  //代理方法
    func changeMesgScene(secene:Int32){
    
      senceType = secene
        
    
    }
    func senderLinkContent(){
      
        var message = WXMediaMessage();
        message.title = "专访张小龙：产品之上的世界观"
        message.description = "微信的平台化发展方向是否真的会让这个原本简洁的产品变得臃肿？在国际化发展方向上，微信面临的问题真的是文化差异壁垒吗？腾讯高级副总裁、微信产品负责人张小龙给出了自己的回复。";
        var ext = WXWebpageObject()
        ext.webpageUrl = "http://tech.qq.com/zt2012/tmtdecode/252.htm";
        message.mediaObject = ext;
        var req = SendMessageToWXReq();
        req.bText = false;
        req.message = message;
        req.scene = senceType!;
        WXApi.sendReq(req);
      
        
    }

}

