//
//  ViewController.swift
//  UISegmentControll
//
//  Created by Леонид Шелудько on 01.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var goods1 = UIButton()
    var goods2 = UIButton()
    
    let text1 = UILabel()
    let text2 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goods1.setImage(UIImage(named: "white.jpg")?.withRenderingMode(.alwaysOriginal), for: .normal)
        goods1.frame = CGRect(x: 50, y:100, width: 300, height:200)
        goods1.addTarget(self, action: #selector(nextPage(target: )), for: .touchUpInside)
        goods1.tag = 0
        view.addSubview(goods1)
        
        goods2.setImage(UIImage(named: "running.jpg")?.withRenderingMode(.alwaysOriginal), for: .normal)
        goods2.frame = CGRect(x: 50, y: 400, width: 300, height: 200)
        goods2.addTarget(self, action: #selector(nextPage(target: )), for: .touchUpInside)
        goods2.tag = 1
        view.addSubview(goods2)
        
        text1.text = "Кроссовки за 5000 руб"
        text2.text = "Кроссовки за 4999 руб"
        text1.frame = CGRect(x: 50, y: 310, width: 220, height: 17)
        text2.frame = CGRect(x: 50, y: 620, width: 220, height: 17)
        view.addSubview(text1)
        view.addSubview(text2)

    }

    @objc func nextPage(target: UIButton){
        let storyboard = UIStoryboard(name: "PageProduct", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PageProduct") as! PageProduct
        
        switch target.tag {
        case 0:
            vc.menuArray = ["Fimbul", "Winter"]
            vc.imageArray = [UIImage(named: "белые.jpg")!, UIImage(named: "white.jpg")!]
            vc.updateNameLabel = "Новый Баланс"
        case 1:
            vc.menuArray = ["Panter", "Black"]
            vc.imageArray = [UIImage(named: "running.jpg")!, UIImage(named: "white.jpg")!]
            vc.updateNameLabel = "Старый Баланс"
        default: break
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        //self.navigationController?.present(vc, animated: true, completion: nil)
    }
}

