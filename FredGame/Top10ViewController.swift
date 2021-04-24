//
//  Top10ViewController.swift
//  FredGame
//
//  Created by user188455 on 3/15/21.
//

import UIKit

class Top10ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let fredService : FredScoreService = FredScoreService()
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    func configureView() {
        top10data!.loadData {
            DispatchQueue.main.async {
                self.scoreTableView.reloadData()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    var top10data : Top10? {
        didSet {

        }
    }
    
    // MARK: Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return top10data!.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = getScoreData(score: (top10data!.getList()[indexPath.row]))
        
        return cell
    }
    
    func getScoreData(score: Score) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        let entry = "\(dateFormatter.string(from: score.date)) \(score.name) \(score.points)"
        return entry
    }
}
