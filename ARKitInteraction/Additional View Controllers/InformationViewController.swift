//
//  InformationViewController.swift
//  ARKitInteraction
//
//  Created by admin on 2021/6/5.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CoreData
class InformationViewController: UIViewController,NSFetchedResultsControllerDelegate  {
    
    @IBOutlet var bottomView: UIView!
    var x:UILabel?
    var start_x: CGFloat = 0
    var start_y: CGFloat = 0
    var end_x: CGFloat = 0
    var end_y: CGFloat = 0
    let modules: [module] = [module(),module1,module2,module3,module4,module5,module6,module7,module8,module9,module10,module11,module12]
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    var focused = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            bottomView.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5) // 设置半透明颜色
        scroll.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0) // 设置半透明颜色
        contentView.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5) // 设置半透明颜色
        
        self.navigationController?.navigationBar.backgroundColor=UIColor.clear

    //    var viewcontrollers = self.navigationController?.viewControllers
    //    let last = viewcontrollers![viewcontrollers!.count - 1]
    //    viewcontrollers?.removeAll()
    //    viewcontrollers?.append(last)
    //    self.navigationController?.viewControllers = viewcontrollers!
    //    print("trainpage:\n")
    //    print(self.navigationController?.viewControllers.description)
    //    self.navigationController?.popToRootViewController(animated: true)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 21)]

        
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(change_view(sender:)))
        gesture.edges = .right
        self.view.addGestureRecognizer(gesture)
        
        
                self.view.backgroundColor = ZHFColor.white
        
            //去掉（重设）NavigationBar上的背景图片
            let item1 = UIBarButtonItem(image: UIImage(named: "历史记录")?.reSizeImage(reSize: CGSize(width: 25, height: 10)), style: .plain, target: self, action: #selector(click1))
            let item2 = UIBarButtonItem(image: UIImage(named: "设")?.reSizeImage(reSize: CGSize(width: 25, height: 25)), style: .plain, target: self, action: #selector(tosetting))
        
    //    item2.target=self
    //    item2.action=#selector(tosetting)
        
            self.navigationItem.leftBarButtonItems = [item1]
            self.navigationItem.rightBarButtonItems = [item2]
            self.navigationController?.navigationBar.tintColor=UIColor.gray
        
        
        
    //    生成[1,12]之间的随机整数
            self.focused = Int.randomIntNumber(range: Range(NSRange(location: 1, length: 12))!)
        //    设置卡片的堆叠效果
            let view2 = genarate_card(mod: modules[self.focused % 12 + 1], frame: CGRect(x: 0, y: 124 + 6, width: 414, height: 216))
            contentView.addSubview(view2)
            let view1 = genarate_card(mod: modules[self.focused], frame: CGRect(x: 0, y: 124, width: 414 ,height: 216))
            contentView.addSubview(view1)
            contentView.removeFromSuperview()
            view1.tag = self.focused
            view2.tag = self.focused % 12 + 1
            
            self.scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 3)

            self.scroll.addSubview(contentView)
            
            
            var index = 100
            
    }
    @objc func tosetting(){
        let con = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "settingboard")
        self.navigationController?.pushViewController(con, animated: true)
    }
    @objc func change_view(sender: UIScreenEdgePanGestureRecognizer){
        if sender.state == .ended{
            self.tabBarController?.selectedIndex = 1
        }
    }
    func genarate_card(mod: module,frame: CGRect) -> UIView{
        let view = UIView.init(frame: frame)
        let back = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        back.image = UIImage.init(named: "组 1290")
        view.addSubview(back)
        let title = UILabel(frame: CGRect(x: 51, y: 38, width: 150, height: 36))
        title.text = mod.title
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = UIColor.white
        view.addSubview(title)
        
        let title2 = UILabel(frame: CGRect(x: 51, y: 84, width: 180, height: 21))
        title2.text = ""
        title2.font = UIFont.systemFont(ofSize: 17)
        title2.textColor = UIColor.white
        view.addSubview(title2)
        
//        let view1 = UIView(frame: CGRect(x: 42, y: 113, width: 70, height: 34))
//        let t1 = UIImageView.init(frame: CGRect(x: 8, y: 9, width: 18, height: 18))
//        t1.image = UIImage(named: "组 1233")
//        t1.contentMode = .scaleAspectFit
//        view1.addSubview(t1)
//        let m1 = UILabel(frame: CGRect(x: 27, y: 7, width: 46, height: 20))
//        m1.text = mod.word1
//        m1.font = UIFont.boldSystemFont(ofSize: 18)
//        m1.textColor = UIColor.white
//        view1.addSubview(m1)
//        view.addSubview(view1)
//
//        let view2 = UIView(frame: CGRect(x: 42, y: 145, width: 70, height: 34))
//        let t2 = UIImageView.init(frame: CGRect(x: 8, y: 9, width: 18, height: 18))
//        t2.image = UIImage(named: "组 1233")
//        t2.contentMode = .scaleAspectFit
//        view2.addSubview(t2)
//        let m2 = UILabel(frame: CGRect(x: 27, y: 7, width: 46, height: 20))
//        m2.text = mod.word2
//        m2.font = UIFont.boldSystemFont(ofSize: 18)
//        m2.textColor = UIColor.white
//        view2.addSubview(m2)
//        view.addSubview(view2)
//
//        let view3 = UIView(frame: CGRect(x: 119, y: 113, width: 70, height: 34))
//        let t3 = UIImageView.init(frame: CGRect(x: 8, y: 9, width: 18, height: 18))
//        t3.image = UIImage(named: "组 1233")
//        t3.contentMode = .scaleAspectFit
//        view3.addSubview(t3)
//        let m3 = UILabel(frame: CGRect(x: 27, y: 7, width: 46, height: 20))
//        m3.text = mod.word3
//        m3.font = UIFont.boldSystemFont(ofSize: 18)
//        m3.textColor = UIColor.white
//        view3.addSubview(m3)
//        view.addSubview(view3)
//
//        let view4 = UIView(frame: CGRect(x: 119, y: 145, width: 70, height: 34))
//        let t4 = UIImageView.init(frame: CGRect(x: 8, y: 9, width: 18, height: 18))
//        t4.image = UIImage(named: "组 1233")
//        t4.contentMode = .scaleAspectFit
//        view4.addSubview(t4)
//        let m4 = UILabel(frame: CGRect(x: 27, y: 7, width: 46, height: 20))
//        m4.text = mod.word4
//        m4.font = UIFont.boldSystemFont(ofSize: 18)
//        m4.textColor = UIColor.white
//        view4.addSubview(m4)
//        view.addSubview(view4)
//
        let button = UIButton(frame: CGRect(x: 240, y: 97, width: 140, height: 68))
        button.setImage(UIImage(named: ""), for: .normal)
        button.contentMode = .center
        view.addSubview(button)
        
        let drag_down = UIPanGestureRecognizer(target: self, action: #selector(switch_card(sender:)))
        view.addGestureRecognizer(drag_down)

        return view
    }

    
//    卡片的切换
    @objc func switch_card(sender: UIPanGestureRecognizer){
        let tag = self.focused
        let view = self.view.viewWithTag(tag)!
        let Point = sender.location(in: self.contentView);
        if sender.state == .began{
            start_x = Point.x
            start_y = Point.y
            let transform = view.transform
            view.transform = transform.scaledBy(x: 0.95, y: 0.95)
        }
        else if sender.state == .changed{
            view.center = CGPoint(x: Point.x, y: Point.y)
            
        }
        else if sender.state == .ended{
            end_x = Point.x
            end_y = Point.y
            let valid_code = check_valid()
            if valid_code == 0{
                let transform = view.transform
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                    view.transform = transform.scaledBy(x: 20/19, y: 20/19)
                }, completion: {
                    (finish) in
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        view.frame = CGRect(x: 0, y: 124, width: 414, height: 216)
                        
                    }, completion: {
                        (finish) in
                    })
                })
            }
            else if valid_code > 0{
                UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
                    if valid_code == 1{
                        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY - 100, width: view.frame.width, height: view.frame.height)
                    }
                    else if valid_code == 2{
                        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY + 100, width: view.frame.width, height: view.frame.height)
                    }
                    else if valid_code == 3{
                        view.frame = CGRect(x: view.frame.minX - 420, y: view.frame.minY , width: view.frame.width, height: view.frame.height)
                    }
                    else if valid_code == 4{
                        view.frame = CGRect(x: view.frame.minX + 420, y: view.frame.minY , width: view.frame.width, height: view.frame.height)
                    }
                }, completion: {
                    (finish) in
                    print("animation out")
                    view.removeFromSuperview()
                    let back_view = self.genarate_card(mod: self.modules[(self.focused+1) % 12 + 1],frame: CGRect(x: 0, y: 124 + 6, width: 414, height: 300))
                    back_view.tag = (self.focused+1) % 12 + 1
                    
                    let nexttag = (self.focused) % 12 + 1
                    
                    let nextview = self.view.viewWithTag(nexttag)!
                    print("nexttag: \(nexttag)")
                    self.contentView.insertSubview(back_view, belowSubview: nextview)
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        nextview.frame = CGRect(x: 0, y: 124, width: 414, height: 216)
                    }, completion: nil)
                    
                    self.focused = nexttag
                })
            }
        }
        
    }
    
