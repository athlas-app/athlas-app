import 'package:athlas/src/constants/app_sizes.dart';
import 'package:athlas/src/ui/common/navigation/navigation_bar_controller.dart';
import 'package:athlas/src/ui/common/navigation/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationBarUI extends ConsumerStatefulWidget {
  final List<NavigationBarItem> items;

  const NavigationBarUI({
    Key? key,
    required this.items,
  })  : assert(items.length == 4),
        super(key: key);

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends ConsumerState<NavigationBarUI> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 100),
              painter: BNBCustomPainter(context),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: () => ref
                    .read(navigationBarControllerProvider.notifier)
                    .createMatch(context),
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0.1,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: widget.items
                        .take(2)
                        .map((e) => NavigationBarItemUI(item: e))
                        .toList(),
                  ),
                  gapW64,
                  Row(
                    children: widget.items
                        .sublist(widget.items.length - 2, widget.items.length)
                        .map((e) => NavigationBarItemUI(item: e))
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class BNBCustomPainter extends CustomPainter {
  final BuildContext context;

  BNBCustomPainter(this.context) : super();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
