import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/mobx/todo_mobx.dart';
import 'package:flutter_application_1/widgets/app_alertdialog.dart';
import 'package:flutter_application_1/widgets/app_tasklistapi.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/widgets/app_tasklist.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

DateTime? currentBackPressTime;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  final todoMobx = TodoMobx();
  @override
  void initState() {
    todoMobx.tasksapi = todoMobx.getDatabase();
    todoMobx.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: const Text('Log out'),
            onTap: () => NewAlertDialog(
              title: 'Are you sure you want to log out?',
              confirmButtonAction: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ).showaDialog(context),
          )
        ]),
      ),
      body: WillPopScope(
        onWillPop: () async {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = now;
            Fluttertoast.showToast(msg: 'Press BACK button again to exit');
            return false;
          } else {
            Fluttertoast.cancel();
            SystemNavigator.pop();
            return true;
          }
        },
        child: Observer(
          builder: (_) => todoMobx.loading
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 100),
                )
              : PageView(controller: pageController, children: <Widget>[
                  TaskList(
                    todoMobx: todoMobx,
                  ),
                  // GridView.count(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 20.0,
                  //   children: todoMobx.tasks.map((task) {
                  //     return Utility.imageFromBase64String(task.images!);
                  //   }).toList(),
                  // ),
                  TaskListApi(
                    todoMobx: todoMobx,
                  ),
                ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 150,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          child: const Text('Text'),
                          onPressed: () async =>
                              todoMobx.showCreateTaskDialog(context),
                        ),
                        ElevatedButton(
                          child: const Text('Image'),
                          onPressed: () async => todoMobx.saveImage(context),
                        )
                      ],
                    ),
                  ),
                );
              });
          // todoMobx.showCreateTaskDialog(context);
        }),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Local'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'API')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
