import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  late TextEditingController paymentController;
  late GlobalKey<FormState> paymentForm;
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    super.initState();
    paymentController = TextEditingController();
    paymentForm = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment Example'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Product(),
    );
  }
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemSize =
        context.calculateItemSize(numberOfItems: 3, padding: 0, spacing: 6);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            TabBar(
              tabs: const <Widget>[
                Tab(
                  text: 'one',
                ),
                Tab(
                  text: 'two',
                ),
                Tab(
                  text: 'three',
                ),
              ],
              controller: tabController,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  tabController.animateTo(index);
                });
              },
            ),
            IndexedStack(
              index: selectedIndex,
              children: <Widget>[
                kaka(itemSize: itemSize),
                Visibility(
                  child: Text('test2'),
                  maintainState: true,
                  visible: selectedIndex == 1,
                ),
                Visibility(
                  child: Text('test3'),
                  maintainState: true,
                  visible: selectedIndex == 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class kaka extends HookWidget {
  const kaka({super.key, required this.itemSize});

  final double itemSize;

  @override
  Widget build(BuildContext context) {
    final List<int> a = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 6.0,
          runSpacing: 6.0,
          children: a.map((number) {
            return GestureDetector(
              child: Container(
                width: itemSize,
                height: itemSize,
                decoration:
                    BoxDecoration(color: Colors.red, border: Border.all()),
              ),
            );
          }).toList(),
        ),
        Text('kkakakak'),
        Text('kkakakak'),
        Text('kkakakak'),
        Text('kkakakak'),
        Text('kkakakak'),
      ],
    );
  }
}
