import 'package:blocapp/utils/utility.dart';
import 'package:blocapp/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
 
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Utility(color: Theme.of(context).colorScheme.tertiary)
                  .alignedCircle(context, 20, -1.2, 1.0),
              Utility(color: Theme.of(context).colorScheme.secondary)
                  .alignedCircle(context, -2.7, -1.2, 1.3),
              Utility(color: Theme.of(context).colorScheme.primary)
                  .alignedCircle(context, 2.7, -1.2, 1.3),
              Utility().backDropFilter(100.0, 100.0),
              MyWidgets().tabar(context, 1.8, tabController),
            ],
          ),
        ),
      ),
    );
  }
}
