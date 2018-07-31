//
//  CoachingAdminViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 12/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit
import CoreData


class CoachingAdminViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageProcessingQueue = DispatchQueue(label: "imageProcessingQueue", attributes: DispatchQueue.Attributes.concurrent)
    
    /// A dispatch queue for the Core Data managed context
    let coreDataQueue = DispatchQueue(label: "coreDataQueue")
    
    /// The Core Data managed context
    var managedContext : NSManagedObjectContext?
    
    
  
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBAction func changeBackgroundImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var orangeView3: UIView!
    @IBOutlet weak var myCollectionView3: UICollectionView!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    @IBOutlet weak var studyAcreLabel3: UILabel!
    
    let array1C3: [String] = ["waTeachers","waStudents","waBatches","waSubstitute","waStudent Fee","waStaff Salary"]
    let array2C3: [String] = ["Teachers","Students","Batches","Extra Classes","Student Fee", "Staff Salary"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        studyAcreLabel3.font = studyAcreLabel3.font.withSize(UIScreen.main.bounds.height/24.53)
        btnMenuButton.target = revealViewController()
        btnMenuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
        
        var itemSize2: CGFloat
        
        if UIScreen.main.bounds.height == 568 {
            itemSize2 = UIScreen.main.bounds.width/2.5 - UIScreen.main.bounds.height/490.6666
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15)
            layout2.itemSize = CGSize(width: itemSize2 + 8, height: itemSize2*5/6)
            layout2.minimumInteritemSpacing = 0
            layout2.minimumLineSpacing = 15
            myCollectionView3.collectionViewLayout = layout2
            
            //let gradient = CAGradientLayer()
            
            /*gradient.frame = myCollectionViewC1.bounds
             gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
             
             myCollectionViewC1.layer.insertSublayer(gradient, at: 0)
             */
            self.myCollectionView3.backgroundColor = UIColor.clear
            
            let gradient = CAGradientLayer()
            gradient.frame = self.view.bounds
            gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            //gradient.locations = [0.4, 0.5]
            self.view.layer.insertSublayer(gradient, at: 0)
            let gradient2 = CAGradientLayer()
            gradient2.frame = self.orangeView3.bounds
            gradient2.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            
            self.orangeView3.layer.insertSublayer(gradient2, at: 0)
            
        }
            
        else {
            itemSize2 = UIScreen.main.bounds.width/2.5
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsetsMake(22, 22, 22, 22)
            layout2.itemSize = CGSize(width: itemSize2 + 8, height: itemSize2*5/6)
            layout2.minimumInteritemSpacing = 0
            layout2.minimumLineSpacing = 18
            myCollectionView3.collectionViewLayout = layout2
            
            self.myCollectionView3.backgroundColor = UIColor.clear
            
            let gradient = CAGradientLayer()
            gradient.frame = self.view.bounds
            gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            //gradient.locations = [0.4, 0.5]
            self.view.layer.insertSublayer(gradient, at: 0)
            let gradient2 = CAGradientLayer()
            gradient2.frame = self.orangeView3.bounds
            gradient2.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            
            self.orangeView3.layer.insertSublayer(gradient2, at: 0)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array1C3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = myCollectionView3.dequeueReusableCell(withReuseIdentifier: "cellW3", for: indexPath ) as! myCell2
        cell2.myImage2.image = UIImage(named: array1C3[indexPath.row])
        
        var frm: CGRect = cell2.myImage2.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell2.myImage2.frame = frm
        
        cell2.myLabel2.text = "\(array2C3[indexPath.row])"
        cell2.myLabel2.textColor = UIColor.white
        cell2.myLabel2.font = cell2.myLabel2.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell2.layer.borderWidth = 0
        return cell2
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


/*extension CoachingAdminViewController {
    func coreDataSetup() {
        dispatch_sync(saveQueue) {
            self.managedContext = AppDelegate().managedObjectContext
        }
    }
}*/
