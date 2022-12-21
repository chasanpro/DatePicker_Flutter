import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class gridtest extends StatefulWidget {
  const gridtest({super.key});

  @override
  State<gridtest> createState() => _gridtestState();
}

class _gridtestState extends State<gridtest> {
  @override
  Widget build(BuildContext context) {
    List menu = [
      "Never Ends",
      "15 Days later",
      "30 Days later",
      "60 Days later",
    ];
    return Material(
      child: Container(
          child: Scrollbar(
        thickness: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: menu.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 25.0,
                            mainAxisSpacing: 40.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2.25,
                          child: MaterialButton(
                            elevation: 0,
                            color: Colors.blue[50],
                            onPressed: () {
                              print(menu[index]);
                            },
                            child: Center(
                              child: Text(
                                '${menu[index]}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: MaterialButton(
                    child: const Text("Button"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
