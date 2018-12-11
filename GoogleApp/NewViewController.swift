//
//  NewViewController.swift
//  GoogleApp
//
//  Created by Sagar on 24/11/18.
//  Copyright © 2018 Sagar. All rights reserved.
//

import UIKit
import UIKit
import youtube_ios_player_helper

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
extension NewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 4
        var widthRemainingForCellContent = collectionView.bounds.width
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
        }
        let cellWidth = widthRemainingForCellContent / cellsAcross
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
struct Values {
    static var reuseIdentifier = "cell"
    static var items = [String]()
    static var head = [String]()
    static var rupees = [String]()
    static var month = [String]()
    static var cellacross = Float()
}
class NewViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Values.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Values.reuseIdentifier, for: indexPath as IndexPath) as! socialcell
        cell.head.text! = Values.head[indexPath.row]
        cell.rupees.text = Values.rupees[indexPath.row]
        cell.month.text = Values.month[indexPath.row]
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? socialcell else {
            return
        }
        let id = cell.head.text!
        print(id)
        
    }
   
    
    @IBOutlet weak var abtVw: YTPlayerView!
    @IBOutlet weak var segmentedc: UISegmentedControl!
    @IBOutlet weak var cview: UICollectionView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var ytb: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        let videoId = "M3j3TDH1r8g"
        let videoId1 = "82MOK-BK-Mc"
        ytb.load(withVideoId: videoId)
        abtVw.load(withVideoId: videoId1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        Values.items = ["1","2","3","4"]
        Values.head = ["Freelancer Tour Operator","Safari Small Business","Safari Medium Business","Safari Large Business"]
        Values.rupees = ["$1320","$2100","$3900","$5700"]
        Values.month = ["for 6 Months","for 6 Months","for 6 Months","for 6 Months"]
       // Values.cellacross = 4
        DispatchQueue.main.async{
            self.cview.reloadData()
        }
    }
    @IBAction func sgmnted(_ sender: UISegmentedControl) {
        switch segmentedc.selectedSegmentIndex {
        case 0:
            Values.items = ["1","2","3","4"]
            print("case 0")
            Values.head = ["Freelancer Tour Operator","Safari Small Business","Safari Medium Business","Safari Large Business"]
            Values.rupees = ["$1320","$2100","$3900","$5700"]
            Values.month = ["for 6 Months","for 6 Months","for 6 Months","for 6 Months"]
           // Values.cellacross = 4
            DispatchQueue.main.async{
                self.cview.reloadData()
            }
        case 1:
           print("case 1")
           Values.items = ["1","2","3"]
           
           Values.head = ["Safari Small Business","Safari Medium Business","Safari Large Business"]
           Values.rupees = ["$599","$999","$1559"]
           Values.month = ["for 3 Months","for 3 Months","for 3 Months"]
          // Values.cellacross = 3
           DispatchQueue.main.async{
            self.cview.reloadData()
            }
        case 2:
            Values.items = ["1","2","3","4"]
            print("case 2")
            Values.head = ["Freelancer Tour Operator","Safari Small Business","Safari Medium Business","Safari Large Business"]
            Values.rupees = ["$1000","$1500","$2000","$3000"]
            Values.month = ["30 working Days","30 working Days","45 working Days","2 Months"]
           // Values.cellacross = 4
            DispatchQueue.main.async{
                self.cview.reloadData()
            }
        case 3:
            print("case 2")
            Values.items = ["1","2","3"]
            
            Values.head = ["Safari Small Business","Safari Medium Business","Safari Large Business"]
            Values.rupees = ["$900","$1200","$1500"]
            Values.month = ["3 Months","3 Months","3 Months"]
           // Values.cellacross = 3
            DispatchQueue.main.async{
                self.cview.reloadData()
            }
        case 4:
            print("case 2")
            Values.items = ["1","2"]
            
            Values.head = ["Safari Medium Business","Medium Business"]
            Values.rupees = ["$250","$450"]
            Values.month = ["2 Months","4 Months"]
           // Values.cellacross = 2
            DispatchQueue.main.async{
                self.cview.reloadData()
            }
        default:
            break;
        }
        
    }
}
