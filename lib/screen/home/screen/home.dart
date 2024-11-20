import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider hRead;
  late HomeProvider hwatch;

  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hwatch = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "BROWSER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: hRead.appsData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      hRead.appsData[index]['logo']!,
                      height: 55,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      hRead.appsData[index]['name']!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      hRead.indexSave(index);
                      Navigator.of(context).pushNamed('wedView');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
