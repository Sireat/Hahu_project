import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty/app/model/character.dart';
import 'package:rick_and_morty/app/ui/search_results_screen.dart';
import 'package:rick_and_morty/app/utils/query.dart';
import 'package:rick_and_morty/app/widgets/character_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  List<Character> allCharacters = [];
  List<Character> displayedCharacters = [];

  @override
  void initState() {
    super.initState();
  }

  void _searchCharacters(BuildContext context) {
    String nameFilter = _nameController.text.toLowerCase();
    String locationFilter = _locationController.text.toLowerCase();

    if (nameFilter.isEmpty && locationFilter.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a name or location to search")),
      );
      return;
    }

    List<Character> filteredCharacters = allCharacters.where((character) {
      bool matchesName = character.name.toLowerCase().contains(nameFilter);
      bool matchesLocation = character.location.toLowerCase().contains(locationFilter);
      return matchesName && matchesLocation;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(displayedCharacters: filteredCharacters),
      ),
    );
  }

  void _updateCharacters(List<Character> characters) {
    setState(() {
      allCharacters = characters;
      displayedCharacters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assets/logo.png",
            height: 62,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Search Fields
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
               children: [
  Expanded(
    child: TextField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: "Enter name",
        labelStyle: TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)), // Rounded corners
        ),
      ),
    ),
  ),
  const SizedBox(width: 8),
  Expanded(
    child: TextField(
      controller: _locationController,
      decoration: const InputDecoration(
        labelText: "Enter location",
        labelStyle: TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)), // Rounded corners
        ),
      ),
    ),
  ),
  const SizedBox(width: 8),
  ElevatedButton(
    onPressed: () => _searchCharacters(context),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0), // Adjust the value as needed
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    ),
    child: const Text(
      "Search",
      style: TextStyle(fontSize: 12), 
    ),
  ),
],
     ),
              ),
              // GraphQL Query and Results
              Expanded(
                child: Query(
                  options: QueryOptions(
                    fetchPolicy: FetchPolicy.cacheAndNetwork,
                    document: gql(getAllCharacters()),
                    variables: const {"page": 1},
                  ),
                  builder: (result, {fetchMore, refetch}) {
                    // We have data
                    if (result.data != null) {
                      int? nextPage = 1;
                      List<Character> fetchedCharacters = (result.data!["characters"]["results"] as List)
                          .map((e) => Character.fromMap(e))
                          .toList();

                      nextPage = result.data!["characters"]["info"]["next"];

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _updateCharacters(fetchedCharacters);
                      });

                      return RefreshIndicator(
                        onRefresh: () async {
                          await refetch!();
                          nextPage = 1;
                        },
                        child: SingleChildScrollView(
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
                              if (nextPage != null)
                                ElevatedButton(
                                  onPressed: () async {
                                    FetchMoreOptions opts = FetchMoreOptions(
                                      variables: {'page': nextPage},
                                      updateQuery: (previousResultData, fetchMoreResultData) {
                                        final List<dynamic> repos = [
                                          ...previousResultData!["characters"]["results"] as List<dynamic>,
                                          ...fetchMoreResultData!["characters"]["results"] as List<dynamic>
                                        ];
                                        fetchMoreResultData["characters"]["results"] = repos;
                                        return fetchMoreResultData;
                                      },
                                    );
                                    await fetchMore!(opts);
                                  },
                                  child: result.isLoading
                                      ? const CircularProgressIndicator.adaptive()
                                      : const Text("Load More"),
                                ),
                            ],
                          ),
                          ),
                      );
                    }
                    // We got data but it is null
                    else if (result.data == null) {
                      return const Text("Data Not Found!");
                    }
                    // We don't have data yet -> LOADING STATE
                    else if (result.isLoading) {
                      return const Center(
                        child: Text("Loading..."),
                      );
                    }
                    // error state
                    else {
                      return const Center(
                        child: Center(child: Text("Something went wrong")),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
