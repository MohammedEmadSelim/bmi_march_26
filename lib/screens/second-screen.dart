import 'package:bmi_march_26/components/Components.dart';
import 'package:bmi_march_26/models/bmi_model.dart';
import 'package:bmi_march_26/screens/last-screen.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int gender =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20 , right: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text('BMI',
                  style: TextStyle(
                    letterSpacing: 10,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff01502E),
                  ),),
                ),
                const SizedBox(
                  height: 15,
                ),
                Label(text: 'Name'),
                SizedBox(
                  height: 12,
                ),
                CustomInputField(
                    controller: nameController,
                    validator: (value){
                      if(value ==null || value.isEmpty){
                        return "Name is required";
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                Label(text: 'Birth Date'),
                SizedBox(
                  height: 12,
                ),
                CustomInputField(controller: birthDateController ,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1980),
                          lastDate: DateTime(2020));

                      if(pickedDate != null){
                        birthDateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                    validator: (value){
                      if(value ==null || value.isEmpty){
                        return "Birth Date is required";
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                Label(text: 'Choose Gender'),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender =0;
                          print(gender);
                        });
                      },
                      child: Container(
                        width: 125,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 237, 252, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.5,
                            color: gender == 0 ? Colors.blue : Color.fromRGBO(65, 64, 115, 0.11),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/man.png"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender = 1;
                          print(gender);
                        });
                      },
                      child: Container(
                        width: 125,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 237, 252, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.5,
                            color: gender == 1 ? Colors.blue : Color.fromRGBO(65, 64, 115, 0.11),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/female.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Label(text: 'Your Height(cm)'),
                SizedBox(
                  height: 12,
                ),
                CalculatedInputField(
                  controller: heightController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Height is required";
                    }
                    final height = double.tryParse(value);
                    if (height == null) {
                      return "Enter a valid height";
                    }
                    if (height <= 0) {
                      return "Height must be greater than 0";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Label(text: 'Your Weight(kg)'),
                SizedBox(
                  height: 12,
                ),
                CalculatedInputField(
                  controller: WeightController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Weight is required";
                    }
                    final weight = double.tryParse(value);
                    if (weight == null) {
                      return "Enter a valid weight";
                    }
                    if (weight <= 0) {
                      return "Weight must be greater than 0";
                    }
                    return null;
                  }
                ),
                SizedBox(
                  height: 25,
                ),
                    Center(
            child: SizedBox(
              height: 40,
              width: 350,
              child: ElevatedButton (
                onPressed:  () async{
                  if(formKey.currentState!.validate()){
                    var res = await getData(
                      height: heightController.text,
                      weight: WeightController.text,
                    );
                    var bmi = BmiResponse.fromJson(res.data);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                            builder: (context)=> ResultScreen(
                              bmi: bmi,
                              name: nameController.text,
                              birthdate: birthDateController.text,
                              gender: gender,
                            ),
                        ),
                    );
                  }
                  },
                child: Text("Calculate BMI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff484783),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
            ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
