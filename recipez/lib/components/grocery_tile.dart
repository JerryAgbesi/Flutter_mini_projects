import 'package:flutter/material.dart';
import 'package:recipez/models/grocery_item.dart';
import 'package:recipez/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                color: item.color,
                width: 5.0,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        fontSize: 21,
                        decoration: textDecoration,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  buildDate(),
                  const SizedBox(
                    width: 4,
                  ),
                  buidImportance(),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${item.quantity}',
                style: GoogleFonts.lato(
                  fontSize: 21.0,
                  decoration: textDecoration,
                ),
              ),
              buildCheckBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buidImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Meduim',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w800,
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckBox() {
    return Checkbox(
      onChanged: onComplete,
      value: item.isComplete,
    );
  }
}
