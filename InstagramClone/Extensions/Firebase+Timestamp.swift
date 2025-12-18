//
//  Firebase+Timestamp.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 18/12/25.
//

import Firebase

extension Timestamp {

    func timestampToString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
