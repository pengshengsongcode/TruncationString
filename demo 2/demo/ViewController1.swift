//
//  ViewController1.swift
//  demo
//
//  Created by pengshengsong on 2021/7/5.
//

import UIKit

@objc class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let l = UILabel()
        l.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200);
        l.numberOfLines = 2
        l.textColor = .red
        l.backgroundColor = .green
        l.text = "已投稿[或刷卡缴费哈萨克家里或刷卡缴费哈萨克家里复活萨]等100个问题"
        view.addSubview(l)
        
        l.text = l.text?.stringByTruncating(at: "]", width: l.frame.size.width, numberOfLines: l.numberOfLines, font: l.font)
        
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
