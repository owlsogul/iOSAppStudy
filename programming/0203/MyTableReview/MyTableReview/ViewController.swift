//
//  ViewController.swift
//  MyTableReview
//
//  Created by CAUADC on 2017. 2. 3..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 테이블 뷰가 몇 개의 섹션을 가져야 하는지 묻습니다
    func numberOfSections(in tableView: UITableView) -> Int{
        return 4;
    }

    // 섹션에 해당하는 로우의 개수를 묻습니다
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int /* 몇번째 섹션? */) -> Int{
        
        switch section{
        case 0:
            return 2;
        case 1:
            return 3;
        case 2:
            return 15;
        default:
            return 15
        }
        
    }

    let t: [String] = ["날이좋아서", "날이좋지않아서", "날이적당해서"]
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let section :Int = indexPath.section;
        let row: Int = indexPath.row;
        
        // 섹션이 0번째 라면
        if section == 0 {
            
            let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MyTableViewCell
            
            cell.leftLable.text = "Wow!"
            cell.rightLable.text = "\(section) - \(row)"
            
            return cell;
        }
        
        //섹션이 0번째가 아니라면
        else {
            let cell: UITableViewCell
            
            if (section == 1){
                cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
                cell.detailTextLabel?.text = t[row]
            }
            else if (section == 2){
                cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath)
                if (row < t.count){
                    cell.detailTextLabel?.text = t[row]
                }
                else {
                    cell.detailTextLabel?.text = "우헤헤헤"
                }
            }
            else{
                cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            }
            
            

            cell.textLabel?.text = "\(section) - \(row)"
            return cell;

        }
        
    }

    //과제 섹션의 헤더, 푸터 관련 정보 찾고, 헤더에 섹션이름 붙히기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "SECTION\(section)"
    }
}

