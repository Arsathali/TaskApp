import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/Task_Provider.dart';
import 'package:intl/intl.dart';


class FirstPage extends StatelessWidget {
  final VoidCallback toggletheme;
  final bool isdarktheme;

  const FirstPage({super.key,required this.toggletheme,required this.isdarktheme});

  @override
  Widget build(BuildContext context) {

    //datetime
    DateTime now =DateTime.now();
    String formatteddate=DateFormat('MMMMd').format(now);


    double taskpercentage=0;

    if(context.watch<MyProvider>().totalcount!=0) {
       taskpercentage = context
          .watch<MyProvider>()
          .donecount / context
          .watch<MyProvider>()
          .totalcount * 100;
    }
    else
      {
         taskpercentage=0;
      }

    return  Scaffold(
        //AppBar Section
        appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Task Manager'),
        centerTitle: true,
          leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
                child:  GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: const CircleAvatar(
                   backgroundImage: AssetImage('assets/image.jpg'),
                   radius: 30,
                            ),
                ),
        ),
    ),

    //Drawer Section
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
         width: 250,
       child: ListView(
            children:  [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed('/profile');
          },
          child: ListTile(
           leading: const Icon(Icons.person),
           title: Text('Profile',style: Theme.of(context).textTheme.titleMedium,),
          ),
        ),
        ListTile(
          leading: const  Icon(Icons.settings),
         title: Text('Settings',style: Theme.of(context).textTheme.titleMedium),
       ),

              GestureDetector(
                onTap: toggletheme,
                child: ListTile(
                  leading:  const Icon(Icons.dark_mode),
                  title: Text('Dark Theme',style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
       ],
       ),
     ),

      //body section

      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        //Column Widget
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
          
              // initial Card
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 30,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  color: const Color.fromRGBO(221, 217, 223, 1.0),
                  child:  Row(
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const Padding(
                             padding: EdgeInsets.all(15.0),
                             child: Text('Task Progress',style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                               color: Colors.black,
                             ),
                             ),
                           ),
                           Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              '${context.watch<MyProvider>().donecount}/${context.watch<MyProvider>().totalcount} Tasks Done',
                              style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color.fromRGBO(106, 103, 103, 1.0),
                            ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,bottom: 20),
                            child: Card(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: const Color.fromRGBO(4, 27, 74, 1.0),
                               child:  Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(
                                   formatteddate,
                                   style: const TextStyle(fontSize: 15,color: Colors.white),
                                 ),
                               ),
                            ),
                          )
                        ],
                      ),
                     const  SizedBox(width: 40,),
          
                      //pie chart
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children:[
                            PieChart(
                            PieChartData(
                              centerSpaceRadius: 35,
                              sections: [
                                PieChartSectionData(
                                  radius: 15,
                                   title: '',
                                   value: taskpercentage,
                                  color:const Color.fromRGBO(4, 27, 74, 1.0)
                                ),
                                PieChartSectionData(
                                  radius: 15,
                                   title: '',
                                   value:100-taskpercentage,
                                    color: Colors.white,
                                )
                              ]
                            )
                          ),
                             Text(
                                 '${taskpercentage.toStringAsFixed(0)} %',
                               style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            color: Colors.black
                            )
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Tasks',style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 30),
              //tasks
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  color: Theme.of(context).primaryColor,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.today_outlined,size: 25),
                      ),
                      const Text('TOTAL TASKS',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text('${context.watch<MyProvider>().totalcount} Tasks',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ), ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  color: Theme.of(context).primaryColor,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.note_alt,size: 25),
                      ),
                      const Text('IN PROGRESS',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                         '${context.watch<MyProvider>().progress()} Tasks',
                        style:  const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              const  SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  color: Theme.of(context).primaryColor,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.file_download_done_rounded,size: 25),
                      ),
                      const Text('DONE',style:  TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                              '${context.watch<MyProvider>().donecount} Tasks',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
