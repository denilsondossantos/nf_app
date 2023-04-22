import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/first_home_page.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/second_home_page.dart';
import '../../widgets/nfe_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with TickerProviderStateMixin {
  final ValueNotifier<int> _pageIndex = ValueNotifier(0);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _pageIndex.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _setAppBarText() {
    String textAppBar = '';
    switch (_pageIndex.value) {
      case 0:
        textAppBar = 'Cadastrar nova nota';
        break;
      case 1:
        textAppBar = 'Historico minhas notas';
        break;
      default:
    }
    return textAppBar;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _pageIndex,
        builder: (context, value, _) {
          return Scaffold(
            appBar: NFeAppBar(title: _setAppBarText()),
            bottomNavigationBar: SafeArea(
              child: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Cadasto nota',
                    icon: Icon(Icons.qr_code_scanner, size: 26),
                  ),
                  Tab(
                    text: 'Histórico',
                    icon: Icon(Icons.history_edu_rounded, size: 30),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      FirstHomePage(),
                      SecondHomePage(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
