//
//  MovieDetailViewController.swift
//  AssignFourTVBasics
//
//  Created by Vishal Sutar on 2022-12-05.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieNameTextField: UITextField!
    
    var movie: Movies!
    var movieList : MoviesList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if movie != nil {
            movieNameTextField.text = movie.movieName
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if movie != nil{
            movie.movieName = movieNameTextField.text ?? ""
        }
        else{
            if movieNameTextField.text != "" {
                movieList.createMovie(movieName: movieNameTextField.text!)
            }
        }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
