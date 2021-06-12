//
//  registView.swift
//  relo
//
//  Created by Endeavour on 2021/6/6.
//

import UIKit

extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height));
        let reSizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage
//        return reSizeImage.withRenderingMode(.alwaysOriginal);
    }
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
    func toCircle() -> UIImage {
        //取最短边长
        let shotest = min(self.size.width, self.size.height)
//        let shotest=CGFloat(20.0)
        //输出尺寸
        let outputRect = CGRect(x: 0, y: 0, width: shotest, height: shotest)
        //开始图片处理上下文（由于输出的图不会进行缩放，所以缩放因子等于屏幕的scale即可）
        UIGraphicsBeginImageContextWithOptions(outputRect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        //添加圆形裁剪区域
        context.addEllipse(in: outputRect)
        context.clip()
        //绘制图片
        self.draw(in: CGRect(x: (shotest-self.size.width)/2,
                              y: (shotest-self.size.height)/2,
                              width: self.size.width,
                              height: self.size.height))
        //获得处理后的图片
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return maskedImage
    }
}

class registView: UIViewController,UITextFieldDelegate {
    let textfield = UITextField(frame: CGRect(x: 50, y: 340, width: 300, height: 50))
    let textfield1=UITextField(frame: CGRect(x: 50, y: 410, width: 300, height: 50))
    let textfield2=UITextField(frame: CGRect(x: 50, y: 480, width: 300, height: 50))
    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let backitem = UIBarButtonItem(image: UIImage(named: "backbtn")?.reSizeImage(reSize: CGSize(width: 25, height: 25)), style: .plain, target: self, action: #selector(backToPrevious))
//        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
//                                             action: nil)
//                spacer.width = -10
//
//                self.navigationItem.leftBarButtonItems = [spacer, backitem]
        
        self.view.backgroundColor = UIColor.white
        
        let reglab = UIImageView(image: UIImage(named: "registlabel"))
        reglab.frame = CGRect(x:50 , y :190, width: 360,height: 90)
        //reglab.layer.cornerRadius = logo.frame.size.width/2
        reglab.layer.masksToBounds = true
        self.view.addSubview(reglab)

        
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "用户名"
        textfield.textAlignment = .center
        textfield.textColor = UIColor.black
        textfield.backgroundColor = UIColor.clear
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.cornerRadius = 25
        textfield.layer.masksToBounds = true
        textfield.clearButtonMode = .always
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.delegate = self

        self.view.addSubview(textfield)

        
        textfield1.borderStyle = .roundedRect
        textfield1.placeholder = "邮箱或手机号"
        textfield1.textAlignment = .center
        textfield1.textColor = UIColor.black
        textfield1.backgroundColor = UIColor.clear
        textfield1.layer.borderWidth = 2.0
        textfield1.layer.borderColor = UIColor.black.cgColor
        textfield1.layer.cornerRadius = 25
        textfield1.layer.masksToBounds = true
        textfield1.clearButtonMode = .always
        textfield1.keyboardType = UIKeyboardType.default
        textfield1.returnKeyType = UIReturnKeyType.done
        textfield1.delegate = self
        
        self.view.addSubview(textfield1)
        
        textfield2.borderStyle = .roundedRect
        textfield2.placeholder = "密码"
        textfield2.textAlignment = .center
        textfield2.textColor = UIColor.black
        textfield2.backgroundColor = UIColor.clear
        textfield2.layer.borderWidth = 2.0
        textfield2.layer.borderColor = UIColor.black.cgColor
        textfield2.layer.cornerRadius = 25
        textfield2.layer.masksToBounds = true
        textfield2.clearButtonMode = .always
        textfield2.isSecureTextEntry = true
        textfield2.keyboardType = UIKeyboardType.default
        textfield2.returnKeyType = UIReturnKeyType.done
        textfield2.delegate = self
        
        self.view.addSubview(textfield2)
        
        let registbuttonp = UIButton(frame: CGRect(x: 50, y: 590, width: 300, height: 50))
        registbuttonp.backgroundColor = UIColor(red: 243/255, green: 104/255,blue: 56/255, alpha: 1)
        registbuttonp.setTitle("注册", for: .normal)
        registbuttonp.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        registbuttonp.layer.cornerRadius = 25
        //registbuttonp.layer.masksToBounds = true
        registbuttonp.layer.shadowColor = UIColor.black.cgColor
        registbuttonp.layer.shadowRadius = 2
        registbuttonp.layer.shadowOffset = CGSize(width: 2, height: 2)
        registbuttonp.layer.shadowOpacity = 0.3
        //registbuttonp.layer.backgroundColor = UIColor.black.cgColor
        self.view.addSubview(registbuttonp)
        
        let backbutton = UIButton(frame: CGRect(x: 45, y: 90, width: 50, height: 50))
        backbutton.setBackgroundImage(UIImage(named: "backbtn"), for: UIControl.State.normal)
        backbutton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        self.view.addSubview(backbutton)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            textfield1.resignFirstResponder() //方法一
        textfield.resignFirstResponder()
        textfield2.resignFirstResponder()
            self.view.endEditing(true) //方法二
        }
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
