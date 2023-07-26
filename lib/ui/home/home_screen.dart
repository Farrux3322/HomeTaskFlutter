import 'package:default_project/providers/user_provider.dart';
import 'package:default_project/status/form_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Users info",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              switch (provider.status) {
                case FormStatus.pure:
                  return const Text("Hali data yuq , bo'sh holat");
                case FormStatus.success:
                  return Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(provider.users!.length, (index) {
                          return Container(
                            margin: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16)),
                            child: ListTile(
                              title: Text(
                                provider.users![index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                "Id: ${provider.users![index].id.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Text(
                                "User Id: ${provider.users![index].userId.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  );
                case FormStatus.failure:
                  return Center(child: Text(provider.errorText));
                case FormStatus.loading:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
