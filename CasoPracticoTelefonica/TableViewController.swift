//
//  TableViewController.swift
//  CasoPracticoTelefonica
//
//  Created by user125877 on 26/4/17.
//  Copyright © 2017 user125877. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var datosPlist: NSArray = []
    var restauranteToDetalle: Restaurante = Restaurante()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let pathPlist = Bundle.main.path(forResource: "Restaurantes", ofType: "plist")
        //Cogemos los contenidos del fichero
        datosPlist = NSArray(contentsOfFile: pathPlist!)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    //Cambiamos el titulo a la seccion
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Restaurantes en Logroño"
    }
    
    //Cambiamos el estilo del titulo de la sección y le damos color
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor(displayP3Red: 0.4, green: 0.4, blue: 0.7, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datosPlist.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Creamos el objeto a enviar a la otra vista y realizamos el Segue
        let diccionarioRestaurante = datosPlist[indexPath.row] as! [String: AnyObject]
        print("Diccionario Restaurante nombre: \(diccionarioRestaurante["nombre"]!)")
        
        restauranteToDetalle.nombre = diccionarioRestaurante["nombre"]! as! String
        restauranteToDetalle.direccion = diccionarioRestaurante["direccion"]! as! String
        restauranteToDetalle.descripcion = diccionarioRestaurante["descripcion"] as! String
        restauranteToDetalle.nombre_imagen = diccionarioRestaurante["imagen"] as! String
        restauranteToDetalle.latitud = diccionarioRestaurante["latitud"] as! Double
        restauranteToDetalle.longitud = diccionarioRestaurante["longitud"] as! Double
        
        print("Restaurante nombre: \(restauranteToDetalle.nombre), latitud \(restauranteToDetalle.latitud)")
        
        performSegue(withIdentifier: "SegueToViewDetail", sender: nil)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRestaurante", for: indexPath)

        // Configure the cell...
        let diccionarioRestaurante = datosPlist[indexPath.row] as! [String: AnyObject]
        cell.textLabel?.text = diccionarioRestaurante["nombre"] as! String?
        cell.imageView?.image = UIImage.init(named: diccionarioRestaurante["imagen"] as! String)
        
        if indexPath.row%2==1{
            cell.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.8, blue: 1, alpha: 0.5)
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        if segue.identifier=="SegueToViewDetail"{
            let controller = segue.destination as! ViewController
            // Pass the selected object to the new view controller.
            controller.restauranteToDisplay = restauranteToDetalle
        }
    }
    

}
