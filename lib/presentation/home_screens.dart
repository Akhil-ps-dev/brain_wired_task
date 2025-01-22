import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/colors/kcolors.dart';
import 'package:flutter_task/core/const/ksize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/functions/common_functions.dart';
import '../models/user_view_model.dart';
import '../widgets/headline_widget.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = UserViewModel();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: userViewModel.getUserDetails(),
          builder: (BuildContext context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasError == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data?.id == null) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: BrainwiredColors.ftContainerClr,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.name.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      KSizedBox.kDefSizedBoxH5,
                      Text(
                        "User name: ${snapshot.data!.username.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      KSizedBox.kDefSizedBoxH10,
                      HeadineWidget(
                        title: 'Address',
                      ),
                      KSizedBox.kDefSizedBoxH5,
                      GestureDetector(
                        onTap: () async {
                          launchURL(
                              "https://www.google.com/maps/search/?api=1&query=${data.address!.geo!.lat},${data.address!.geo!.lng}");
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                " Street ${data!.address!.street}, ${data.address!.suite}, ${data.address!.city},  Zip code :${data.address!.zipcode}",
                            style: TextStyle(
                              color: BrainwiredColors.ftLinkClr,
                            ),
                          ),
                        ),
                      ),
                      KSizedBox.kDefSizedBoxH10,
                      Text(
                        "Phone No: ${snapshot.data!.phone.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      KSizedBox.kDefSizedBoxH5,
                      Text(
                        "Website: ${snapshot.data!.website.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      KSizedBox.kDefSizedBoxH10,
                      HeadineWidget(
                        title: 'Company',
                      ),
                      Text(
                        "${snapshot.data!.company!.name.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      KSizedBox.kDefSizedBoxH5,
                      Text(
                        "${snapshot.data!.company!.catchPhrase.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      KSizedBox.kDefSizedBoxH5,
                      Text(
                        "${snapshot.data!.company!.bs.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
