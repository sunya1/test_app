import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  // 1
  final String text;
  final String imagePath;
  final bool centerTitle;
  final Function() onTap;

  const AppBarWidget(
      {Key? key,
      required this.text,
      required this.imagePath,
      this.centerTitle = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size; 
    return SliverAppBar(
      leading: InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          )),
      automaticallyImplyLeading: false,
      expandedHeight: _size.height * 0.3  ,
      collapsedHeight: _size.height * 0.15,
      pinned: true,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Positioned(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imagePath,
                progressIndicatorBuilder: (_, s, d) =>
                    const CircularProgressIndicator(),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
