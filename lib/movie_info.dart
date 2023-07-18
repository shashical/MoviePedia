import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final Map<String,dynamic> movie;
  InfoScreen({required this.movie,
     Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 8, 151),
        centerTitle: true,
        title: (widget.movie['title']==null?Text("Name NA"):Text("${widget.movie['title']}")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.3,maxWidth: MediaQuery.of(context).size.height*0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Flexible(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage((widget.movie['poster_path'] !=
                                              null)
                                          ? "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.movie['poster_path']}"
                                          : "https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg"),
                                    ),
                                  ),],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (widget.movie['title']==null?"NA":"${widget.movie['title']}"),
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Released On: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['release_date']==null?"NA":"${widget.movie['release_date']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Rating: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['vote_average']==null?"NA":"${widget.movie['vote_average']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.people,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Rated by: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['vote_count']==null?"NA":"${widget.movie['vote_count']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.trending_up,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Popularity: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['popularity']==null?"NA":"${widget.movie['popularity']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.man,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Adult Film: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['adult']==null?"NA":(widget.movie['adult']==true?"Yes":"No")),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.pinkAccent),
            ),
            SizedBox(height: 8),
            Text(
              (widget.movie['overview']==null?"NA":"${widget.movie['overview']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final double width;
  final double height;

  PlaceholderWidget(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
    );
  }
}