//
//  ViewController.swift
//  WebWorking
//
//  Created by Stepan Vasilyeu on 2/15/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class MainCollectionViewController: UICollectionViewController {

    private let userActions = UserActions.allCases
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCollectionViewCell
        
        cell.userActionCollectionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: nil)
        case .exampleOne:
            performSegue(withIdentifier: "ExampleOne", sender: nil)
        case .exampleTwo:
            performSegue(withIdentifier: "ExampleTwo", sender: nil)
        case .exampleThree:
            performSegue(withIdentifier: "ExampleThree", sender: nil)
        case .exampleFour:
            performSegue(withIdentifier: "ExampleFour", sender: nil)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowImage" {
            let coursesVC = segue.destination as! CoursesTableViewController
            
            switch segue.identifier {
            case "ExampleOne":
                coursesVC.fetchDataOne()
            case "ExampleTwo":
                coursesVC.fetchDataTwo()
            case "ExampleThree":
                coursesVC.fetchDataThree()
            case "ExampleFour":
                coursesVC.fetchDataFour()
            case "OurCourses":
                coursesVC.fetchDataCourses()
            default:
                break
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

