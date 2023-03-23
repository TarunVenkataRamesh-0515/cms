import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

class Palette {
  MaterialColor mycolor = MaterialColor(
    Color.fromARGB(255, 0, 128, 0).value,
    <int, Color>{
      50: Color.fromRGBO(0, 137, 123, 0.1),
      100: Color.fromRGBO(0, 137, 123, 0.2),
      200: Color.fromRGBO(0, 137, 123, 0.3),
      300: Color.fromRGBO(0, 137, 123, 0.4),
      400: Color.fromRGBO(0, 137, 123, 0.5),
      500: Color.fromRGBO(0, 137, 123, 0.6),
      600: Color.fromRGBO(0, 137, 123, 0.7),
      700: Color.fromRGBO(0, 137, 123, 0.8),
      800: Color.fromRGBO(0, 137, 123, 0.9),
      900: Color.fromARGB(255, 0, 137, 48),
    },
  );
}

late WebViewController _webViewcontroller;
void main() {
  runApp(MaterialApp(
      title: 'CSM',
      theme: ThemeData(
        primarySwatch: Palette().mycolor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SMS'),
        ),
        body: WillPopScope(
            onWillPop: () async {
              if (await _webViewcontroller.canGoBack()) {
                _webViewcontroller.goBack();
                return false;
              } else {
                return true;
              }
            },
            child: WebView(
              initialUrl: "http://192.168.43.2",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewcontroller = webViewController;
              },
            )),
      )));

//  void requestPermission() async {
//     Map<PermissionGroup, PermissionStatus> permissions =
//         await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//   }

// FilePickerResult? result = await FilePicker.platform.pickFiles();

// if (result != null) {
//   File file = File(result.files.single.path);
// } else {
//   print("No file selected");
// }

// FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

// if (result != null) {
//   List files = result.paths.map((path) => File(path)).toList();
// } else {
//   print("No file selected");
// }

// FilePickerResult? result = await FilePicker.platform.pickFiles(
//   type: FileType.custom,
//   allowedExtensions: ['jpg', 'pdf', 'doc'],
// );
}
