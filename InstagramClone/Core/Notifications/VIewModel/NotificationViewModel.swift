//
//  NotificationViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/04/26.
//

import Foundation

@Observable
class NotificationViewModel {

    var notifications = [Notification]()

    init() {
        fetchNotifications()
    }

    func fetchNotifications() {
        self.notifications = DeveloperPreview.shared.notifications
    }

}
