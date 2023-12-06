import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Chat',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
        name: 'Messi And Ronaldo',
        message: 'Goat ka waxan u caleema sarney Harun?',
        time: '8:30 AM',
        image: 'images/1.jpg'),
    Chat(
        name: 'Messi',
        message: 'Sure, let\'s meet tomorrow.',
        time: '9:45 AM',
        image: 'images/Goat.jpg'),
    Chat(
        name: 'M10',
        message: 'I\'m looking forward to it!',
        time: '10:15 AM',
        image: 'images/2.jpg'),
    Chat(
        name: 'Sophia',
        message: 'See you later!',
        time: '11:20 AM',
        image: 'images/Girl.jpg'),
    Chat(
        name: 'Drogba 11',
        message: 'Hello, how are you?',
        time: '8:30 AM',
        image: 'images/DD11.jpg'),
    Chat(
        name: 'Freinke De jong',
        message: 'Sure, let\'s meet tomorrow.',
        time: '9:45 AM',
        image: 'images/Fr21.jpg'),
    Chat(
        name: 'Hacking',
        message: 'I\'m looking forward to it!',
        time: '10:15 AM',
        image: 'images/Hacking.jpg'),
    Chat(
        name: 'Mudrick 10',
        message: 'See you later!',
        time: '11:20 AM',
        image: 'images/M10.jpg'),
    Chat(
        name: 'Cole Palmer',
        message: 'See you later!',
        time: '11:20 AM',
        image: 'images/Palmer20.jpg'),
    // Add more chats with images
    // ...
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 85, 107, 88),
          title: Text('WhatsApp'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('New group'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  onTap: () {},
                ),
              ],
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chats[index].image),
                ),
                title: Text(chats[index].name),
                subtitle: Text(chats[index].message),
                trailing: Text(chats[index].time),
              ),
            ),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          tooltip: 'Chats',
          child: Icon(Icons.message),
        ),
      ),
    );
  }
}

class Chat {
  final String name, message, time, image;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
  });
}

class StatusTab extends StatelessWidget {
  final List<UserStatus> statuses = [/* Existing user statuses... */];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        final userStatus = statuses[index];
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.green),
          title: Text(userStatus.name),
          subtitle: Text(
              '${userStatus.time} - ${userStatus.isViewed ? 'Viewed' : 'Not viewed'}'),
          onTap: () {/* Functionality to view user status */},
        );
      },
    );
  }
}

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Calls Tab'));
  }
}

class UserStatus {
  final String name, time;
  final bool isViewed;

  UserStatus({required this.name, required this.time, required this.isViewed});
}
