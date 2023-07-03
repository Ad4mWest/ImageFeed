//  Constants.swift
//  ImageFeed
//  Created by Adam West on 25.06.23.

import Foundation

enum AuthConstants {
    static let accessKey = "X3IalbDaOq-A2vm7Pvub-eNPBB19g0dDen3PV9-GNVc"
    static let secretKey = "muJfbnQntSE8py0M3gbgAfRqMTI77fLe48oeiDEWAkE"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = "https://api.unsplash.com/"
    static let accessTokenURL = "https://unsplash.com/oauth/token"
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}
