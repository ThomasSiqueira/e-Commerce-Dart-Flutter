import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/Model/messageProvider.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:camera/camera.dart';
import 'package:ecom_mobile/View/cameraPage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  int init = -1;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
  }

  void _addMessage(types.Message message, CollectionReference messagesRef,
      CondicaoLogin user) {
    setState(() {
      print(message);
      _messages.insert(0, message);
    });
    if (user.isLogado()) {
      print(user.usuario!.id);
      (messagesRef.where("user", isEqualTo: user.usuario!.id).limit(1).get())
          .then((QuerySnapshot snapshot) {
        if (snapshot.size < 1) {
          try {
            messagesRef.add({
              "user": user.usuario!.id,
              "messages": {for (var item in _messages) item.toJson()}
            });
          } catch (e) {
            print("Error");
          }
        } else {
          var batch = FirebaseFirestore.instance.batch();
          final post = snapshot.docs[0].reference;
          try {
            batch.update(post, {
              "user": user.usuario!.id,
              "messages": {for (var item in _messages) item.toJson()}
            });
            batch.commit().then(
                  (value) => {
                    for (var item in _messages) {print(item.toJson())}
                  },
                );
          } catch (e) {
            print("Error");
          }
        }
      });
    }
  }

  void _handleAttachmentPressed(
      _user, CollectionReference messagesRef, CondicaoLogin user) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection(_user, messagesRef, user);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleCameraSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Camera'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection(
      _user, CollectionReference messagesRef, CondicaoLogin user) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message, messagesRef, user);
    }
  }

  void action(
      CollectionReference messagesRef, CondicaoLogin user, XFile result) async {
    final _user = types.User(
      id: user.isLogado() ? user.usuario!.id : "",
      firstName: user.isLogado() ? user.usuario!.nome : "",
    );
    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final destination = 'files/images/';

      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child(fileName);
        firebase_storage.UploadTask uploadTask = ref.putData(bytes);

        var dowurl = await (await uploadTask).ref.getDownloadURL();

        var url = dowurl.toString();
        final message = types.ImageMessage(
          author: _user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          height: image.height.toDouble(),
          id: const Uuid().v4(),
          name: result.name,
          size: bytes.length,
          uri: url,
        );

        _addMessage(message, messagesRef, user);
      } catch (e) {
        print('error occured');
      }
    }
  }

  void _handleCameraSelection() async {
    final cameras = await availableCameras().then(
      (value) => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CameraPage(cameras: value, action: action))),
    );
  }

  void _handleImageSelection(
      _user, CollectionReference messagesRef, CondicaoLogin user) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final destination = 'files/images/';

      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child(fileName);
        firebase_storage.UploadTask uploadTask = ref.putData(bytes);

        var dowurl = await (await uploadTask).ref.getDownloadURL();

        var url = dowurl.toString();
        final message = types.ImageMessage(
          author: _user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          height: image.height.toDouble(),
          id: const Uuid().v4(),
          name: result.name,
          size: bytes.length,
          uri: url,
        );

        _addMessage(message, messagesRef, user);
      } catch (e) {
        print('error occured');
      }
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message, _user,
      CollectionReference messagesRef, CondicaoLogin user) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    _addMessage(textMessage, messagesRef, user);
  }

  void _loadMessages(CollectionReference messagesRef) async {
    var user = Provider.of<CondicaoLogin>(context, listen: false);
    if (user.isLogado()) {
      List<QueryDocumentSnapshot<Object?>> data = (await (messagesRef
              .where("user", isEqualTo: user.usuario!.id)
              .limit(1)
              .get()))
          .docs;

      late List<types.Message> messages = [];
      for (var valor in data) {
        var p = valor.data() as Map;
        for (Map<String, dynamic> entrada in p["messages"]) {
          messages.add(types.Message.fromJson(entrada));
        }
      }
      setState(() {
        _messages = messages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(builder: (context, messageAtt, child) {
      var user = Provider.of<CondicaoLogin>(context, listen: false);
      final CollectionReference messagesRef =
          (FirebaseFirestore.instance.collection('messages'));
      if (messageAtt.state != init) {
        _loadMessages(messagesRef);
        messageAtt.chronometer();
        init = messageAtt.state;
      }

      final _user = types.User(
        id: user.isLogado() ? user.usuario!.id : "",
        firstName: user.isLogado() ? user.usuario!.nome : "",
      );

      return Scaffold(
        body: Chat(
          messages: _messages,
          onAttachmentPressed: () =>
              _handleAttachmentPressed(_user, messagesRef, user),
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: (e) => _handleSendPressed(e, _user, messagesRef, user),
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),
      );
    });
  }
}
