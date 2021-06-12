//
//  aboutItem.swift
//  relo
//
//  Created by Endeavour on 2021/6/6.
//

import UIKit

class aboutItem: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        self.view.backgroundColor = UIColor.white
        
        let logo = UIImageView(image: UIImage(named: "产品1"))
        logo.frame = CGRect(x:0 , y :0, width: 414,height: 448)
        //logo.layer.cornerRadius = logo.frame.size.width/2
        logo.layer.masksToBounds = true
        self.view.addSubview(logo)

        let arbtn = UIImageView( image: UIImage(named: "ARcmo"))
        arbtn.frame = CGRect(x:320,y:340,width: 50,height: 50)
//        arbtn.layer.masksToBounds = true
        arbtn.layer.cornerRadius = 19
        self.view.addSubview(arbtn)
        
        let colorbtn1 = UIButton(frame: CGRect(x:350,y:216,width: 20,height: 20))
        colorbtn1.setBackgroundImage(UIImage(named: "Ellipse 5"), for: UIControl.State.normal)
        self.view.addSubview(colorbtn1)
        
        let colorbtn2 = UIButton(frame: CGRect(x:350,y:250,width: 16,height: 16))
        colorbtn2.setBackgroundImage(UIImage(named: "Ellipse 6"), for: UIControl.State.normal)
        self.view.addSubview(colorbtn2)
        
        let colorbtn3 = UIButton(frame: CGRect(x:350,y:280,width: 16,height: 16))
        colorbtn3.setBackgroundImage(UIImage(named: "Ellipse 7"), for: UIControl.State.normal)
        self.view.addSubview(colorbtn3)
        
        let colorbtn4 = UIButton(frame: CGRect(x:350,y:310,width: 16,height: 16))
        colorbtn4.setBackgroundImage(UIImage(named: "Ellipse 8"), for: UIControl.State.normal)
        self.view.addSubview(colorbtn4)

        let chooselook = UIImageView(image: UIImage(named: "Vector-2"))
        chooselook.frame = CGRect(x:180 , y :390, width: 40,height: 8)
        chooselook.layer.masksToBounds = true
        self.view.addSubview(chooselook)
        
        let textview = UITextView(frame:CGRect(x:0, y:420, width:380, height:400))
//        textview.layer.borderWidth = 1  //边框粗细
//        textview.layer.borderColor = UIColor.gray.cgColor //边框颜色
        textview.layer.cornerRadius = 35
        textview.isEditable = false
        self.view.addSubview(textview)
        
        let details = UIImageView(image: UIImage(named: "细节评价"))
        details.frame = CGRect(x:30 , y :440, width: 137,height: 35)
        //logo.layer.cornerRadius = logo.frame.size.width/2
        details.layer.masksToBounds = true
        self.view.addSubview(details)
        
        
        let maowangshouyinjidetails = UIImageView(image: UIImage(named: "猫王收音机详情"))
        maowangshouyinjidetails.frame = CGRect(x:18 , y :480, width: 350,height: 320)
        //logo.layer.cornerRadius = logo.frame.size.width/2
        maowangshouyinjidetails.layer.masksToBounds = true
        self.view.addSubview(maowangshouyinjidetails)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
