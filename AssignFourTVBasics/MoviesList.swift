//
//  MoviesList.swift
//  AssignFourTVBasics
//
//  Created by Vishal Sutar on 2022-12-05.
//

import Foundation
class MoviesList{
    var allMovies = [Movies]()
    
    init(){
        var movieNames = ["Eternals","Dune","No Time To Die","Last Night in Soho","Ron’s Done Wrong","Halloween Kills","Venom","Antlers","The Addams Family 2"]
        
        
        for _ in 1...9 {
            let movieNameIndex = Int.random(in: 0..<movieNames.count)
            
            
            allMovies.append(Movies(movieName: movieNames[movieNameIndex]))
        }
    }
    func deleteMovie(index: Int)
    {
        allMovies.remove(at: index)
    }
    func moveContact(from fromIndex:Int, to toIndex:Int)
    {
        let temp = allMovies[fromIndex]
        allMovies.remove(at: fromIndex)
        allMovies.insert(temp, at: toIndex)
    }
    func createMovie(movieName: String)-> Movies{
        let movie = Movies(movieName: movieName)
        allMovies.append(movie)
        return movie
    }
}

