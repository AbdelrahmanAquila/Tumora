import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tumora/shared/color_manager.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Flexible(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return const DocCardBuilder();
            },
          ),
        ),
      ],
    ));
  }
}

class DocCardBuilder extends StatelessWidget {
  const DocCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              color: ColorManager.greydark,
              blurRadius: 5,
              offset: const Offset(-3, 3))
        ],
        // backgroundBlendMode: BlendMode.hardLight,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        // border: Border.all(color: Colors.red, style: BorderStyle.solid),
        color: ColorManager.secondary,
      ),
      height: 100,
      width: double.infinity,
      child: const Row(
        children: [
          SizedBox(
            width: 100,
            child: Image(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                    'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg')),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //todo doc name and time from api
              children: [
                Text(
                  'Dr. Doctor_Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  'Adress 123 building',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_border,
                    ),
                    Icon(
                      Icons.star_border,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
