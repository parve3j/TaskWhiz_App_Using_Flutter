import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
class UpdatedTaskModel extends StatefulWidget {
  final Todo todo;
  final Function(String) onTodoUpdate;
  const UpdatedTaskModel({super.key, required this.todo, required this.onTodoUpdate});

  @override
  State<UpdatedTaskModel> createState() => _UpdatedTaskModelState();
}

class _UpdatedTaskModelState extends State<UpdatedTaskModel> {
  late TextEditingController todoTEController;
  @override
  void initState() {
    // TODO: implement initState
    todoTEController= TextEditingController(text: widget.todo.details);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Update todo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: (){
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
            controller: todoTEController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Enter your todo here',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: (){
              widget.onTodoUpdate(todoTEController.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Update'),
          )
        ],
      ),
    );
  }
}
