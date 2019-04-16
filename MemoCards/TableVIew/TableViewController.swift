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

    var staticData: [ParameterList] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let maxGameParameters = ParameterList(nameOfSet: "Все цифры", direction: .forward, firstNumber: 0, finishNumber: MemoCardsViewModel.memoCards.count-1)
        staticData.append(maxGameParameters)

        var lastUsersGame  = AppData.userLastSet
        if lastUsersGame != nil {
            lastUsersGame?.nameOfSet = "Последняя игра"
            staticData.append(lastUsersGame!)
        }
    }

    //Data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return staticData.count
        } else {
            return AppData.userSet.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! GameTableViewCell
        let cellData: ParameterList

        if indexPath.section == 0 {

            cellData = staticData[indexPath.row]

        } else {

            cellData = AppData.userSet[indexPath.row]

        }

        if indexPath.section == 0 {
            cell.indexCellLabel.text = String(indexPath.row + 1)
        } else {
            cell.indexCellLabel.text = String(indexPath.row + 1 + staticData.count)
        }

        cell.nameOfGameCellLabel.text = cellData.nameOfSet
        cell.firstNumberCellLabel.text = String(cellData.firstNumber)
        cell.directionImage.image = UIImage(named: cellData.direction.directionImage)
        cell.endNumberCellLabel.text = String(cellData.finishNumber)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Фиксированные наборы"
        } else {
            return "Пользовательские наборы"
        }
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    //Delegate

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
