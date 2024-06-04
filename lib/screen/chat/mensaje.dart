// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                var messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];

                    return ListTile(
                      title: Text(message['text'] ?? ''),
                      subtitle: message['imageUrl'] != null
                          ? Image.network(message['imageUrl'])
                          : message['videoUrl'] != null
                              ? GestureDetector(
                                  onTap: () {
                                    // Implementa la lógica para reproducir el video
                                  },
                                  child: Image.network(message['videoUrl']),
                                )
                              : null,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () => _sendMedia(ImageSource.gallery, 'image'),
                ),
                IconButton(
                  icon: const Icon(Icons.video_call),
                  onPressed: () => _sendMedia(ImageSource.gallery, 'video'),
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    var user = _auth.currentUser;

    await _firestore.collection('messages').add({
      'text': _messageController.text,
      'sender': user?.email,
      'timestamp': FieldValue.serverTimestamp(),
    });

    _messageController.clear();
  }

  Future<void> _sendMedia(ImageSource source, String mediaType) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;

    var user = _auth.currentUser;
    String fileName = pickedFile.name;
    String destination = '$mediaType/${user?.uid}/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination);
      await ref.putFile(File(pickedFile.path));
      final url = await ref.getDownloadURL();

      await _firestore.collection('messages').add({
        mediaType == 'image' ? 'imageUrl' : 'videoUrl': url,
        'sender': user?.email,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading $mediaType: $e');
      }
    }
  }
}
