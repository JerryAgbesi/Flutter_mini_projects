import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:recipez/components/components.dart';
import 'package:uuid/uuid.dart';
import 'package:recipez/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryItemScreen extends StatefulWidget {
  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final bool isUpdating;
  final GroceryItem? originalItem;

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSlidervalue = 0;

  @override
  void initState() {
    final originalItem = widget.originalItem;

    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSlidervalue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final groceryItem = GroceryItem(
                  name: _name,
                  id: widget.originalItem?.id ?? const Uuid().v1(),
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSlidervalue,
                  date: DateTime(
                    _dueDate.year,
                    _dueDate.month,
                    _dueDate.day,
                    _dueDate.hour,
                    _dueDate.minute,
                  ),
                );

                if (widget.isUpdating) {
                  widget.onUpdate(groceryItem);
                } else {
                  widget.onCreate(groceryItem);
                }
              },
              icon: const Icon(Icons.check)),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildNameField(),
            buildImportanceField(),
            buildDateField(),
            buildTimeField(),
            const SizedBox(
              height: 10,
            ),
            buildColorPicker(context),
            const SizedBox(
              height: 10,
            ),
            buildQuantityField(),
            GroceryTile(
              item: GroceryItem(
                name: _name,
                id: 'preview mode',
                importance: _importance,
                color: _currentColor,
                quantity: _currentSlidervalue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item name',
          style: GoogleFonts.lato(fontSize: 23.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'eg. Egg, 1 bag of rice, Apples',
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
                selectedColor: Colors.black,
                label: const Text(
                  'Low',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _importance == Importance.low,
                onSelected: (selected) {
                  setState(() {
                    _importance = Importance.low;
                  });
                }),
            ChoiceChip(
                selectedColor: Colors.black,
                label: const Text(
                  'Medium',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _importance == Importance.medium,
                onSelected: (selected) {
                  setState(() {
                    _importance = Importance.medium;
                  });
                }),
            ChoiceChip(
                selectedColor: Colors.black,
                label: const Text(
                  'High',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _importance == Importance.high,
                onSelected: (selected) {
                  setState(() {
                    _importance = Importance.high;
                  });
                }),
          ],
        ),
      ],
    );
  }

  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Date',
              style: TextStyle(fontSize: 28.0),
            ),
            TextButton(
                onPressed: () async {
                  final currentDate = DateTime.now();
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 50),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      _dueDate = selectedDate;
                    });
                  }
                },
                child: Text('Select'))
          ],
        ),
        Text('${DateFormat('dd-MM-yyy').format(_dueDate)}'),
      ],
    );
  }

  Widget buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Time of Day',
              style: TextStyle(fontSize: 28.0),
            ),
            TextButton(
                onPressed: () async {
                  final selectedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  if (selectedTime != null) {
                    setState(() {
                      _timeOfDay = selectedTime;
                    });
                  }
                },
                child: Text('Select'))
          ],
        ),
        Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            )
          ],
        ),
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (value) {
                        setState(() {
                          _currentColor = value;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('save'))
                    ],
                  );
                },
              );
            },
            child: Text('Select'))
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Quantity', style: GoogleFonts.lato(fontSize: 28)),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              _currentSlidervalue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18),
            ),
          ],
        ),
        Slider(
            divisions: 100,
            max: 100,
            min: 0,
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            value: _currentSlidervalue.toDouble(),
            label: _currentSlidervalue.toInt().toString(),
            onChanged: (value) {
              setState(() {
                _currentSlidervalue = value.toInt();
              });
            })
      ],
    );
  }
}
