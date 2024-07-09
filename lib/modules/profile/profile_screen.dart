import 'package:flutter/material.dart';
import 'package:tumora/shared/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: Container(
            color: ColorManager.primary,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50,
                            //todo change with person image from api
                            foregroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //todo add name
                            Text(
                              'User Name',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //todo add id
                            Text(
                              'ID #123456789',
                              style: TextStyle(
                                  fontSize: 18, color: ColorManager.white),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Oppointments',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 15,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return const CardBuilder();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}

class CardBuilder extends StatelessWidget {
  const CardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: ColorManager.primary,
      elevation: 4,
      shadowColor: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5),
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
                    '09:30 AM',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
