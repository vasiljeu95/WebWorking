//
//  CourseDataTableViewCell.swift
//  WebWorking
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class CourseDataTableViewCell: UITableViewCell {

    @IBOutlet var courseDataImage: UIImageView!
    @IBOutlet var courseDataNameLabel: UILabel!
    @IBOutlet var courseNumberOfLessons: UILabel!
    @IBOutlet var courseNumberOfTests: UILabel!
    
    func configure(with course: CourseData) {
        courseDataNameLabel.text = course.name
        courseNumberOfLessons.text = "Number Of Lessons: \(course.number_of_lessons ?? 0)"
        courseNumberOfTests.text = "Number Of Tests: \(course.number_of_tests ?? 0)"
        
        DispatchQueue.global().async {
            guard let stringURL = course.imageUrl else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.courseDataImage.image = UIImage(data: imageData)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
