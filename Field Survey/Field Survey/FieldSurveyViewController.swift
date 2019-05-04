//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Park, Joy (MU-Student) on 5/3/19.
//  Copyright © 2019 Park. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dateFormatter = DateFormatter()

    @IBOutlet weak var fieldSurveysTableView: UITableView!
    
    let jsonFileName = "field_observations"
    var fieldSurveys: FieldSurveys?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        fieldSurveys = FieldSurveyJSONLoader.load(jsonFileName: jsonFileName)
        
        self.title = "Field Survey"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveys?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveysTableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let fieldSurvey = fieldSurveys?.observations[indexPath.row]{
            cell.titleLabel.text = fieldSurvey.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            cell.fieldIconImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
        let selectedIndexPath = fieldSurveysTableView.indexPathForSelectedRow {
            destination.fieldSurvey = fieldSurveys?.observations[selectedIndexPath.row]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
