//
//  ViewController.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // 스토리보드의 테이블뷰와 연결할 아울렛 변수
    @IBOutlet weak var tableView: UITableView!
    
    // 데이터베이스에서 불러온 사진 정보들을 담아놓을 변수
    var photoInfos: Results<PhotoInfo>?
    
    
    // ViewController의 화면이 보여지기 직전에 불려질 함수
    // 다음 화면에서 Back을 눌렀을 때 로그가 찍힘
    // 처음 시작했을 때 로그가 찍힘
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // Realm을 초기화하여 realm 이라는 이름으로 사용합니다
        let realm = try? Realm()
        
        // PhotoInfo에 해당하는 자료들을 데이터 베이스에 불러와서 PhotoInfos에 넣어줍니다
        self.photoInfos = realm?.objects(PhotoInfo.self)
        
        // 테이블뷰를 새로고침합니다
        // > 테이블뷰를 새로고침하면 테이블뷰가 보스에게 다시 row의 개수와 데이터를 요청합니다.
        self.tableView.reloadData()
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // photoInfos는 옵셔널이므로 옵셔널에 값이 없으면 0을 돌려주세요
        return photoInfos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row: Int = indexPath.row
        
        if let info = self.photoInfos?[row]{
            
            // 사진정보의 title을 텍스트 레이블에 저장
            cell.textLabel?.text = info.title
            
            // 사진정보의 이미지 데이터를 UIImage로 변경해서  cell의 이미지뷰에 세팅
            if let imageData = info.imageData{
                cell.imageView?.image = UIImage(data: imageData, scale: 0.1)
            }
            
            //날짜 형식을 지정할 date formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd hh:mm:ss"
            
            // 사진이 저장된 시점을 불러와서 문자열(String)으로 변경
            let dateString = dateFormatter.string(from: info.savedDate)
            
            // cell의 detailTextLabel에 세팅
            cell.detailTextLabel?.text = dateString
        }
        
        return cell
    }
    
    
    // 스토리보드의 세그를 통해 화면을 이동하기 전에 처리해 주어야 할 일을 넣어주는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // AddImageView 로 가는 것이 맞느냐?
        let nextViewController = segue.destination as? AddImageViewController
        // Cell을 누른건지 플러스 버튼을 누른건지 확인
        let selectedIndex = self.tableView.indexPathForSelectedRow
        
        if let imageViewController = nextViewController {
            
            print("다음 화면은 이미지 뷰 컨트롤러입니다.")
            
            if let index = selectedIndex{
                print("선택된 셀의 index는 \(index.section))번째 섹션 \(index.row)번째 줄입니다")
                
                // 선택된 셀의 인덱스에 해당하는 사진정보를  photoInfos에서 꺼내옵니다
                let info = self.photoInfos?[index.row]
                imageViewController.photoInfoFromPrevController = info
            }
            
            
        }
        
        
        
    }
    

}

