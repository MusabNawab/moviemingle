import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moviemingle/constants/constants.dart';
import 'package:moviemingle/presentation/screens/DetailsScreen/widgets/custom_text.dart';
import 'package:moviemingle/presentation/screens/DetailsScreen/widgets/date_widget.dart';
import '../../../data/models/movies.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});
  final Movies movie;

  String? formattedDate(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateFormat.yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            movie.originalImg == null
                ? Image.asset(
                    Constants.noImg1,
                    height: 500,
                    fit: BoxFit.cover,
                  )
                : Hero(
                    tag: movie.id,
                    child: ClipRRect(
                      child: CachedNetworkImage(imageUrl: movie.originalImg!),
                    ),
                  ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: GoogleFonts.roboto(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(title: "Status: ", value: movie.status),
                    const SizedBox(
                      height: 5,
                    ),
                    movie.rating == null
                        ? const Text(
                            "No Ratings",
                            style: TextStyle(fontSize: 16),
                          )
                        : CustomText(
                            title: "Ratings: ",
                            value: "${movie.rating}",
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                        title: "Overall Score: ",
                        value: movie.score.toStringAsFixed(2)),
                    const SizedBox(
                      height: 8,
                    ),
                    DateWidget(
                      premiered: formattedDate(movie.premiered),
                      ended: formattedDate(movie.ended),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: "Languages: ", value: movie.languages),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Genre: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            ...movie.genres
                                .map((e) => Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: Chip(label: Text("$e "))))
                                .toList(),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Schedule: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            ...movie.schedule["days"]
                                .map((e) => Text(
                                      "$e ",
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                .toList(),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomText(
                            title: "Showtime: ", value: movie.schedule["time"]),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.link),
                      label: const Text("Url"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 50)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    HtmlWidget(movie.summary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
