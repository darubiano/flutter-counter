import 'package:flutter/material.dart';
import 'package:hello_world_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  double calcularSize(Size size, double percent) {
    return (size.width < size.height)
        ? size.width * percent
        : size.height * percent;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      backgroundColor: colors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: IconButton(
              onPressed: () {
                themeProvider.changeTheme();
              },
              icon: const Icon(Icons.color_lens),
            ),
          ),
          FittedBox(
            child: Text('$clickCounter',
                style: TextStyle(
                  fontSize: calcularSize(size, 0.2),
                  fontWeight: FontWeight.w400,
                )),
          ),
          FittedBox(
            child: Text(
              "Click${clickCounter > 0 ? 's' : ''}",
              style: TextStyle(fontSize: calcularSize(size, 0.1)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: Icons.exposure_minus_1_outlined,
                color: Colors.redAccent,
                size: calcularSize(size, 0.25),
                onPressed: () {
                  // if (clickCounter == 0) return;
                  clickCounter--;
                  setState(() {});
                },
              ),
              SizedBox(width: calcularSize(size, 0.05)),
              CustomButton(
                icon: Icons.refresh_rounded,
                size: calcularSize(size, 0.25),
                onPressed: () {
                  clickCounter = 0;
                  setState(() {});
                },
              ),
              SizedBox(width: calcularSize(size, 0.05)),
              CustomButton(
                icon: Icons.plus_one,
                color: Colors.greenAccent,
                size: calcularSize(size, 0.25),
                onPressed: () {
                  clickCounter++;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double? size;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.icon,
      this.color = Colors.black26,
      required this.onPressed,
      this.size});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        // shape: const StadiumBorder(),
        enableFeedback: true,
        backgroundColor: color,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
