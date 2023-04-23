import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                // backgroundColor: MaterialStateProperty.resolveWith<Color>(
                //   (Set<MaterialState> states) {
                //     if (states.contains(MaterialState.pressed))
                //       return Colors.green;
                //     return null; // Use the component's default.
                //   },
                // )
                // : Colors.red,
                ),
            onPressed: () {},
            child: Text(
              'Preparing',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              'Ready',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              'Picked Up',
            ),
          ),
        ],
      ),
    );
  }
}
