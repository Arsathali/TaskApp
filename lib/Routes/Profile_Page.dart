import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/Task_Provider.dart';
import 'package:task_manager_app/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(246, 188, 246, 1.0),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(246, 188, 246, 1.0) ,
            title: const Text('Profile',style: TextStyle(color: Colors.black),),
            centerTitle: true,
          ),
      body:   Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 600,
                width: 400,
                child: Card(
                  elevation: 40,
                 color: Colors.white54,
                 child: Column(
                   children: [
                     const SizedBox(height:100),
                     const Text('Arsha Arsath',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 3,color: Colors.black)),
                     const SizedBox(height:50),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text(
                             '${context.watch<MyProvider>().totalcount}',
                             style: Theme.of(context).textTheme.titleLarge),
                         Text(
                             '${context.watch<MyProvider>().inprogresscount}',
                             style: Theme.of(context).textTheme.titleLarge),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text('Task Completed',style: Theme.of(context).textTheme.bodyMedium),
                         Text('Task Pending',style: Theme.of(context).textTheme.bodyMedium),
                       ],
                     ),
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(Icons.download_done_rounded,size: 40,),
                        Icon(Icons.hourglass_full_sharp,size: 40,),
                       ],
                     ),
                     const SizedBox(height: 50),
                   ],
                 ),
                ),
              ),
            ),
            const Positioned(
              top: 10,
              left: 10,
              right:10,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image.jpg'),
                radius: 60,
              ),
            ),
          ],
      )
    );
  }
}