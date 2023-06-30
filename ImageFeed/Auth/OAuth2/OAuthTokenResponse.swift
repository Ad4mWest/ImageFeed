//  OAuthTokenResponse.swift
//  ImageFeed
//  Created by Adam West on 30.06.23.

import Foundation

struct OAuthTokenResponseBody: Decodable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let createdAt: Int
}
