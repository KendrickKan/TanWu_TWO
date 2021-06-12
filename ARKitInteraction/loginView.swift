//
//  loginView.swift
//  relo
//
//  Created by Endeavour on 2021/6/6.
//

import UIKit

class loginView: UIViewController,UITextFieldDelegate {
    let textfield1=UITextField(frame: CGRect(x: 40, y: 490, width: 300, height: 50))
    let textfield = UITextField(frame: CGRect(x: 40, y: 420, width: 300, height: 50))
    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()

        let logo = UIImageView(image: UIImage(named: "Logo"))
        logo.frame = CGRect(x:125, y :170, width: 130,height: 130)
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.layer.masksToBounds = true
        self.view.addSubview(logo)
        
        let login = UIImageView(image: UIImage(named: "Login"))
        login.frame = CGRect(x:135 , y :320, width: 110,height: 40)
        //login.layer.cornerRadius = login.frame.size.width/2
        login.layer.masksToBounds = true
        self.view.addSubview(login)
        
        
        
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "手机号"
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
        textfield1.placeholder = "密码"
        textfield1.textAlignment = .center
        textfield1.textColor = UIColor.black
        textfield1.backgroundColor = UIColor.clear
        textfield1.layer.borderWidth = 2.0
        textfield1.layer.borderColor = UIColor.black.cgColor
        textfield1.layer.cornerRadius = 25
        textfield1.layer.masksToBounds = true
        textfield1.clearButtonMode = .always
        textfield1.isSecureTextEntry = true
        textfield1.keyboardType = UIKeyboardType.default
        textfield1.returnKeyType = UIReturnKeyType.done
        textfield1.delegate = self
        
        self.view.addSubview(textfield1)
        
        let loginbuttonp = UIButton(frame: CGRect(x: 40, y: 580, width: 300, height: 50))
        loginbuttonp.backgroundColor = UIColor(red: 243/255, green: 104/255,blue: 56/255, alpha: 1)
        loginbuttonp.setTitle("登陆 >", for: .normal)
        loginbuttonp.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        loginbuttonp.layer.cornerRadius = 25
        //loginbuttonp.layer.masksToBounds = true
        loginbuttonp.layer.shadowColor = UIColor.black.cgColor
        loginbuttonp.layer.shadowRadius = 2
        loginbuttonp.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginbuttonp.layer.shadowOpacity = 0.3
        self.view.addSubview(loginbuttonp)
        
        
        let registerbutton = UIButton(frame: CGRect(x: 40, y: 670, width: 300, height: 38))
        registerbutton.backgroundColor = UIColor.clear
        registerbutton.setTitle("账户注册 | 找回密码", for: .normal)
        registerbutton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 16)
        registerbutton.setTitleColor(UIColor.lightGray, for: .normal)
        registerbutton.layer.cornerRadius = 5
        registerbutton.layer.masksToBounds = true
        self.view.addSubview(registerbutton)
        registerbutton.addTarget(self, action: #selector(registFunc), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            textfield1.resignFirstResponder() //方法一
        textfield.resignFirstResponder()
            self.view.endEditing(true) //方法二
        }
    
    @objc func registFunc() {
        print("press")
        self.navigationController?.pushViewController(registView(),animated:true)
        //registView().modalPresentationStyle = UIModalPresentationStyle.automatic
        print("pr")
    }
        
        // Do any additional setup after loading the view.

    
}
