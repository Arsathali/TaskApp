import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class PiechartPage extends StatefulWidget {
  const PiechartPage({super.key});

  @override
  State<PiechartPage> createState() => _PiechartPageState();
}

class _PiechartPageState extends State<PiechartPage> {

  
  @override
  Widget build(BuildContext context) {
    

final data=ModalRoute.of(context)?.settings.arguments as Map?;

       //current date
       DateTime now=DateTime.now();
       String formatteddate=DateFormat('dd/MM/yyyy').format(now);

       int startday=int.parse(data?['startdate'].split("/")[0]);
       int endday=int.parse(data?['enddate'].split("/")[0]);
       int today=int.parse(formatteddate.split("/")[0]);


      double percentage=(today-startday)/(endday-startday)*100;

       print(startday);
       print(endday);
       print(today);
       print(percentage);


    return  Scaffold(
      backgroundColor: const Color.fromRGBO(209, 225, 244, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(209, 225, 244, 1.0),
        title: const Text('Pie Chart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 500,
            height: 500,
            child: Stack(
                alignment: Alignment.center,
                children:[
                  PieChart(
                      PieChartData(
                          centerSpaceRadius: 105,
                          sections: [
                            PieChartSectionData(
                                radius: 55,
                                title: '',
                                value:percentage.isNegative? 0 :percentage,
                                color:const Color.fromRGBO(4, 27, 74, 1.0)
                            ),
                            PieChartSectionData(
                              radius: 55,
                              title: '',
                              value: 100-percentage,
                              color: Colors.red,
                            )
                          ]
                      )
                  ),
                      Text(
                      percentage.isNegative
                          ?'0 %'
                          : '${percentage.toStringAsFixed(0)} %',
                      style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
                  ),
                ]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 20,
                height: 20,
                color:const Color.fromRGBO(4, 27, 74, 1.0) ,
              ),
              Container(
                width: 20,
                height: 20,
                color:Colors.red ,
              ),
            ],
          ),
        const  SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Days over',style: TextStyle(color: Color.fromRGBO(4, 27, 74, 1.0) )),
            Text('Days Remaining',style: TextStyle(color: Colors.red),),
        ],
       ),
      ]
      )
    );
  }
}
