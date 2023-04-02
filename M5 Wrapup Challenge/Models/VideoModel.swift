//
//  VideoModel.swift
//  M5 Wrapup Challenge
//
//  Created by Quevin Bambasi on 4/2/23.
//

import Foundation

struct VideoModel: Identifiable, Decodable {
    var id:Int
    var title:String
    var url:String
}
