import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import 'package:shay/models/ad.dart';

class AdsGridView extends StatelessWidget {
  final List<AdModel> adModellist;
  final VoidCallback onTap;
  const AdsGridView({
    Key? key,
    required this.adModellist,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.5),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: adModellist.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: .7,
                child: CachedNetworkImage(
                  imageUrl: adModellist[index].photos!['0'],
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
                        'Rs ${adModellist[index].price}',
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        adModellist[index].title!,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            adModellist[index].city!,
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            '${DateFormat().add_d().add_MMM().format(DateTime.fromMicrosecondsSinceEpoch(adModellist[index].date!.microsecondsSinceEpoch))}',
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (adModellist[index].isFeatured!)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    color: Colors.red,
                    width: 70,
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
        ),
      ),
    );
  }
}
