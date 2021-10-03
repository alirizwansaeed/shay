import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shay/models/ad.dart';

class AdWidget extends StatelessWidget {
  final AdModel adModel;

  const AdWidget({
    Key? key,
    required this.adModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: .7,
            child: CachedNetworkImage(
              imageUrl: adModel.photos!['0'],
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                child: Text("No Image"),
                color: Colors.grey.shade200,
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: Text("Loading"),
                color: Colors.grey.shade200,
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: .3,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rs ${adModel.price}',
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    adModel.title!,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        adModel.city!,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        '${DateFormat().add_d().add_MMM().format(DateTime.fromMicrosecondsSinceEpoch(adModel.date!.microsecondsSinceEpoch))}',
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (adModel.isFeatured!)
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                color: Colors.red,
                child: Row(
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
