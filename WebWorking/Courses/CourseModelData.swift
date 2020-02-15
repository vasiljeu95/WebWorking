//
//  CourseModelData.swift
//  WebWorking
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

struct CourseData: Decodable {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct WebsiteDescriptionData: Decodable {
    let courses: [CourseData]?
    let websiteDescription: String?
    let websiteName: String?
}
