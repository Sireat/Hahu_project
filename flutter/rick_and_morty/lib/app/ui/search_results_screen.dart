import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/model/character.dart';
import 'package:rick_and_morty/app/widgets/character_widget.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<Character> displayedCharacters;

  const SearchResultsScreen({super.key, required this.displayedCharacters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: displayedCharacters
                    .map((e) => CharacterWidget(character: e))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            
          ],
        ),
      ),
    );
  }
}
