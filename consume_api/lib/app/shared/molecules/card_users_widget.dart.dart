import 'package:flutter/material.dart';
import '../../models/users_model.dart';
import '../../pages/user/user_page.dart';

// ignore: must_be_immutable
class CardUsersWidget extends StatelessWidget {
  UsersModel? model;
  BuildContext? context;
  final bool imageRight;
  final double elevation;

  CardUsersWidget({
    Key? key,
    this.model,
    this.context,
    this.imageRight = false,
    this.elevation = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (c) => UserPage(usersModel: model));
          Navigator.push(context, route);
        },
        child: Row(
          children: <Widget>[
            _buildThumbnail(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            model!.login,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildThumbnail() {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: imageRight
            ? const BorderRadius.only(
                topRight: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
        image: DecorationImage(
          image: NetworkImage(
              "https://avatars.githubusercontent.com/${model!.login}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
