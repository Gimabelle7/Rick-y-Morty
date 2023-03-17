//
//  RickYMortyViewController.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 8/10/22.
//

import UIKit

class RickYMortyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
   // @IBOutlet weak var animated: LOTAnimationView!
    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var searchEpisodios: UISearchBar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tablaRicky: UITableView!
    
    var resultRickyMorty : [ResultRickYMorty] = []
    
    var resultRickyMortyFilter : [ResultRickYMorty] = []
    
    var metodos = Metodos()
    
    //
    let searchController = UISearchController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Episodios"// navigation title
        // view.backgroundColor = .systemPink //
        configureItems() // items que tiene mi button
      //  print(" viewDidDisapper\(self.resultRickyMorty)")
        obtenerHyF (ciclo: "viewDidLoad") //fyh did apper
                
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "backImgs"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(menuButtonTapped))

        navigationController?.navigationBar.tintColor = .label // para darle color
     
        tablaRicky.dataSource = self
        tablaRicky.delegate = self
        
        fetchData()
        RickYMortVM.retrieveData { rickymorty in // consumir un servicio api
        self.resultRickyMorty = rickymorty?.results ?? []
            
            /// fatltaba esto
           print("rickymorty:\(String(describing: self.resultRickyMorty[0].characters?[0]))")
            
            self.tablaRicky.register(UINib.init(nibName: "ContenidoTVC", bundle: .main), forCellReuseIdentifier: "ContenidoTVC")
            // llamamos a nuestros identificadores
            
            self.tablaRicky.reloadData() // nuestro reload data para que aparezca
            
            self.resultRickyMortyFilter =  rickymorty?.results ?? [] // creamos esto para nuestro buscador Search

        }
        
        searchEpisodios.delegate = self

    }
    
  /*  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indicator.isHidden = false
        indicator.startAnimating()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do
        {
            sleep(1)
        }
        // stop activicty indicator
        indicator.isHidden = true
        indicator.stopAnimating()
    } */
   
    func configureItems () {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onBack(_:)))
    }
    
    func fetchData() {
        RickYMortVM.retrieveData { rickymorty in // consumir un servicio api
            self.resultRickyMorty = rickymorty?.results ?? []
            self.resultRickyMortyFilter =  rickymorty?.results ?? [] // para crear nuestro search
            
            
            self.tablaRicky.reloadData() // nuestro reload data para que aparezca
        }
    }
    
    func obtenerHyF (ciclo: String) { // codigo para obtener fecha y hora
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        print("se ejecuto en:\(ciclo) a las: \(dateString)")
        
    }
    
    @objc fileprivate func menuButtonTapped() {
            if let leftBarButtonItem = navigationItem.leftBarButtonItem {
                leftBarButtonItem.target = self
                leftBarButtonItem.action = #selector(onBack(_:))

            }

    }
    @IBAction func onBack(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
        
        print("funciona")
        
        // codigo para ir de una pantalla a otra
        let vc =
        // codigo para ir de una pantalla a otra
        storyboard?.instantiateViewController(withIdentifier: "idPrueba") as! PruebaVC
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController( vc, animated: true)

    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultRickyMorty.count // muestre las psiciones
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaRicky.dequeueReusableCell(withIdentifier: "ContenidoTVC", for: indexPath) as! ContenidoTVC
        let resultMorty : ResultRickYMorty?
        // variables que contiene ResultRM
        let index = indexPath.row // variable index que coontiene indexpath
        resultMorty = resultRickyMorty[index] //la variable antes mencionada result va ser igual a result RM que es nuestra Struct de nuestro modelo
        cell.configureContenidoTVC(with: resultMorty) // aqui llamamos a nuestro configure de nuestro TVC que va mostrar lo que esta dentro de nuetsro modelo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // para ir de una pantalla a otra mediante codigo
        
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // para ir de una pantalla a otra
        if let destination = segue.destination as? DescripcionViewController {
            destination.rickYMorty = resultRickyMorty[(tablaRicky.indexPathForSelectedRow?.row)!]
        }
    }
}

extension RickYMortyViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.resultRickyMorty = self.resultRickyMortyFilter
            self.tablaRicky.reloadData()
            return
        }
        self.resultRickyMorty = self.resultRickyMortyFilter.filter({ (item) -> Bool in
            
            return  (metodos.ReplaceChar( data: item.name!, searchText: searchText) || metodos.ReplaceChar(data: item.episode!, searchText: searchText))
        })
        self.tablaRicky.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

extension RickYMortyViewController  {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        obtenerHyF(ciclo: "viewWillAppear")
        //print("1. viewWillAppear")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       // obtenerHyF(ciclo: "viewWillLayoutSubviews")
       // print("2.viewWillLayoutSubviews ")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //obtenerHyF(ciclo: "viewDidLayoutSubviews")
       // print("3. viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        obtenerHyF(ciclo: "viewDidAppear")
        //print("4. viewDidAppear ")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        obtenerHyF(ciclo: "viewWillDisappear")
        //print("5. viewWillDisappear ")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        obtenerHyF(ciclo: "viewDidDisappear")
        //print("6. viewDidDisapper")
    }
    
    
    
}
