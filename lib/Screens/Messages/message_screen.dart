import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ChatTile(
                  name: 'Miss Dolores Schowalter',
                  message: 'Thank you! 😊',
                  time: '7:12 AM',
                  unreadCount: 3,
                  avatar: 'https://i.pravatar.cc/150?img=1',
                ),
                ChatTile(
                  name: 'Lorena Farrell',
                  message: 'Yes! please take a order',
                  time: '9:28 AM',
                  avatar: 'https://i.pravatar.cc/150?img=2',
                ),
                ChatTile(
                  name: 'Amos Hessel',
                  message: 'I think this one is good',
                  time: '4:35 PM',
                  avatar: 'https://i.pravatar.cc/150?img=3',
                ),
                ChatTile(
                  name: 'Ollie Haley',
                  message: 'Wow, this is really epic',
                  time: '8:12 PM',
                  avatar: 'https://i.pravatar.cc/150?img=4',
                ),
                ChatTile(
                  name: 'Traci Maggio',
                  message: 'omg, this is amazing',
                  time: '10:22 PM',
                  avatar: 'https://i.pravatar.cc/150?img=5',
                ),
                ChatTile(
                  name: 'Mathew Konopelski',
                  message: 'woohoooo',
                  time: 'yesterday',
                  avatar: 'https://i.pravatar.cc/150?img=6',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol tambah ditekan
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final int unreadCount;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
