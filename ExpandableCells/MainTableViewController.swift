//
//  MainTableViewController.swift
//  ExpandableCells
//
//  Created by cice on 1/3/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    
    let imagenes = ["perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1","perro-gordo1"]
    
    var expandedRows = Set<Int>() //Set que detecte que celdas están abiertas un set porque no se pueden repetir los elementos
 
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.myTableView.rowHeight = UITableViewAutomaticDimension //Actualiza el tamaño de la celda al contenido de dentro
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagenes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as! ExpandableTableViewCell
        cell.myImageView.image = UIImage(named: imagenes[indexPath.row])
        cell.isExpanded = self.expandedRows.contains(indexPath.row)//Comprobamos si en nuestro expanded rows si está incluida la celda
        cell.selectionStyle = UITableViewCellSelectionStyle.none //para que no aparezca seleccionado
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260.0 //Le dice mas o menos la altura que debe tener
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableTableViewCell //Comprobamos si la celda es de Expandabletableviewcell
            else {
                return}
        switch cell.isExpanded { //Comprobamos si esta expandida
        case true:
            self.expandedRows.remove(indexPath.row) //Metemos la celd en el set
        case false:
            self.expandedRows.insert(indexPath.row)//La eliminamos de cell
        }
        
        cell.isExpanded = !cell.isExpanded //Cambiamos la propiedad
        self.tableView.beginUpdates() //recargamos la celda
        self.tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableTableViewCell
            else {
                return}
        self.expandedRows.remove(indexPath.row)
        cell.isExpanded = false
        ///RECARGAMOS LA CELDA
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        ///
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
