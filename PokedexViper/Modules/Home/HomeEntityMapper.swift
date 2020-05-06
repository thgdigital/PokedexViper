//
//  HomeEntityMapper.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomeEntityMapper {
    
    static var lastIndex = 0
    
    static func mappingHome(model: HomeModel, kalos: Kalos) -> HomeEntity {
        let entity = HomeEntity()
        entity.count = model.count
        entity.next = model.next ?? ""
        entity.previous = model.previous ?? ""
        entity.results = model.results.enumerated().map({mappingPokemonHome(pokemon: $0.element, index: $0.offset, kalos: kalos) })
        lastIndex = lastIndex + entity.results.count
        return entity
    }
    
    static func generations(pokemons: [GenerationPokemonEntity], kalos: Kalos) -> HomeEntity {
        let entity = HomeEntity()
        entity.results = pokemons.map({ mappingGenerationsPokemons(pokemon: $0, kalos: kalos)}).sorted(by: { $0.idPokemon < $1.idPokemon })
        return entity
    }
    
    
    static func mappingGenerationsPokemons(pokemon: GenerationPokemonEntity, kalos: Kalos) -> PokemonHomeEntity {
        let kalo = kalos.first(where: { $0.slug == pokemon.name })
        let entity = PokemonHomeEntity()
        entity.idPokemon = kalo?.number ?? ""
        entity.name = pokemon.name
        entity.url = pokemon.url
        entity.image = kalo?.thumbnailImage ?? ""
        entity.type = kalo?.type.map({ $0.rawValue }) ?? []
        
        return entity
    }
    
    static func mappingImage(index: Int) -> String {
        let idPokemon = index + lastIndex + 1
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(idPokemon).png"
    }
    
    static func mappingPokemonHome(pokemon: HomeModel.PokemonHome, index: Int, kalos: Kalos) -> PokemonHomeEntity {
        let kalo = kalos.first(where: { $0.id == index + lastIndex + 1 })
        let entity = PokemonHomeEntity()
        entity.idPokemon = kalo?.number ?? ""
        entity.name = pokemon.name
        entity.url = pokemon.url
        entity.image = kalo?.thumbnailImage ?? ""
        entity.type = kalo?.type.map({ $0.rawValue }) ?? []
        return entity
    }
    
    static func pokemon(pokemon: Kalo) -> PokemonHomeEntity {
        let entity = PokemonHomeEntity()
        entity.idPokemon = pokemon.number
        entity.name = pokemon.name
        entity.url = "https://pokeapi.co/api/v2/pokemon/\(pokemon.id)"
        entity.image = pokemon.thumbnailImage
        entity.type = pokemon.type.map({ $0.rawValue })
        return entity
    }
}
