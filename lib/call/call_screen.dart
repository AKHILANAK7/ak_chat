import 'package:flutter/material.dart';
import 'call_service.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatelessWidget {
  final String channelId;
  final String userId;

  CallScreen({required this.channelId, required this.userId});

  @override
  Widget build(BuildContext context) {
    final callService = Provider.of<CallService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Call'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await callService.startCall(channelId: channelId, userId: userId);
              },
              child: Text('Start Call'),
            ),
            ElevatedButton(
              onPressed: () async {
                await callService.endCall(channelId: channelId);
                Navigator.pop(context);
              },
              child: Text('End Call'),
            ),
          ],
        ),
      ),
    );
  }
}
