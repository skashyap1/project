
import 'package:flutter/material.dart';
import 'bmiresult.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

calcBMI({double height = 0.0, double weight = 0.0}) {
  height = height / 100;
  double bmiValue =
      (weight / (height * height)); //weight in KG and height in meter
  return bmiValue;
}

class _FirstPageState extends State<FirstPage> {
  double sliderValue = 100.0;
  double weight = 40.0;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(196, 0, 1, 3),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Column(
                  children: [
                    Icon(
                      Icons.male,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      "MALE",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Column(
                  children: [
                    Icon(
                      Icons.female,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      "FEMALE",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            // height: 20,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.87,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "HEIGHT",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  sliderValue.toString().substring(0, 5),
                  style: const TextStyle(color: Colors.white, fontSize: 60),
                ),
                // Text.rich(textSpan)

                // Row(
                //   children: [
                //     Text(
                //       "180",
                //       style: TextStyle(color: Colors.white, fontSize: 60),
                //     ),
                //     Text(
                //       "cm",
                //       style: TextStyle(color: Colors.white, fontSize: 30),
                //     )
                //   ],
                // )
                // const TextField(),
                Slider(
                    min: 100.0,
                    max: 250.0,
                    value: sliderValue,
                    onChanged: (value) {
                      sliderValue = value;
                      setState(() {});
                    })
              ],
            ),
          ),
          SizedBox(
            // height: 20,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "WEIGHT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      weight.toString().substring(0, 4),
                      style: const TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              weight--;
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove)),
                        IconButton(
                            onPressed: () {
                              weight++;
                              setState(() {});
                            },
                            icon: const Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "AGE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      age.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              age--;
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove)),
                        IconButton(
                            onPressed: () {
                              age++;
                              setState(() {});
                            },
                            icon: const Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            // height: 20,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              double finalBMI = calcBMI(height: sliderValue, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RESULTPAGE(
                            BMIVALUE: finalBMI,
                          )));
            },
            child: Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
