// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
contract learnStructs {
    
 struct Movie {
     
     string title;
     string director;
     uint movie_id;
 }

    Movie movie;
    Movie comedy;
    

    function setMovie() public {
       comedy = Movie('Zoolander', 'Ben Stiller', 4);
    }

    function getMovieId() public view returns(uint) {
        return comedy.movie_id;
    }

}