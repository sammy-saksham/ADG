//
//  ViewController.swift
//  TableView_2
//
//  Created by Saksham Jain on 25/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!


    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

class ThirtyDayCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        func setupView() {
            addSubview(cellView)
            cellView.addSubview(dayLabel)
            self.selectionStyle = .none
            
            NSLayoutConstraint.activate([
                cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
            cell.backgroundColor = UIColor.white
            cell.dayLabel.text = "Day \(indexPath.row+1)"
            
            return cell
        }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

