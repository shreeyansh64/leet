import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  bool click = false;
  TextEditingController controller = TextEditingController();

  Future<void> saveData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  await prefs.setString('user', controller.text.trim());
  setState(() {
    click = true;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "INPUT",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Write the username to search",
              ),
            ),
          ),
          SizedBox(height: 12,),
          ElevatedButton(style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20)),onPressed:saveData, child: click?Text("Saved !"):Text("Search"))
        ],
      ),
    );
  }
}
