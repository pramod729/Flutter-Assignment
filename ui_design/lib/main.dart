import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: ChatScreen(), // Launch the ChatScreen UI
    );
  }
}

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController(); // Controller for message input field

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar section with avatar, name, status and icons
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back), // Back arrow icon
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRmkArf9GYdVfdOvINUYU05hCkpIbZP6hyt0cA9GYOSX-rL3t7_QVqMVAg2GCQKo_CUcKjUzedxla9U5jZHDS4lexh6LnkcmTkfUpJZ3arU-Q'), //  actual image
              radius: 18,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Jhon Abraham', style: TextStyle(fontSize: 16)),
                Text('Active now', style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call), // Call icon
          SizedBox(width: 16),
          Icon(Icons.videocam), // Video call icon
          SizedBox(width: 8),
        ],
      ),

      // Body of the chat screen
      body: Column(
        children: [
          const SizedBox(height: 8),

          // Date separator chip
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Today"),
            ),
          ),
          const SizedBox(height: 10),

          // List of chat messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _outgoingMessage("Hello! Jhon abraham", "09:25 AM"),
                _incomingMessageWithAvatar("Hello ! Nazrul How are you?", "09:25 AM"),
                _outgoingMessage("You did your job well!", "09:25 AM"),
                _incomingMessageWithAvatar("Have a great working week!!", "09:25 AM"),
                _incomingMessageWithAvatar("Hope you like it", "09:25 AM"),
                _audioMessage("00:16", "09:25 AM"), // Audio message
              ],
            ),
          ),

          // Bottom message input area
          _messageInput(),
        ],
      ),
    );
  }

  // Incoming message with avatar
  Widget _incomingMessageWithAvatar(String text, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRmkArf9GYdVfdOvINUYU05hCkpIbZP6hyt0cA9GYOSX-rL3t7_QVqMVAg2GCQKo_CUcKjUzedxla9U5jZHDS4lexh6LnkcmTkfUpJZ3arU-Q'), // real image path
          radius: 16,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget for right-aligned outgoing text message bubble
  Widget _outgoingMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(4), // Slightly flatter
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.white70)), // Timestamp
          ],
        ),
      ),
    );
  }

  // Widget for audio message bubble with play icon, waveform bar and duration
  Widget _audioMessage(String duration, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow, color: Colors.white), // Play icon
            Container(
              width: 60,
              height: 20,
              color: Colors.white, // Waveform bar placeholder
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Text(duration, style: const TextStyle(color: Colors.white)), // Duration
            const SizedBox(width: 8),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.white70)), // Timestamp
          ],
        ),
      ),
    );
  }

  // Widget for message input field and icons
  Widget _messageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.attach_file), // Attachment icon
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Write your message", // Placeholder text
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.image), // Image icon
          const SizedBox(width: 8),
          const Icon(Icons.camera_alt), // Camera icon
          const SizedBox(width: 8),
          const Icon(Icons.mic), // Microphone icon
        ],
      ),
    );
  }
}