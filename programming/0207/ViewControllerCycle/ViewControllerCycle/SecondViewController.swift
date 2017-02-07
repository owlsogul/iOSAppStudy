//
//  SecondViewController.swift
//  ViewControllerCycle
//
//  Created by CAUADC on 2017. 2. 7..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //ViewController가 처음으로 생성되었을 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("SecondViewController가 생성되었습니다")
    }
    
    // ViewController가 화면에 나타나기 직전에 호출되는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController가 화면에 나타나기 직전입니다. viewWillAppear")
    }
    
    
    // ViewController가 화면에 나타난 직후에 호출되는 함수
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController가 화면에 나타난 직후입니다. viewDidAppear")
    }
    
    // ViewController가 화면에서 사라지기 직전에 호추되는 함수
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController가 화면에서 사라지기 직전입니다. viewWillDisappear")
    }
    
    // ViewController가 화면에서 사라진 직후에 호출되는 함수
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController가 화면에서 사라진 직후입니다. viewDidDisappear")
    }

}
