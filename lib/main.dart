import 'package:bmi_march_26/screen/screen_info.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),import 'package:flutter/material.dart';
    import 'package:movie_app_march26/splash/presentation/splash_screen.dart';

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
    theme: ThemeData(
    // This is the theme of your application.
    //
    // TRY THIS: Try running your application with "flutter run". You'll see
    // the application has a purple toolbar. Then, without quitting the app,
    // try changing the seedColor in the colorScheme below to Colors.green
    // and then invoke "hot reload" (save your changes or press the "hot
    // reload" button in a Flutter-supported IDE, or press "r" if you used
    // the command line to start the app).
    //
    // Notice that the counter didn't reset back to zero; the application
    // state is not lost during the reload. To reset the state, use hot
    // restart instead.
    //
    // This works for code too, not just values: Most code changes can be
    // tested with just a hot reload.
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    home:  SplashScreen(),
    );
    }
    }
      home: const MyHomePage(title:'Flutter Demo Home Page'),
    );

  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage>createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.end,children: <Widget>[
        Image.asset('assets/first_img.png'),
        Container(
          width: 450,
          height: 470,
          decoration: BoxDecoration(
            color: Color(0xff7876CD),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
            child:Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                  style: TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 50,),
                Text(
                  'It takes just 30 seconds – and your health is worth it!',
                  style: TextStyle(color: Color(0xffF8F9FFE5),fontSize:16,fontWeight: FontWeight.w500

                  ),

                ),
                SizedBox(height: 40,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreen()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xff484783),
                    ),
                    child: const Text("Get Started"
                      ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,),),
                  ),
                ),

              ],
            ),

          ),
        ),
      ],
      ),
    );
  }
}
    