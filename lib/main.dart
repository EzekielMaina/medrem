import 'package:flutter/material.dart';
import 'package:med_rem/aboutapp.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:med_rem/articlessurf.dart';
import 'package:med_rem/carldisplay.dart';
import 'help.dart';
import 'splashscreen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Search',
      home: SafeArea(
        child: SplashScreen(),
      ),
      routes: {
        '/home': (context) =>
            GoogleSearchPage(), // Define a route for the home screen
      },
    );
  }
}

class GoogleSearchPage extends StatelessWidget {
  GoogleSearchPage({Key? key}) : super(key: key);
  static bool display = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          // appBar: AppBar(
          //   title:
          //       const Text('Google Search', style: TextStyle(color: Colors.white)),
          // ),
          body: Builder(
            builder: (BuildContext context) {
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                      child: Viewport(
                        axisDirection: AxisDirection.down,
                        offset: ViewportOffset.zero(),
                        center: const Key('center'),
                        slivers: <Widget>[
                          SliverFixedExtentList(
                            itemExtent: MediaQuery.of(context).size.height,
                            key: const Key('center'),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return AspectRatio(
                                  aspectRatio: 89 / 9,
                                  child: WebView(
                                    initialUrl: 'https://www.wikipedia.org/',
                                    initialMediaPlaybackPolicy:
                                        AutoMediaPlaybackPolicy.always_allow,
                                  ),
                                );
                              },
                              childCount: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: FloatingActionButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          drawer: display
              ? Drawer(
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: UserAccountsDrawerHeader(
                          accountName: const Text('Smart Afya'),
                          accountEmail: const Text('Your health,Your Pride'),
                          currentAccountPicture: const CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://picsum.photos/200'),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.article),
                        title: const Text('Article Surfing'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthArticlesScreen()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.medical_services),
                        title: const Text('Medical Reminder'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('About App'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutApp()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text('Help'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HelpPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text('Exit'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Exit'),
                                content: const Text(
                                    'Are you sure you want to exit?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(width: 100),
                                  TextButton(
                                    child: const Text('Exit'),
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Drawer(
                  child: SafeArea(
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: UserAccountsDrawerHeader(
                            accountName: const Text('Smart Afya'),
                            accountEmail: const Text('Your health,Your Pride'),
                            currentAccountPicture: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),

                        //  ListTile(
                        //   leading: const Icon(Icons.help),
                        //   title: const Text('Report'),
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => ReportClass()),
                        //     );
                        //   },
                        // ),

                        ListTile(
                          leading: const Icon(Icons.help),
                          title: const Text('Help Facility'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.info),
                          title: const Text('About App'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutApp()),
                            );
                          },
                        ),

                        ListTile(
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text('Exit'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Exit'),
                                  content: const Text(
                                      'Are you sure you want to exit?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    const SizedBox(width: 100),
                                    TextButton(
                                      child: const Text('Exit'),
                                      onPressed: () {
                                        SystemNavigator.pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    return false;
  }
}
