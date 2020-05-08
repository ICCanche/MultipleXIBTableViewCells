//
//  ViewController.swift
//  DiferentCellTypes
//
//  Created by Irvin Chan on 08/05/20.
//  Copyright © 2020 iccanche. All rights reserved.
//

import UIKit

enum CellType {
    case A
    case B
}

struct CellItem {
    var type: CellType
    var text: String
}


class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            tableview.register(UINib(nibName: "TypeATableViewCell", bundle: nil), forCellReuseIdentifier: "TypeATableViewCell")
            tableview.register(UINib(nibName: "TypeBTableViewCell", bundle: nil), forCellReuseIdentifier: "TypeBTableViewCell")
        }
    }
    var datasource: [CellItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        datasource = [CellItem(type: .A, text: "Item 1"), CellItem(type: .B, text: "Item 2"), CellItem(type: .A, text: "Item 3"), CellItem(type: .B, text: "Item 3"), CellItem(type: .A, text: "Item 3"), CellItem(type: .B, text: "Item 3"), CellItem(type: .A, text: "Item 3")]
        tableview.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = datasource[indexPath.row]
        switch item.type {
        case .A:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TypeATableViewCell", for: indexPath) as! TypeATableViewCell
            return cell
        case .B:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TypeBTableViewCell", for: indexPath) as! TypeBTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

