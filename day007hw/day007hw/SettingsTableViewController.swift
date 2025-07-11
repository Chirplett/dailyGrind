//
//  SettingsTableViewController.swift
//  day007hw
//
//  Created by Jude Song on 7/10/25.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let sections = ["전체 설정", "개인 설정", "기타"]
    
    let sectionWhole = ["공지사항", "실험실", "버전 정보"]
    let sectionPersonal = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let sectionEtc = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            sectionWhole.count
        } else if section == 1 {
            sectionPersonal.count
        } else {
            sectionEtc.count
        }

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = sectionWhole[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = sectionPersonal[indexPath.row]
        } else {
            cell.textLabel?.text = sectionEtc[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }



}
