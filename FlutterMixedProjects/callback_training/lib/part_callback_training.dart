part of './callback_training.dart';

class _CustomFabButton extends StatefulWidget {
  const _CustomFabButton({
    super.key,
  });

  @override
  State<_CustomFabButton> createState() => _CustomFabButtonState();
}

class _CustomFabButtonState extends State<_CustomFabButton> {
  Color? _color;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: _color,
      label: const Row(
        children: [
          Text("Click!"),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.arrow_circle_up_outlined)
        ],
      ),
      onPressed: () {
        final rNumber = Random().nextInt(10);

        setState(() {
          if (rNumber % 2 == 0) {
            _color = Colors.red;
          } else if (rNumber % 3 == 0) {
            _color = Colors.blue;
          } else {
            _color = Colors.green;
          }
        });
      },
    );
  }
}

class _CustomElevatedButton extends StatefulWidget {
  const _CustomElevatedButton({
    super.key,
    this.onClick,
  });

  final bool Function(int number)? onClick;

  @override
  State<_CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<_CustomElevatedButton> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        onPressed: () {
          final rNumber = Random().nextInt(10);
          final response = widget.onClick?.call(rNumber) ?? false;

          setState(() {
            _backgroundColor = response ? Colors.greenAccent : Colors.redAccent;
          });
        },
        child: const Text("Click and See the New Color!"));
  }
}
