import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_app/Chats/controller.dart';

class Chats extends StatelessWidget {
  final chatscontroller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Color(0xff075E54),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.search),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              ),
            ),
          ],
          bottom: TabBar(
            onTap: (int index) {
              chatscontroller.changeIndex(index);
            },
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Row(children: [
                  Tab(icon: Icon(Icons.camera_alt_sharp)),
                  SizedBox(
                    width: 15,
                  ),
                  Text("CHATS"),
                ]),
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GetX<UserController>(
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: chatscontroller.users.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(8),
                                child: ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(
                                    '${chatscontroller.users[index].name}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      '${chatscontroller.users[index].message}'),
                                  trailing: Text(
                                      '${chatscontroller.users[index].time}'),
                                ),
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          child: const ListTile(
                            leading:
                                CircleAvatar(backgroundColor: Colors.blueGrey),
                            title: Text(
                              "My Stautus",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("Just now"),
                            trailing: Icon(Icons.more_vert),
                          )),
                    ),
                    const Text(
                      " Recent Updates",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: GetX<UserController>(
                        builder: (controller) {
                          return ListView.builder(
                              itemCount: chatscontroller.users.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: EdgeInsets.all(3),
                                  child: ListTile(
                                    leading: GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                    title: Text(
                                      '${chatscontroller.users[index].name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        '${chatscontroller.users[index].time}'),
                                  ),
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GetX<UserController>(
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: chatscontroller.users.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(6),
                                child: ListTile(
                                    leading: CircleAvatar(),
                                    title: Text(
                                      '${chatscontroller.users[index].name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        '${chatscontroller.users[index].time}'),
                                    trailing: const Icon(Icons.phone)),
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton(
            onPressed: () {},
            child: chatscontroller.getIcon(),
          ),
        ),
      ),
    );
  }
}
