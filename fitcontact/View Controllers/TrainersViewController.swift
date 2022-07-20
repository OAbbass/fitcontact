//
//  TrainersViewController.swift
//  fitcontact
//
//  Created by CSE on 19/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import AVKit
import FirebaseDatabase
import Foundation


class TrainersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

   // var arrayTrainers = [trainersData]()
   // var ref = DatabaseReference.init()
    let ref = Database.database().reference()
    var items: [trainersData] = []
    @IBOutlet weak var TableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ref = Database.database().reference().child("users")
//
//        ref.observe(DataEventType.value, with: {(snapshot) in
//            if snapshot.childrenCount > 0 {
//                self.arrayTrainers.removeAll()
//                for trainer in snapshot.children.allObjects as! [DataSnapshot] {
//                    let object = trainer.value as? [String: AnyObject]
//                    let firstname  =  object?["firstname"]
//                    let lastname = object?["lastname"]
//                    let age = object?["age"]
//                    let gender = object?["gender"]
//                    let type = object?["type"]
//
//                    let trainer = trainersData(firstName: firstname as! String, lastName: lastname as! String, age: age as! String, gender: gender as! String, type: type as! String)
////                    if type as! String == "Trainer"{
////                        self.arrayTrainers.append(trainer)
////                    }
//                    self.arrayTrainers.append(trainer)
//                    self.TableView.reloadData()
//
//                }
//            }
//        })
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for:indexPath)
        let object = items[indexPath.row]
        cell.textLabel?.text = object.firstName
        return cell
       // let trainer: trainersData
        //trainer = arrayTrainers[indexPath.row]
        //cell.trainerLabel.text = trainer.firstName
        //return cell
    }
    
   

}

//class TrainersViewController: UIViewController, UICollectionViewDelegate {
//
//    enum Section {
//        case main
//    }
//
//    var data: UICollectionViewDiffableDataSource<Section,Int>!
//    var collectionView: UICollectionView!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        viewCongiguration()
//
//        dataConfiguration()
//    }
//
//    func layout()-> UICollectionViewCompositionalLayout{
//        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        return UICollectionViewCompositionalLayout.list(using: configuration)
//    }
//
//    func viewCongiguration() {
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout())
//        view.addSubview(collectionView)
//        collectionView.delegate = self
//
//    }
//
//    func dataConfiguration() {
//        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int>{
//            (cell, indexPath, item) in
//            var trainerData = cell.defaultContentConfiguration()
//            trainerData.text = "Trainer 1"
//            cell.contentConfiguration = trainerData
//        }
//        data = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView){
//            (collectionView: UICollectionView, indexPath:IndexPath, identifier: Int) in
//            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
//        }
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(Array(1...10))
//        data.apply(snapshot, animatingDifferences: true)
//    }
//
//
//}
//
//extension ViewController: UICollectionViewDelegate {
//
//}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
