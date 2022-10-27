import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:phase_2_flutter_developer/data/models/web_produnct_model.dart';

class WebScrapingScreen extends StatefulWidget {
  const WebScrapingScreen({super.key});

  @override
  State<WebScrapingScreen> createState() => _WebScrapingScreenState();
}

class _WebScrapingScreenState extends State<WebScrapingScreen> {
  String result1 = 'Result 1';
  String result2 = 'Result 2';
  String result3 = 'Result 3';

  bool isLoading = false;

  Future<String> extractData() async {
    String titleProduct = '';
    final response = await http.Client()
        .get(Uri.parse('https://www.amazon.eg/dp/B0BDK4GJXC?language=en_AE'));
    if (response.statusCode == 200) {
      try {
        // Parsing the response
        final document = parser.parse(response.body);
        titleProduct = document.querySelector('a.a-link-normal>div')!.text;
        print('title: $titleProduct');
      } catch (e) {
        print(e);
      }
    }
    return titleProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GeeksForGeeks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if isLoading is true show loader
            // else show Column of Texts
            isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Text(result1,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(result2,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(result3,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            MaterialButton(
              onPressed: () async {
                // Setting isLoading true to show the loader
                setState(() {
                  isLoading = true;
                });
                final response = await extractData();

                setState(() {
                  result1 = response;
                  isLoading = false;
                });
              },
              color: Colors.green,
              child: const Text(
                'Scrap Data',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
