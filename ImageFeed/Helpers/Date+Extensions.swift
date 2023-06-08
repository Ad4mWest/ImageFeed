//  Date+Extensions.swift
//  ImageFeed
//  Created by Adam West on 29.05.23.

import Foundation

private var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()

extension Date {
    var dateTimeString: String { dateFormatter.string(from: self) }
}
