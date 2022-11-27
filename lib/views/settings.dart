import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_wizard/views/general_widgets/appbar.dart';
import 'package:quiz_wizard/views/general_widgets/general_info.dart';
import 'package:quiz_wizard/views/styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var grades = [1, 2, 3, 4, 5, 6, 7, 8];
  int grade = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isNotSettingPage: false),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Image(
                    image: const AssetImage("assets/emoji.png"),
                    color: greyColor,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Image(
                          image: AssetImage("assets/person.png"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Choose your avatar",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c1.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c2.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c3.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c4.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c5.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c1.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c2.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c3.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c4.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage("assets/c5.png")),
                  ),
                ],
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Grade",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              18.0,
            ),
            child: DropdownButtonFormField(
              value: grade,
              menuMaxHeight: 240,
              iconEnabledColor: mainColor,
              iconDisabledColor: mainColor,
              decoration: InputDecoration(
                  focusColor: mainColor,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  )),
              items: grades.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
              onChanged: (item) {
                setState(() {
                  grade = item ?? 1;
                });

                // print(item);
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 10, right: 10),
                    child: Text(
                      ' SAVE DETAILS',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: GeneralInfo(),
          )
        ],
      ),
    );
  }
}
