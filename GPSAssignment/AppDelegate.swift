//
//  AppDelegate.swift
//  GPSAssignment
//
//  Created by JERRY CHANG on 1/15/15.
//  Copyright (c) 2015 com.jerrysays. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Set actions
        var firstAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        firstAction.identifier = "FIRST_ACTION"
        firstAction.title = "Cancel"
        
        firstAction.activationMode = UIUserNotificationActivationMode.Background
        firstAction.destructive = true
        firstAction.authenticationRequired = false
        
        var secondAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = "SECOND_ACTION"
        secondAction.title = "Launch App"
        
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        
        var thirdAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        thirdAction.identifier = "THIRD_ACTION"
        thirdAction.title = "Third Action"
        
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
        
        
        //categories
        
        var firstCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "FIRST_CATEGORY"
        
        let defaultAction: NSArray = [firstAction, secondAction, thirdAction]
        let minimalAction: NSArray = [firstAction, secondAction]
        
        firstCategory.setActions(defaultAction, forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions(minimalAction, forContext: UIUserNotificationActionContext.Minimal)
        
        //Set for categories
        let theCategories: NSSet = NSSet(object: firstCategory)
        

        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        
        let theSettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: theCategories)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(theSettings)
        
        return true
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
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        //println("local notification")
    }


}

