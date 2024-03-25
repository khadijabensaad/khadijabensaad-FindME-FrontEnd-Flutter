import 'package:flutter/material.dart';

void main() => runApp(ChatbotApp());

class ChatbotApp extends StatefulWidget {
  @override
  State<ChatbotApp> createState() => _ChatbotAppState();
}

class _ChatbotAppState extends State<ChatbotApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatbotScreen(),
    );
  }
}

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add('Utilisateur: $message');
    });
    // Répondre au message de l'utilisateur (simulation)
    Future.delayed(Duration(seconds: 1), () {
      String response = getResponse(message);
      setState(() {
        _messages.add('Chatbot: $response');
      });
    });
    _controller.clear();
  }

  String getResponse(String message) {
    // Logique du chatbot pour répondre au message de l'utilisateur
    // Dans cet exemple, une simple logique de réponse aléatoire est utilisée
    List<String> responses = [
      "Désolé, je ne peux pas vous aider avec ça.",
      "Pouvez-vous fournir plus de détails sur ce que vous cherchez ?",
      "Veuillez patienter pendant que je recherche...",
      "Voici les articles correspondants à votre recherche : [Liste des articles]",
    ];
    return responses[0]; // Retourne une réponse aléatoire pour l'exemple
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Chatbot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Posez votre question...",
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
