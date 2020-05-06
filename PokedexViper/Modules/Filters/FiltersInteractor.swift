//
//  FiltersInteractor.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class FiltersInteractor: FiltersInteractorInput {
    weak var ouput:FiltersInteractorOuput?
    
    func updateView() {
        let icos: [FiltersIcoEntity] = [
            .init(unselected: "Bug-Unselected" , selected: "Bug-Selected" ),
            .init(unselected: "Dark-Unselected", selected: "Dark-Selected"),
            .init(unselected: "Dragon-Unselected", selected: "Dragon-Selected"),
            .init(unselected: "Electric-Unselected", selected: "Electric-Selected"),
            .init(unselected: "Fairy-Unselected", selected: "Fairy-Selected"),
            .init(unselected: "Fighting-Unselected", selected:  "Fighting-Selected"),
            .init(unselected: "Fire-Unselected", selected: "Fire-Selected"),
            .init(unselected: "Flying-Unselected", selected: "Flying-Selected"),
            .init(unselected: "Ghost-Unselected", selected: "Ghost-Selected"),
            .init(unselected: "Grass-Unselected", selected: "Grass-Selected"),
            .init(unselected: "Ground-Unselected", selected: "Ground-Selected"),
            .init(unselected: "Ice-Unselected", selected: "Ice-Selected"),
            .init(unselected:  "Normal-Unselected", selected: "Normal-Selected"),
            .init(unselected: "Poison-Unselected", selected: "Poison-Selected"),
            .init(unselected: "Psychic-Unselected", selected: "Psychic-Selected"),
            .init(unselected: "Rock-Unselected", selected: "Rock-Selected"),
            .init(unselected: "Steel-Unselected", selected: "Steel-Selected"),
            .init(unselected: "Water-Unselected", selected: "Water-Selected"),
        ]
        self.ouput?.fetched(entites: [
            .init(name: "Types", icos: icos),
            .init(name: "Weaknesses", icos: icos)
            ]
        )
    }
}
