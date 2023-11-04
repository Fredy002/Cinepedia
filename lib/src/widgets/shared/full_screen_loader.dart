import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading movies',
      'Buying popcorn',
      'Watching trailers',
      'Eating popcorn',
      'Buying tickets',
      'Waiting for the movie to start',
      'Waiting for the movie to end',
      'Leaving the cinema',
      'Writing a review',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Pease Wait'),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder:(context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
