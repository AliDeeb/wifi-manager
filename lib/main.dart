import 'package:flutter/material.dart';
import 'package:wifi_manager/wifi_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wifi manager Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Wifi manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? wifiStatus;
  late Future<void> getWifiStatusFunc;

  @override
  void initState() {
    super.initState();
    getWifiStatusFunc = getWifiStatus();
  }

  Future<bool?> getWifiStatus() async {
    final result = await WifiManager.isWifiEnabled();
    setState(() => wifiStatus = result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: getWifiStatusFunc,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return Text("Wifi Enabled: $wifiStatus");
            } else {
              return const Text("Error get wifi status");
            }
          },
        ),
      ),
      floatingActionButton: wifiStatus != null
          ? FloatingActionButton(
              child: Icon(wifiStatus! ? Icons.wifi_off : Icons.wifi),
              onPressed: () async {
                if (wifiStatus!) {
                  await WifiManager.turnOffWifi();
                  setState(() => wifiStatus = false);
                } else {
                  await WifiManager.turnOnWifi();
                  setState(() => wifiStatus = true);
                }
              },
            )
          : null,
    );
  }
}
