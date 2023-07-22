import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/entry_page/widgets/language_picker.dart';
import 'package:know_your_game/features/entry_page/widgets/vip_icon_button.dart';
import 'package:know_your_game/utils/utils.dart';

class EntryPage extends StatefulWidget {
  final Widget child;
  const EntryPage({required this.child, super.key});

  @override
  State<EntryPage> createState() => EntryPageState();
}

class EntryPageState extends State<EntryPage> {
  Widget get _child => widget.child;

  final List<BottomNavigationBarItem> _icons = [
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromARGB(166, 32, 51, 97),
            width: 1.8,
          ),
          color: Color.fromARGB(150, 224, 224, 224),
        ),
        child: Image.asset(
          "assets/main_icon.png",
          height: 35.0,
        ),
      ),
      icon: Image.asset(
        "assets/main_icon.png",
        height: 30.0,
      ),
      label: "main",
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromARGB(166, 32, 51, 97),
            width: 1.8,
          ),
          color: Color.fromARGB(150, 224, 224, 224),
        ),
        child: Image.asset(
          "assets/profile_icon.png",
          height: 35.0,
        ),
      ),
      icon: Image.asset(
        "assets/profile_icon.png",
        height: 30.0,
      ),
      label: "main",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _calculateSelectedIndex(BuildContext context) {
      final String location = GoRouterState.of(context).location;
      if (location.startsWith(RoutesEndpoints.main)) {
        return 0;
      }
      if (location.startsWith(RoutesEndpoints.profile)) {
        return 1;
      }
      return 0;
    }

    void _onItemTapped(int index, BuildContext context) {
      switch (index) {
        case 0:
          GoRouter.of(context).go(RoutesEndpoints.main);
          break;
        case 1:
          GoRouter.of(context).go(RoutesEndpoints.profile);
          break;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        actions: [
          VipIconButton(),
        ],
        leadingWidget: LanguagePicker(),
      ),
      body: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 55,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: ColorsUiTheme.mainBorder, width: 2.0),
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                items: _icons,
                // iconSize: 20.0,
                selectedFontSize: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _calculateSelectedIndex(context),
                onTap: (int idx) => _onItemTapped(idx, context),
              ),
            ),
          ),
        ),
        body: _child,
      ),
    );
  }
}
