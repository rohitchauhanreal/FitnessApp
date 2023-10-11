import 'package:google_auth/todo.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/fit.png", height: 180.0, width: 160.0,),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.today, color: Colors.black38),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoListApp(),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView( // Wrap the content with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "EXPLORE", // Add your desired text here
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/cutie.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/benchpress.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/biceps.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/jump.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Our Offline Centers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  height: 400,
                  child: ListView(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(64.0, 20, 64.0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/newdelhi.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(64.0, 20, 64.0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/lucknow.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(64.0, 20, 64.0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/chennai.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(64.0, 20, 64.0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/gwalior.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(64.0, 20, 64.0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/images/goa.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

