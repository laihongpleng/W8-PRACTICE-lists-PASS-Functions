//temperature_screen.dart
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback? onBack;

  const TemperatureScreen({super.key, this.onBack});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _fahrenheit;

  void _convert(String value) {
    double? degree = double.tryParse(value);
    if (degree != null) {
      setState(() {
        _fahrenheit = degree * 9 / 5 + 32;
      });
    } else {
      setState(() {
        _fahrenheit = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.onBack != null)
              TextButton(
                onPressed: widget.onBack,
                child: const Text(
                  "← Back",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            const Icon(Icons.thermostat_outlined, size: 120, color: Colors.white),
            const Center(
              child: Text("Converter", style: TextStyle(color: Colors.white, fontSize: 45)),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Celsius:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: _convert,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter a temperature',
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _fahrenheit != null ? _fahrenheit!.toStringAsFixed(2) : 'Enter a value above',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
