//
//  ViewController.swift
//  CollectionCell
//
//  Created by Justyna Kowalkowska on 01/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        models.append(Model(text: "Image1", imageName: "Image1"))
        models.append(Model(text: "Image2", imageName: "Image2"))
        models.append(Model(text: "Image3", imageName: "Image3"))
        models.append(Model(text: "Image4", imageName: "Image4"))
        models.append(Model(text: "Image1", imageName: "Image1"))
        models.append(Model(text: "Image2", imageName: "Image2"))
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)

        table.delegate = self
        table.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: models)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}

struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

