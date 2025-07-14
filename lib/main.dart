import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}
class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{

  String modo = "autonomous";

  Color getColor(String mode){
    switch(mode){
      case "autonomous":
      return Colors.greenAccent;
      case "teleop":
      return Colors.lightBlueAccent;
      case "disable":
      return Colors.redAccent;
      case "test":
      return Colors.deepPurpleAccent;
      case "simulation":
      return Colors.orangeAccent;
      default:
      return Colors.black;
    }


}
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,

        home: Scaffold(
          appBar: AppBar(
            title: Text("FRC table"),
            backgroundColor: getColor(modo),
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton(
                      value: modo, 
                      items: <String>[
                      'autonomous',
                      'teleop',
                      'disable',
                      'test', 
                      'simulation'
                      ].map((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value));
                      }).toList(), 
                      onChanged: (String? newValue){
                        setState(() {
                          modo = newValue!;
                          print("o modo selecionado foi o: $modo");
                        });
                      }),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        height: 50,
                        width: 100,
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                        color: getColor(modo),
                        borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: getColor(modo).withValues(),
                              offset: Offset(2, 2),
                            )
                          ]
                        ),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              print("o botão foi pressionado e o modo selecionado foi o: $modo");
                            });
                          }, child: Text("aperte")),
                        )
                  ],
                ),
              )
            ],
          )
        )
      );
 }
}