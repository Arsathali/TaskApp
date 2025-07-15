import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/Task_Provider.dart';
import 'package:task_manager_app/main.dart';


class StackWidget extends StatefulWidget {

  final Color  color;
  final String title;
  final DateTime startdate;
  final DateTime enddate;
  final String description;
  final Map<String,dynamic> datain;

  const StackWidget({
    super.key,
    required this.color,
    required this.title,
    required this.enddate,
    required this.startdate,
    required this.description,
    required this.datain,
  });

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {

  @override
  Widget build(BuildContext context) {

    //changing datetime into String
    String modifiedstartdate=DateFormat('dd/MM/yyyy').format(widget.startdate);
    String modifiedenddate=DateFormat('dd/MM/yyyy').format(widget.enddate);

    return Column(
      children: [
        Container(
          width:double.infinity,
          child: Card(
            elevation:30,
            color: widget.color,
            // color: widget.coloring,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text('Title of Task',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                ),
                const SizedBox(height: 20),
                Text( widget.title,
                    style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color.fromARGB(
                        255, 250, 248, 250)
                    )
                ),
                const SizedBox(height: 20),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Start Date',style: TextStyle(color: Colors.white),),
                    Text('End Date',style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(modifiedstartdate,
                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(modifiedenddate,
                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Have You Completed The Task ????',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white
                    )
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const  SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed:(){
                Navigator.pushNamed(context, '/piechart',arguments: {
                  'startdate':modifiedstartdate,
                  'enddate' :modifiedenddate,
                }
                );
              },
              label: const Text('In Progress'),
              icon: const  Icon(Icons.hourglass_bottom_outlined),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 10,
              ),
            ),
            ElevatedButton.icon(
              onPressed:(){
                Provider.of<MyProvider>(context,listen: false).removetask(widget.datain);
              },
              label: const Text('Done'),
              icon: const  Icon(Icons.download_done_rounded),
              style: TextButton.styleFrom(
                elevation: 10,
                backgroundColor: widget.color,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}