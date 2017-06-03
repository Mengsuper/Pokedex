//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by LI MENG on 2017-05-29.
//  Copyright © 2017 LI MENG. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var currentEvo: UIImageView!
    @IBOutlet weak var nextEvo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvo.image = img
        idLabel.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            // whatever we write will only be called after the network call is complete!
            self.updateUI()
            //print("Did arrive here?")
        }
    }
    
    func updateUI() {
        defenseLabel.text = pokemon.defense
        attackLabel.text = pokemon.attack
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvo.isHidden = true
        } else {
            nextEvo.isHidden = false
            nextEvo.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
