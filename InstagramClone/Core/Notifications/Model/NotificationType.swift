//
//  NotificationType.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/04/26.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow

    var notificationMessage: String {
        switch self {
        case .like:
            return "liked one your posts"
        case .comment:
            return "commented ono one of your posts"
        case .follow:
            return "started following you"
        }
    }
}
