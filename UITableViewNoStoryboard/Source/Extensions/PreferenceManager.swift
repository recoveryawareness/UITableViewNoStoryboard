//
//  PreferenceManager.swift
//  CustomSwitches
//
//  Created by chloe korzh on 22/01/2023.
//

import Foundation
import UIKit

class PreferenceManager : NSObject {
    
    let Defaults: UserDefaults = UserDefaults.init(suiteName: "com.atebitsy.bluelabs")!

    private let PreferredProfileTabSelection = "preferredProfileTab"
    private let DisplayTypeSelection = "displayType"
    
    
    private let PreferenceManagerCallLoggingDidChangeNotification = "PreferenceManagerCallLoggingDidChangeNotification"
    
    private static var instance : PreferenceManager? = nil
    
    static let isTimelineExcludedFromTabBar = "isTimelineExcludedFromTabBar"
    static let isGuideExcludedFromTabBar = "isGuideExcludedFromTabBar"
    static let isVoiceExcludedFromTabBar = "isVoiceExcludedFromTabBar"
    static let isCommunitiesExcludedFromTabBar = "isCommunitiesExcludedFromTabBar"
    static let isNotificationsExcludedFromTabBar = "isNotificationsExcludedFromTabBar"
    static let isDirectMessagesExcludedFromTabBar = "isDirectMessagesExcludedFromTabBar"
   
    
    private let preferredProfileTabValues = [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8
    ]
    
    private let displayTypeOptions = [
        0,
        1
    ]
    
    
    @objc static let sharedInstance : PreferenceManager = {
        let ret = PreferenceManager()
        return ret
    }()
    
    //private var userDefaults : UserDefaults? = nil
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults

        defaults.register(defaults: [
            PreferenceManager.isTimelineExcludedFromTabBar: true,

            
        ])
    }


 
    @objc var feature1: Bool {
        get { Defaults.bool(forKey: "feature1") }
        set { Defaults.set(newValue, forKey: "feature1")
        NotificationCenter.default.post(name: PreferenceManager.settingsDidChangeNotificationName, object: nil)
        }
    }
    
    @objc var feature2: Bool {
        get { Defaults.bool(forKey: "feature2") }
        set { Defaults.set(newValue, forKey: "feature2")
        NotificationCenter.default.post(name: PreferenceManager.settingsDidChangeNotificationName, object: nil)
        }
    }
    
    @objc var feature3: Bool {
        get { Defaults.bool(forKey: "feature3") }
        set { Defaults.set(newValue, forKey: "feature3")
        NotificationCenter.default.post(name: PreferenceManager.settingsDidChangeNotificationName, object: nil)
        }
    }

    static var settingsDidChangeNotificationName = NSNotification.Name("PreferenceManagerDidChange")

}
