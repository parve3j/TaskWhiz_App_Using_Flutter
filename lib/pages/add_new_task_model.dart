import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

class AddNewTaskModel extends StatefulWidget {
  final Function(Todo) onAddTap;

  const AddNewTaskModel({super.key, required this.onAddTap});

  @override
  State<AddNewTaskModel> createState() => _AddNewTaskModelState();
}

class _AddNewTaskModelState extends State<AddNewTaskModel> {
  final TextEditingController todoTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add new todo',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              maxLines: 4,
              controller: todoTEController,
              decoration: const InputDecoration(
                  hintText: 'Enter your todo here',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Enter a value';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Todo todo = Todo(details: todoTEController.text.trim(),
                      createDateTime: DateTime.now(),
                      updatedDatedTime: DateTime.now(),
                    );
                    widget.onAddTap(todo);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
