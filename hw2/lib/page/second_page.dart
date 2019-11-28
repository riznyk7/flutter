import 'package:flutter/material.dart';
import 'package:hw2/client/provider.dart';
import 'package:hw2/model/user.dart';

class SecondPage extends StatelessWidget {
  final httpService = ApiClient().provideRestClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          print(snapshot.error);
          if (snapshot.hasData) {
            List<User> taskList = snapshot.data;
            return ListView(
              children: taskList
                  .map(
                    (User user) => ListTile(
                      leading: FadeInImage.assetNetwork(
                        fadeInDuration: Duration(seconds: 1),
                        placeholder: 'assets/giphy.gif',
                        image: 'http://www.free-icons-download.net/images/user-icon-44709.png',
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      onTap: () {
                        Navigator.of(context).pop(user);
                      },
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
