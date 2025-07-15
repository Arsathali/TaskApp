import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:task_manager_app/Task_Provider.dart';
import 'package:task_manager_app/pages/Added_Task.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  final List<Color> colors=[
    Colors.red,
    Colors.blue,
    Colors.purpleAccent,
    Colors.green,
    Colors.amber,
  ];

  Color getcolor(int index){
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                  child: Text(
                      'Added Task',style: Theme.of(context).textTheme.titleLarge)
              ),
              const Divider(height: 50,),
              Expanded(
                child: Consumer<MyProvider>(
                  builder: (BuildContext context, value, Widget? child) {

                     final data=value.tasks;

                     if(data.isEmpty){
                       return const Center(
                         child: Text('No task Added',style: TextStyle(fontSize: 30,letterSpacing: 2)),
                       );
                     }
                    else {
                       return StackedCardCarousel(
                    type: StackedCardCarouselType.cardsStack,
                    spaceBetweenItems: 410,
                    items: List.generate(
                    data.length,
                    (index) {

                    final datain=data[index];
                    final colordata=getcolor(index);

                    return StackWidget(
                    color: colordata,
                    title: datain['title'],
                    startdate: datain['startdate'],
                    enddate: datain['enddate'],
                      description: datain['description'],
                      datain: datain,
                    );
                    }
                    )
                    );
                     }
                  }
                ),
              ),


            ],
          ),
        ),

      )
    );
  }
}




