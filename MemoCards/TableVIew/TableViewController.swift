//
//  TableViewController.swift
//  MemoCards
//
//  Created by Дмитрий Карпов on 01/04/2019.
//  Copyright © 2019 MacKarpov. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var data: [ParameterList] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstGameParameters = ParameterList(direction: .backward, firstNumber: 10, finishNumber: 20)
        let secondGameParameters = ParameterList(direction: .random, firstNumber: 21, finishNumber: 40)
        data.append(firstGameParameters)
        data.append(secondGameParameters)

//        data = ["7", "8", "9", "10", "7", "8", "9", "10"]

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! GameTableViewCell
        let cellData = data[indexPath.row]
        cell.indexCellLabel.text = String(indexPath.row)
        cell.nameOfGameCellLabel.text = ""
        cell.firstNumberCellLabel.text = String(cellData.firstNumber)
        cell.directionCellLabel.text = cellData.direction.directionImage
        cell.endNumberCellLabel.text = String(cellData.finishNumber)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
