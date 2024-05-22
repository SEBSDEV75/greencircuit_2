// ignore_for_file: unused_field, avoid_web_libraries_in_flutter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greencircuit/widgets/post_widget.dart';

import '../core/constants.dart';
import '../pages_learn/baterias/baterias.dart';
import '../pages_learn/cables/cables.dart';
import '../pages_learn/computadores/compudatores.dart';
import '../pages_learn/electrodomesticos/electro.dart';
import '../pages_learn/jugetes/jugetes.dart';
import '../pages_learn/moviles/moviles.dart';
import '../pages_learn/tablets/tablets.dart';
import 'explore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 43.0, left: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: SvgPicture.asset(
                  'images/greencircuit.svg',
                  width: 60,
                  height: 40,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 35,
                  color: icons,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExploreScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                child: Text(
                  'Aprende más sobre el reciclaje en dispositivos electronicos',
                  style: TextStyle(
                    fontSize: 15,
                    color: icons2,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    buildNavigationButton(
                        Icons.phone_android, 'Moviles', const MovilesPage()),
                    buildNavigationButton(Icons.computer, 'Computadores',
                        const ComputadoresPage()),
                    buildNavigationButton(
                        Icons.tablet, 'Tablets', const TabletsPage()),
                    buildNavigationButton(
                        Icons.toys, 'Jugetes', const JugetesPage()),
                    buildNavigationButton(Icons.tv, 'Electrodomesticos',
                        const ElectrodomesticosPage()),
                    buildNavigationButton(
                        Icons.battery_0_bar, 'Baterias', const BateriasPage()),
                    buildNavigationButton(
                        Icons.earbuds, 'Cables', const CablesPage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: [
            StreamBuilder(
              stream: _firebaseFirestore
                  .collection('posts')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return PostWidget(snapshot.data!.docs[index].data());
                    },
                    childCount:
                        snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildNavigationButton(IconData icon, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: gray500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
