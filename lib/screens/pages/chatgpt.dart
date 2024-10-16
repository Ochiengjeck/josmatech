// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Chatgpt extends StatefulWidget {
//   const Chatgpt({super.key});

//   @override
//   State<Chatgpt> createState() => _ChatgptState();
// }

// class _ChatgptState extends State<Chatgpt> {
//   String apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';

//   final _openAI = OpenAI.instance.build(
//       token: apiKey,
//       baseOption: HttpSetup(
//         receiveTimeout: const Duration(
//           seconds: 5,
//         ),
//       ),
//       enableLog: true);

//   final ChatUser _currentUser = ChatUser(
//     id: '1',
//     firstName: "Jeckonia",
//     lastName: "Opiyo",
//   );
//   final ChatUser _GPT = ChatUser(
//     id: '2',
//     firstName: "Chat",
//     lastName: "GPT",
//   );
//   List<ChatMessage> _messages = <ChatMessage>[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Chat GPT",
//           style: TextStyle(
//             color: Color.fromARGB(
//               255,
//               201,
//               199,
//               199,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(
//           0,
//           166,
//           126,
//           1,
//         ),
//       ),
//       body: DashChat(
//         currentUser: _currentUser,
//         onSend: (ChatMessage m) {
//           getchatresponce(m);
//         },
//         messages: _messages,
//         messageOptions: const MessageOptions(
//           containerColor: Color.fromARGB(
//             0,
//             166,
//             126,
//             1,
//           ),
//           currentUserContainerColor: Color.fromARGB(255, 14, 14, 14),
//           textColor: Color.fromARGB(255, 203, 203, 203),
//         ),
//       ),
//     );
//   }

//   Future<void> getchatresponce(ChatMessage m) async {
//     //add the message to the messages list
//     setState(() {
//       _messages.insert(0, m);
//     });

//     //create a mesasages history to be sent to chatgpt
//     List<Map<String, Messages>> _messageHistory = _messages.reversed
//         .map((m) {
//           if (m.user == _currentUser) {
//             return Messages(role: Role.user, content: m.text);
//           } else {
//             return Messages(role: Role.assistant, content: m.text);
//           }
//         })
//         .cast<Map<String, Messages>>()
//         .toList();
//     final request = ChatCompleteText(
//         model: GptTurbo0301ChatModel(),
//         messages: _messageHistory,
//         maxToken: 200);
//     final responce = await _openAI.onChatCompletion(request: request);
//     for (var element in responce!.choices) {
//       setState(() {
//         _messages.insert(
//           0,
//           ChatMessage(
//               user: _GPT,
//               createdAt: DateTime.now(),
//               text: element.message!.content),
//         );
//       });
//     }
//   }
// }
