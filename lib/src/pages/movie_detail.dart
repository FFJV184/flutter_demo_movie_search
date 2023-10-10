import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../models/movie_model.dart';

class MovieDetailComponent extends StatelessWidget {
  final Movie movie;

  const MovieDetailComponent(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFFFFF), elevation: 0, leading: IconButton(
        color: const Color(0xFF3E4448),
    icon: const Icon(Icons.arrow_back_ios_new),
    iconSize: 30,
    onPressed: () => {
    Navigator.of(context).pop()
    },
    )),
      body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}', height: 300,),
          ),
          // Movie Title
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: CircularPercentIndicator(
                radius: 35,
                lineWidth: 8.0,
                percent: movie.voteAverage / 10,
                center: Text(movie.voteAverage.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                progressColor: Colors.green,
              ),
            ),
          ],),
          const SizedBox(height: 10),

          // Movie Release Date
          Text(
            'Release Date: ${DateFormat(DateFormat.YEAR_MONTH_DAY).format(movie.releaseDate)}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),

          // Movie Overview
          const Text(
            'Overview:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            movie.overview,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),);
  }
}





