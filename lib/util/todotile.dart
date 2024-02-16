import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onChanged;
  final Function(BuildContext?) onDelete;
  const TodoTile({
    super.key,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => onDelete(context),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.deepPurple,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
