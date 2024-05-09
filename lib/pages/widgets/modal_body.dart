import 'package:flutter/material.dart';

import '../../model/map_point.dart';

class ModalBody extends StatelessWidget {
  const ModalBody({super.key, required this.point});

  final MapPoint point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(point.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text(
              '${point.latitude}, ${point.longitude}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Построить маршрут'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Отмена'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
