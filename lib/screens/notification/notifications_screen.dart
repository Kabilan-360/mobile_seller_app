import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [
    {
      'title': 'New Listing Added',
      'message': 'Check out the latest iPhone 14 Pro listing!',
      'time': '2 hours ago',
    },
    {
      'title': 'Message Received',
      'message': 'You have a new message from John.',
      'time': '4 hours ago',
    },
    {
      'title': 'Price Drop Alert',
      'message': 'Samsung Galaxy S23 is now \$699!',
      'time': '1 day ago',
    },
  ];

  void clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          if (notifications.isNotEmpty)
            IconButton(
              icon: Icon(Icons.clear_all),
              onPressed: clearNotifications,
              tooltip: 'Clear All',
            ),
        ],
      ),
      body: SingleChildScrollView(  // Wrap the body with SingleChildScrollView to prevent overflow
        child: notifications.isEmpty
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No notifications yet!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        )
            : Column(
          children: List.generate(
            notifications.length,
                (index) {
              final notification = notifications[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  title: Text(
                    notification['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(notification['message']!),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          deleteNotification(index);
                        },
                        tooltip: 'Delete Notification',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
