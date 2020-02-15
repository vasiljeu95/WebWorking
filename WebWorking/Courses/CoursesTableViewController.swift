//
//  CoursesTableViewController.swift
//  WebWorking
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {

    private let jsonUrlOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let jsonUrlTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let jsonUrlThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    private let jsonUrlFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    
    private var coursesData: [CourseData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! CourseDataTableViewCell

        let course = coursesData[indexPath.row]
        cell.configure(with: course)

        return cell
    }
    
    // MARK: - Example One SESSION
    func fetchDataOne() {
        guard let url = URL(string: jsonUrlOne) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let courseData = try JSONDecoder().decode(CourseData.self, from: data)
                print(courseData.name ?? "Unknown")
                print(courseData.imageUrl ?? "Unknown")
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Example Two SESSION
    // разворачиваем массив
    func fetchDataTwo() {
        guard let url = URL(string: jsonUrlTwo) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let coursesData = try JSONDecoder().decode([CourseData].self , from: data)
                print(coursesData)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Example Three SESSION
    // разворачиваем более сложную структуру данных
    func fetchDataThree() {
        guard let url = URL(string: jsonUrlThree) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let websiteDescriptionData = try JSONDecoder().decode(WebsiteDescriptionData.self, from: data)
                print(websiteDescriptionData.courses ?? "Unknown")
                print(websiteDescriptionData.courses?[0].name ?? "Unknown")
                print(websiteDescriptionData.courses?[0].imageUrl ?? "Unknown")
                print(websiteDescriptionData.courses?[0].number_of_lessons ?? "Unknown")
                print(websiteDescriptionData.websiteName ?? "Unknown")
                print(websiteDescriptionData.websiteDescription ?? "Unknown")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Example Four SESSION
    // разворачиваем JSON с ошибкой
    func fetchDataFour() {
        guard let url = URL(string: jsonUrlFour) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let websiteDescriptionData = try JSONDecoder().decode(WebsiteDescriptionData.self, from: data)
                print(websiteDescriptionData.courses ?? "Unknown")
                print(websiteDescriptionData.courses?[0].name ?? "Unknown")
                print(websiteDescriptionData.courses?[0].imageUrl ?? "Unknown")
                print(websiteDescriptionData.courses?[0].number_of_lessons ?? "Unknown")
                print(websiteDescriptionData.websiteName ?? "Unknown")
                print(websiteDescriptionData.websiteDescription ?? "Unknown")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Our Courses SESSION
    // разворачиваем JSON в модель данных отображаемых на View
    func fetchDataCourses() {
        guard let url = URL(string: jsonUrlTwo) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.coursesData = try JSONDecoder().decode([CourseData].self , from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

}
