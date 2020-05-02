//
//  ViewController.swift
//  sample
//
//  Created by Mamoru Sonoda on 2020/04/29.
//  Copyright © 2020 mamoru.sonoda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    var testData: [TestSettings] = []
        
        let mainTableView = UITableView.init(frame: CGRect(x: 0, y: 44, width: 375, height: 734),
                                             style: UITableView.Style.grouped)
        let mainTableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                                reuseIdentifier: "MAIN_CELL")
        
        
        /// View Life Sycle
        
        override func loadView() {
            super.loadView()
            
            mainTableView.dataSource = self
            mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MAIN_CELL")
            
            self.view.addSubview(mainTableView)
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            var totalRowsCount = 0
            for i in 0...2 {
                let data = TestSettings(sectionName: "Test\(i)",
                    detail1: totalRowsCount,
                    detail2: totalRowsCount + 1,
                    detail3: totalRowsCount + 2)
                totalRowsCount = (3 * (i + 1))
                
                testData.append(data)
            }
        }
        
        
        /// TableView Data Source Protocol
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return testData.count
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return testData[section].sectionName
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MAIN_CELL", for: indexPath)
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = String(testData[indexPath.section].detail1)
            case 1:
                cell.textLabel?.text = String(testData[indexPath.section].detail2)
            case 2:
                cell.textLabel?.text = String(testData[indexPath.section].detail3)
            default:
                cell.textLabel?.text = String("Error")
            }
            
            return cell
        }
        

        
        /// Test Data
        
        struct TestSettings {
            let sectionName: String
            let detail1: Int
            let detail2: Int
            let detail3: Int
        }
        
    }

