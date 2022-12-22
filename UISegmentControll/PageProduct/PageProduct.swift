//
//  PageProduct.swift
//  UISegmentControll
//
//  Created by Леонид Шелудько on 01.12.2022.
//

import UIKit

class PageProduct: UIViewController {
    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuArray = [String]()//массив названий
    var imageArray = [UIImage()]//массив фото
    var imageSegment = UIImage()
    
    var nameLabel = UILabel()
    var updateNameLabel = ""
    
//кнопки слева
    let costLabel = UILabel()
    let sizeLabel = UILabel()
    let quantityLabel = UILabel()
    let colorLabel = UILabel()
    let upfrontLabel = UILabel()
    
//кнопки справа
    var price = UILabel()
    let sizePicker = UIPickerView()
    var sizeTextField = UITextField()
    let countButton = UIButton()
    let upfrontSwitch = UISwitch()
    
//Добавить в корзину
    let addBasket = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //image
        imageView.frame = CGRect(x: 50, y: 70, width: 300, height: 200)
        imageSegment = imageArray[0]
        imageView.image = imageSegment
        self.view.addSubview(imageView)
        
        //creat segment
        segmentControll = UISegmentedControl(items: self.menuArray)
        segmentControll.frame = CGRect(x: 170, y: 600, width: 200, height: 30)
        segmentControll.selectedSegmentIndex = 0
        self.view.addSubview(segmentControll)
        
        segmentControll.addTarget(self, action: #selector(selectedValue(target: )), for: .valueChanged)
        
        
        
//label
        nameLabel.text = updateNameLabel
        nameLabel.frame = CGRect(x: 95, y: 300, width: 250, height: 35)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(nameLabel)
        
//Кнопки слева
        costLabel.text = "Стоимость:"
        costLabel.frame = CGRect(x: 30, y: 450, width: 150, height: 25)
        costLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(costLabel)
        
        sizeLabel.text = "Размер:"
        sizeLabel.frame = CGRect(x: 30, y: 500, width: 150, height: 25)
        sizeLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(sizeLabel)
        
        quantityLabel.text = "Количество:"
        quantityLabel.frame = CGRect(x: 30, y: 550, width: 150, height: 25)
        quantityLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(quantityLabel)
        
        colorLabel.text = "Цвет:"
        colorLabel.frame = CGRect(x: 30, y: 600, width: 150, height: 25)
        colorLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(colorLabel)
        
        upfrontLabel.text = "Предоплата:"
        upfrontLabel.frame = CGRect(x: 30, y: 650, width: 150, height: 25)
        upfrontLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(upfrontLabel)
        
//кнопки справа
        price.text = "5000 рублей"
        price.frame = CGRect(x: 245, y: 450, width: 150, height: 25)
        price.font = UIFont.systemFont(ofSize: 21)
        price.textColor = UIColor.gray
        view.addSubview(price)
        
        sizeTextField.text = "Выбрать"
        sizeTextField.textColor = .gray
        sizeTextField.textAlignment = .right
        sizeTextField.font = .systemFont(ofSize: 19)
        sizeTextField.frame = CGRect(x: 268, y: 500, width: 100, height: 25)
        view.addSubview(sizeTextField)
        
        sizePicker.dataSource = self
        sizePicker.delegate = self
        sizeTextField.inputView = sizePicker
        sizeTarget()
        
        countButton.setTitle("Ввести", for: .normal)
        countButton.setTitleColor(.gray, for: .normal)
        countButton.contentHorizontalAlignment = .right
        countButton.frame = CGRect(x: 267, y: 550, width: 100, height: 25)
        countButton.addTarget(self, action: #selector(countTarget(target: )), for: .touchUpInside)
        view.addSubview(countButton)
        
        upfrontSwitch.frame = CGRect(x: 320, y: 650, width: 0, height: 0)
        view.addSubview(upfrontSwitch)
        
//Добавить в корзину
        addBasket.backgroundColor = .red
        addBasket.setTitle("Добавить в корзину", for: .normal)
        addBasket.frame = CGRect(x: 70, y: 700, width: 250, height: 50)
        addBasket.addTarget(self, action: #selector(basketTarget(target: )), for: .touchUpInside)
        view.addSubview(addBasket)
        
    }
//Cегмент
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex  //Индекс выбранного элемента в сегмент контроле
            
            imageSegment = self.imageArray[segmentIndex]
            
            self.imageView.image = imageSegment
            
            let pr = target.titleForSegment(at: segmentIndex) // записали в переменную то что выбрал пользователь
            print(pr ?? "")
        }
    }
    
//Размер
    func sizeTarget() {
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            sizeTextField.inputAccessoryView = toolbar
            
            let button = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneSizeToolbar))
            let flexbile = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            toolbar.setItems([flexbile, button], animated: true)
    }
    
    @objc func doneSizeToolbar(){
        view.endEditing(true)
    }
    
//Колличество
    @objc func countTarget(target: UIButton) {
        if target == self.countButton {
            let alertController = UIAlertController(title: "Введите колличество", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                let textAlert = alertController.textFields?.first
                self.countButton.setTitle((textAlert?.text!)!, for: .normal)
                let priceAlert = 5000 * (Int((textAlert?.text!)!) ?? 1)
                self.price.text = "\(priceAlert) руб"
            }
            alertController.addTextField()
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
//В корзину
    @objc func basketTarget(target: UIButton) {
        if target == addBasket {
            let storyboard = UIStoryboard(name: "Basket", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Basket") as! Basket
            vc.imageArray = imageArray
            vc.updateImage = imageSegment
            vc.updateFullPrice += (price.text?.split(separator: " ").first)! + "руб"
            vc.updateSize = sizeTextField.text!
            vc.updateQantity = (self.countButton.titleLabel?.text!)!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}




//Расширение для пикера Размера обуви
let sizeFootwear = ["36", "36.5", "38", "40", "42"]
extension PageProduct: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sizeFootwear.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        sizeFootwear[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = sizeFootwear[row]
    }
}
