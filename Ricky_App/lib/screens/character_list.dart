import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/character.dart';
import '../../services/api_services.dart';
import 'widgets/character_card.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = ApiService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // خلفية ناعمة
      appBar: AppBar(
        title: Text(
          "Rick and Morty",
          style: GoogleFonts.bebasNeue(fontSize: 28,color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 6,
        shadowColor: Colors.deepPurpleAccent,
      ),
      body: FutureBuilder<List<Character>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final characters = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: GridView.builder(
                itemCount: characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CharacterCard(character: characters[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
