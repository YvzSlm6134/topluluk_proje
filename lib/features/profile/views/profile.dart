import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/sizes.dart';
import '../../../models/user_model.dart';
import '../controller/profile_controller.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef Ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: FutureBuilder<UserModel>(
              future: Ref.read(profileControllerProvider).getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userModel = snapshot.data!;
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: CachedNetworkImageProvider(
                              userModel.profilePhoto!),
                        ),
                      )
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              }),
        ),
      ),
    );
  }
}
