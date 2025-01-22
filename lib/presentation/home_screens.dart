import 'package:flutter/material.dart';

import '../models/user_view_model.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = UserViewModel();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: userViewModel.getUserDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
              return ListView.builder(
                itemBuilder: (context, index) {},
              );
            }
          }),
    );
  }
}
