import 'package:flutter/material.dart';
import 'package:flutter_size/flutter_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController? animationController;
  Animation? animation,secondAnimation,thirdAnimation;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));
    secondAnimation = Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: animationController!, curve: const Interval(0.1, 1.0,curve: Curves.fastOutSlowIn)));
    thirdAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController!, curve: const Interval(0.1, 1.0,curve: Curves.fastOutSlowIn)));
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController!,
          builder: (context,child) {
            return Column(
              children: [
                40.verticalSpaceBetweenWidgets,
                Transform(
                  transform: Matrix4.translationValues(animation!.value * context.deviceWidth, 0, 0),
                  child: SizedBox(
                    width: context.width(0.2),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Email'
                      ),
                    ),
                  ),
                ),
                40.verticalSpaceBetweenWidgets,
                Transform(
                  transform: Matrix4.translationValues(secondAnimation!.value * context.deviceWidth, 0, 0),
                  child: SizedBox(
                    width: context.width(0.2),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          labelText: 'Password'
                      ),
                    ),
                  ),
                ),
                40.verticalSpaceBetweenWidgets,
                Transform(transform: Matrix4.translationValues(thirdAnimation!.value * context.deviceWidth, 0, 0),
                    child: ElevatedButton(onPressed: (){
                     if(animationController!.status == AnimationStatus.completed) {
                       debugPrint("\n\nThe completed is print\n\n");
                      animationController!.reset();
                      animationController!.forward();
                     }
                     else {
                       debugPrint("\n\nThe forward is print\n\n");
                     }
                    }, child: const Text('Submit'))),
                40.2.verticalSpaceBetweenWidgets,
              ],
            );
          }
        ),
      ),
    ));
  }
}
