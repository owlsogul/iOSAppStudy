//
//  ViewController.swift
//  ViewControllerCycle
//
//  Created by CAUADC on 2017. 2. 7..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //ViewController가 처음으로 생성되었을 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ViewController가 생성되었습니다")
    }
    
    // ViewController가 화면에 나타나기 직전에 호출되는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController가 화면에 나타나기 직전입니다. viewWillAppear")
    }
    
  
    // 가 화면에 나타난 직후에 호출되는 함수
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController가 화면에 나타난 직후입니다. viewDidAppear")
    }
    
    // 가 화면에서 사라지기 직전에 호추되는 함수
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController가 화면에서 사라지기 직전입니다. viewWillDisappear")
    }
    
    // ㅏㄱ 화면에서 사라진 직후에 호출되는 함수
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController가 화면에서 사라진 직후입니다. viewDidDisappear")
    }
    
    //스토리보드의 segue를 통해 화면이 전환될 떄 호출된 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let next = segue.destination
        // 목적지 뷰 컨트롤러가 SecondViewController인지 확인하여
        // 맞다면 secondViewController 라는 이름으로 사용하겠습니다
        if let secondViewController = next as? SecondViewController {
            print("목적지는 SecondViewController 입니다")
        } else{
            print("목적지는 SecondViewController가 아닙니다!!!")
        }
    }
}

