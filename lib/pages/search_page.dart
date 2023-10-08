import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _data = [
    'Banchan',
    'Beverage',
    'Frozen Food',
    'Gimbap',
    'KBBQ Meat',
    'Kimchi',
    'Kitchen',
    'Korean Laver',
    'Living',
    'Ramyun',
    'Seasoning & Sauce',
    'Shabu-shabu',
    'Snack',
    'Soju',
    'Tofu',
    'Tteokbokki',
    'Vegetables',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    // Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where((element) => element
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Container(
            alignment: Alignment.bottomCenter,
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'What are you craving?',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
                suffixIcon: Visibility(
                  visible: _searchController.text.isNotEmpty,
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : ListView.builder(
                itemCount: _filteredData.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // This is the first item, which is the heading text
                    return ListTile(
                      title: Text(
                        'All Products',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    // These are the regular list items
                    final dataIndex = index - 1;
                    return Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 8.0),
                        title: Row(
                          children: [
                            const Icon(
                              Icons
                                  .search, // You can change this to your desired icon
                              color: Colors.grey, // Change the icon color here
                            ),
                            const SizedBox(
                              width: 8.0,
                            ), // Adjust the width to control spacing
                            Text(
                              _filteredData[dataIndex],
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
        backgroundColor: Colors.white,
      );
}
