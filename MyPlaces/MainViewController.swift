//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Pavel on 27.10.2023.
//

import UIKit

class MainViewController: UITableViewController {
    
//    var places = Place.getPlaces()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return places.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//        let place = places[indexPath.row]
//        cell.nameLabel.text = place.name
//        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!)
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        if place.image == nil {
//            cell.imageOfPlace.image = UIImage(named: place.restaurantImage!)
//        }
//        else {
//            cell.imageOfPlace.image = place.image
//        }
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
//        cell.imageOfPlace.clipsToBounds = true
//        return cell
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
        newPlaceVC.saveNewPLace()
       // places.append(newPlaceVC.newPlace)
        tableView.reloadData()
    }
    
}
