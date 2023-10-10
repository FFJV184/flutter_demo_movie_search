import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_searcher/src/pages/movie_detail.dart';

import '../models/movie_model.dart';

class MovieTile extends StatelessWidget{
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white60), borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 25,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 66,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Text(movie.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.2),),
                      ),
                      Expanded(flex: 20, child: Text(DateFormat(DateFormat.YEAR_MONTH_DAY).format(movie.releaseDate), style: const TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 16
                      ),)),
                      Expanded(flex: 50, child: Text(movie.overview)),
                    ],
                  ),),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailComponent(movie),
          ),
        );;
      },
    );
  }
}