//    检测收拾移动是否合法
    func check_valid() -> Int{
//        向上滑动
        if end_y - start_y < -50 && end_x - start_x > -100 && end_x - start_x < 100{
            return 1
        }
//        向下滑动
        if end_y - start_y > 50 && end_x - start_x > -100 && end_x - start_x < 100{
            return 2
        }
//        向左滑动
        if end_x - start_x < -100 && end_y - start_y > -100 && end_y - start_y < 100{
            return 3
        }
//        向右滑动
        if end_x - start_x > 100 && end_y - start_y > -100 && end_y - start_y < 100{
            return 4
        }
        return 0
    }
  
    override func viewWillAppear(_ animated: Bool){
//        self.scroll!.contentSize = CGSize(width: self.view.frame.width ,height: self.view.frame.height*3)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
      self.navigationController?.navigationBar.shadowImage = UIImage()
      //去掉（重设）NavigationBar上的一条线
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      //去掉（重设）NavigationBar上的背景图片
      self.navigationController?.navigationBar.tintColor=UIColor.gray
        
    }
//    更新训练次数信息
    
    
    override func viewDidAppear(_ animated: Bool) {
//        self.scroll!.contentSize = CGSize(width: self.view.frame.width ,height: self.view.frame.height * 3)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
      self.navigationController?.navigationBar.shadowImage = UIImage()
      //去掉（重设）NavigationBar上的一条线
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      //去掉（重设）NavigationBar上的背景图片
      self.navigationController?.navigationBar.tintColor=UIColor.gray
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func click1(){
        let con = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "weekhistoryboard") as UIViewController;
        self.navigationController?.pushViewController(con, animated: true)
    }
    @objc func click2(){
        print("click")
    }
}
public extension Int {
    /*这是一个内置函数
     lower : 内置为 0，可根据自己要获取的随机数进行修改。
     upper : 内置为 UInt32.max 的最大值，这里防止转化越界，造成的崩溃。
     返回的结果： [lower,upper) 之间的半开半闭区间的数。
     */
    public static func randomIntNumber(lower: Int = 0,upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }
    /**
     生成某个区间的随机数
     */
    public static func randomIntNumber(range: Range<Int>) -> Int {
        return randomIntNumber(lower: range.lowerBound, upper: range.upperBound)
    }
}
