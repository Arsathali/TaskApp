import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/Task_Provider.dart';



class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


  final TextEditingController _controller1=TextEditingController();
  final TextEditingController _controller2 =TextEditingController();
  final TextEditingController _controller3=TextEditingController();
  final TextEditingController _controller4=TextEditingController();


  // Calendar input

  DateTime? selecteddatestart;
  DateTime? selecteddateend;

  Future<void> onpressed() async {
    DateTime? picked = await showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.deepPurple,
                // Header background color & selected dates
                onPrimary: Colors.white,
                // Header text color & selected date text color
                onSurface: Colors.deepPurple, // Text color for other dates
              ),
              dialogBackgroundColor: Colors
                  .lightBlue[50], // Calendar background color
            ),
            child: child!,
          );
        }
    );


    if (picked != null && picked != selecteddatestart) {
      setState(() {
        selecteddatestart = picked;
        _controller2.text= '${selecteddatestart!.day}/${selecteddatestart?.month}/${selecteddatestart!.year}';
      });
    }
  }

    Future<void> onpressed1() async {
      DateTime? picked = await showDatePicker(

        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.deepPurple,
                  // Header background color & selected dates
                  onPrimary: Colors.white,
                  // Header text color & selected date text color
                  onSurface: Colors.deepPurple, // Text color for other dates
                ),
                dialogBackgroundColor: Colors
                    .lightBlue[50], // Calendar background color
              ),
              child: child!,
            );
          }
      );
      if (picked != null && picked != selecteddateend) {
        setState(() {
          selecteddateend = picked;
          _controller3.text='${selecteddateend!.day}/${selecteddateend?.month}/${selecteddateend!.year}';
        });

      }
  }

  // Save the inputs

  void saving() {
        if(_controller1.text.isNotEmpty && _controller2.text.isNotEmpty && _controller3.text.isNotEmpty && _controller4.text.isNotEmpty){
          context.read<MyProvider>().addtask(
            {
              'title': _controller1.text,
              'startdate': selecteddatestart,
              'enddate':selecteddateend,
              'description':_controller4.text,
            }
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: const Text('successfully Saved....',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w400,color: Colors.white54),))
          );
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text('Please Select all',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w400,color: Colors.white54)))
          );
        }
  }

  @override
  Widget build(BuildContext context) {
    
    print(Provider.of<MyProvider>(context).tasks);

    return Scaffold(
      body: Stack(
        children: [
          // First Container
          Positioned.fill(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text('Add Task', style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Create New Task',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 126, 128, 126)),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/notepad.png', height: 45, width: 40,),
                        const SizedBox(width: 20),
                        const Text('Title', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                     TextField(
                      controller:_controller1,
                      decoration: const InputDecoration(
                        hintText: 'Enter The Title of Your Task',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 126, 128, 126),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Second Container with SingleChildScrollView
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3, // Adjust the position as needed
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35),
                      const Text('Select Date',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black)
                      ),
                      const SizedBox(height: 20),
                      const Text('Start Date :',
                          style: TextStyle(color: Color.fromARGB(255, 77, 80, 77))
                      ),
                      TextField(
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        
                        controller: _controller2,
                        onTap: onpressed,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          hintText: selecteddatestart != null
                              ? '${selecteddatestart!.day}/${selecteddatestart?.month}/${selecteddatestart!.year}'
                              : 'DD/MM/YYYY',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 126, 128, 126),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('End Date :',
                          style: TextStyle(color: Color.fromARGB(255, 77, 80, 77))
                      ),
                      TextField(
                        readOnly: true,
                        controller: _controller3,
                        onTap: onpressed1,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          hintText: selecteddateend != null
                              ? '${selecteddateend!.day}/${selecteddateend?.month}/${selecteddateend!.year}'
                              : 'DD/MM/YYYY',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 126, 128, 126),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('Description :',
                          style: TextStyle(color: Color.fromARGB(255, 77, 80, 77))
                      ),
                       TextField(
                        controller: _controller4,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.description),
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 126, 128, 126),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _controller1.text='';
                                _controller2.text='';
                                _controller3.text='';
                                _controller4.text='';
                              });
                            },
                            child: SizedBox(
                              width: 130,
                              height: 70,
                              child: Card(
                                elevation: 10,
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Align(
                                  child: Text('Cancel', style: Theme.of(context).textTheme.titleMedium),
                                ),
                              ),
                            ),
                          ),

                          // save button

                          GestureDetector(
                            onTap: saving,
                            child: SizedBox(
                              width: 130,
                              height: 70,
                              child: Card(
                                elevation: 10,
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                color: const Color.fromRGBO(224, 130, 239, 1.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Save', style: Theme.of(context).textTheme.titleMedium),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


