//
//  TimerManager.swift
//  LocationTracker
//
//  Created by Abdullah Mamun on 30/6/22.
//

import Foundation

class TimerManager {
    static let shared = TimerManager();
    private static var timer  = Timer.scheduledTimer(timeInterval: 6, target: TimerManager.self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    
    private init() {
        
    }
    
    public static func start() {
        timer.fire()
    }
    
    @objc static func startTimer() {
        //print("Timer fired")
        LocationManager.shared.monitorLocation()
    }
}
