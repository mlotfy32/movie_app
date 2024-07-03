import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/imageState/get_next_image_cubit.dart';

class CustomePageview extends StatefulWidget {
  const CustomePageview({super.key, required this.data, required this.index});
  final List<moviesModelTrending> data;
  final int index;
  @override
  State<CustomePageview> createState() => _CustomePageviewState();
}

class _CustomePageviewState extends State<CustomePageview> {
  PageController _controller = PageController();
  int x = 1;
  EdgeInsets edgeInsets = EdgeInsets.only(top: 0, right: 0, left: 0);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: widget.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Center(
              child: BlocConsumer<GetNextImageCubit, GetNextImageState>(
                listener: (context, state) {
                  edgeInsets = EdgeInsets.only(top: 30);
                },
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: widget.index == index ? 290 : 270,
                    width: widget.index == index ? 200 : 190,
                    margin: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: 100,
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${Constants.UrlPath + widget.data[index].backdrop_path}'),
                            fit: BoxFit.fill)),
                  );
                },
              ),
            ));
  }

  @override
  void initState() {
    _controller = PageController(
        initialPage: widget.index, keepPage: true, viewportFraction: 0.7);
    Timer.periodic(const Duration(seconds: 5), (timer) {
      BlocProvider.of<GetNextImageCubit>(context)
          .getNextImage(widget.index, _controller);
    });
    super.initState();
  }
}
