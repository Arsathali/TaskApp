import 'package:flutter/material.dart';
import 'package:task_manager_app/pages/First_page.dart';
import 'package:task_manager_app/pages/Second_page.dart';
import 'package:task_manager_app/pages/Third_page.dart';

class HomePage extends StatefulWidget {
  
  final VoidCallback toggletheme;
  final bool isdarktheme;

  const HomePage({super.key,required this.toggletheme,required this.isdarktheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   pages= [FirstPage(toggletheme: widget.toggletheme,isdarktheme: widget.isdarktheme),const  SecondPage(), const ThirdPage()];
  }


 int selectedindex=0;

 void onpressed(index){
   setState(() {
     selectedindex=index;
   });

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: IndexedStack(
             index: selectedindex,
             children: pages,
         ),
      //Bottom Navigation Bar

      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.black,
        currentIndex: selectedindex,
        selectedItemColor:  Colors.white,
        unselectedItemColor: Colors.white,
        onTap: onpressed,
        showSelectedLabels: false,
          items:const  [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,size: 40),
                label: '',
                tooltip: 'Home',

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined,size: 40),
                label: '',
                tooltip: 'Add Tasks',

            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month,size: 40),
              label: '',
              tooltip: 'Added Tasks',
          ),
          ]
      ),
    );
  }
}
