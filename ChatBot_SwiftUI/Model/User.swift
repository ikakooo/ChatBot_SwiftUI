//
//  User.swift
//  ChatBot_SwiftUI
//
//  Created by IKAKOOO on 01.09.23.
//

import Foundation

struct User: Hashable {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
