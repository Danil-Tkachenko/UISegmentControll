//
//  Basket.swift
//  UISegmentControll
//
//  Created by Леонид Шелудько on 01.12.2022.
//

import UIKit

class Basket: UIViewController {
    var goodsImage = UIImageView()
    var updateImage = UIImage()
    var imageArray = [UIImage()]
    
    var fullPrice = UILabel()
    var updateFullPrice = "Итого: "
    
    var size = UILabel()
    var updateSize = ""
    
    var qantityLabel = UILabel()
    var qantity = UILabel()
    var updateQantity = ""
    
    var sizeLabel = UILabel()
    
    var buttonBar = UIButton()
    var picker = UIPickerView()
    
    var activity : UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodsImage.image = updateImage
        goodsImage.frame = CGRect(x: 50, y: 150, width: 100, height: 70)
        view.addSubview(goodsImage)
        
        fullPrice.frame = CGRect(x: 200, y: 500, width: 200, height: 40)
        fullPrice.text = updateFullPrice
        fullPrice.font = UIFont.boldSystemFont(ofSize: 22)
        view.addSubview(fullPrice)
        
        size.text = updateSize
        size.textColor = UIColor.gray
        size.frame = CGRect(x: 320, y: 170, width: 50, height: 30)
        view.addSubview(size)
        
        sizeLabel.text = "Размер"
        sizeLabel.frame = CGRect(x: 300, y: 120, width: 70, height: 30)
        sizeLabel.font = UIFont(name: "", size: 25)
        view.addSubview(sizeLabel)
        
        qantityLabel.text = "Колличесвто"
        qantityLabel.frame = CGRect(x: 180, y: 120, width: 110, height: 30)
        qantityLabel.font = UIFont(name: "", size: 25)
        view.addSubview(qantityLabel)
        
        qantity.text = updateQantity
        qantity.frame = CGRect(x: 220, y: 170, width: 50, height: 30)
        qantity.textColor = .gray
        view.addSubview(qantity)
        
        buttonBar.backgroundColor = .red
        //buttonBar.setTitle("Что дальше?", for: .normal)
        buttonBar.frame = CGRect(x: 70, y: 650, width: 250, height: 50)
        buttonBar.addTarget(self, action: #selector(buttonPicker(target:)), for: .touchUpInside)
        view.addSubview(buttonBar)
        
        picker.frame = CGRect(x: 0, y: 700, width: 400, height: 100)
        view.addSubview(picker)
        picker.delegate = self
    }
    
    @objc func buttonPicker(target: UIButton) {
        if target.titleLabel?.text == "Оистить корзину" {
            size.text = ""
            qantity.text = ""
            goodsImage.isHidden = true
        }
        if target.titleLabel?.text == "Поделиться" {
            activity = UIActivityViewController(activityItems: [qantity.text ?? nil, goodsImage.image ?? nil], applicationActivities: nil)
            self.present(activity!, animated: true, completion: nil)
        }
    }
}


let buttonWhy = ["Оистить корзину", "Поделиться"]
extension Basket: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        buttonWhy.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        buttonWhy[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        buttonBar.setTitle(buttonWhy[row], for: .normal)
    }
}
