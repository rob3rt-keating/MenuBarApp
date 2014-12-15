//
//  AppDelegate.swift
//  MenuBarApp
//
//  Created by Robert on 12/15/14.
//  Copyright (c) 2014 Robert. All rights reserved.
// http://www.sososwift.com/posts/swift-programming-tutorials-creating-menubar-applications-on-os-x

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var subItemLabel: NSMenuItem!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon?.setTemplate(true)
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        
    }
    


    @IBAction func menuClicked(sender: NSMenuItem) {
        
        let task = NSTask()
        var stmenu = subItemLabel.title
        task.launchPath = ("/usr/bin/defaults")
        
        if (subItemLabel.title == "Hide Files")  {
            //sender.state = NSOffState
            statusItem.title = ""
            
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
        }
        else {
            //sender.state = NSOffState
            statusItem.title = "Hide Files"
            subItemLabel.title = "Hide Files"
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
        }
        

//        if (statusItem.title == "Hide Files")  {
//            sender.state = NSOffState
//            statusItem.title = ""
//            
//            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
//        }
//        else {
//            sender.state = NSOffState
//            statusItem.title = "Hide Files"
//            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
//        }

         task.launch()
        task.waitUntilExit()
        
        let killtask = NSTask()
        killtask.launchPath = "/usr/bin/killall"
        killtask.arguments = ["Finder"]
        killtask.launch()
        
    }

}
        
