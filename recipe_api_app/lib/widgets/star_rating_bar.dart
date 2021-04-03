import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRatingBar extends StatelessWidget {
  const StarRatingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SmoothStarRating(
            size: 20,
            borderColor: Colors.orange,
            color: Colors.orange,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '4.7',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print('review open');
            },
            child: Text(
              '(200 Reviews)',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
