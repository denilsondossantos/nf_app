import 'package:flutter/material.dart';
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
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NFeAppBar(),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Ler QR',
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
              children: [
                SingleChildScrollView(
                    child: Container(
                  height: 400,
                  color: Theme.of(context).colorScheme.background,
                )),
                SingleChildScrollView(
                    child: Container(
                  height: 400,
                  color: Colors.red,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
