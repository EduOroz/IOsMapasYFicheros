//
//  ViewController.swift
//  CasoPracticoTelefonica
//
//  Created by user125877 on 26/4/17.
//  Copyright © 2017 user125877. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbDescripcion: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var restauranteToDisplay: Restaurante!
    //Definimos un radio de lo que veremos y una localizacion inicial
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbNombre.text = restauranteToDisplay.nombre
        //Para mostrar la descripcion intentaremos que se muestren varias lineas dado que es un texto mas amplio
        lbDescripcion.text = restauranteToDisplay.descripcion
        lbDescripcion.numberOfLines = 0
        lbDescripcion.lineBreakMode = .byWordWrapping
        
        let restaurantLocation = CLLocation(latitude: restauranteToDisplay.latitud, longitude: restauranteToDisplay.longitud)
        
        centerMapOnLocation(location: restaurantLocation)
        //show artwork on map, la chincheta que definimos en una clase aparte
        let artwork = Artwork(title: restauranteToDisplay.nombre,
                              locationName: restauranteToDisplay.direccion,
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: restauranteToDisplay.latitud, longitude: restauranteToDisplay.longitud))
        mapView.addAnnotation(artwork)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation (location: CLLocation){
        //Centramos el mapa según unas coordenadas y una distancia de radio de lo que veremos
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }



}

