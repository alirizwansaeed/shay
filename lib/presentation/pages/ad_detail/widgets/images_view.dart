import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shay/models/models.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({
    Key? key,
    required this.adModel,
  }) : super(key: key);

  final AdModel adModel;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: adModel.photos?.length,
      itemBuilder: (context, index) => Stack(
        fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.black54,
            child: CachedNetworkImage(
              imageUrl: adModel.photos!.values.toList()[index],
              placeholder: (context, url) => Center(
                  child:
                      Text('Loading', style: TextStyle(color: Colors.white))),
              errorWidget: (context, url, error) => Center(
                  child:
                      Text('No Image', style: TextStyle(color: Colors.white))),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Text('${index + 1}/${adModel.photos?.length}',
                    style: TextStyle(color: Colors.white))),
          ),
          if (adModel.isFeatured!)
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(6),
                color: Colors.red,
                child: Text(
                  'Featured',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
