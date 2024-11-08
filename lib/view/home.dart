import 'package:flutter/material.dart';
import 'package:json_api_test/controller/controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    Future.microtask(
      () {
        Provider.of<GetUserProvider>(context, listen: false).getUser();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<GetUserProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(provider.users[index].userId.toString()),
                ),
                title: Text(provider.users[index].title ?? ''),
                subtitle: Text(provider.users[index].body ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
