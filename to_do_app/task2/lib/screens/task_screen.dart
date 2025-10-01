import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

/// A model class to represent a single to-do task.
class Task {
  final String title;
  final String description;
  final DateTime dueDate;
  final String priority;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
  });
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedPriority = 'Medium';
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  // ✨ 1. A list to store all the created tasks.
  final List<Task> _tasks = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 5),
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  /// ✨ 2. Updated submit logic to add the task to the list and reset the form.
  void _submitTask() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a due date.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Create a new Task object from the form data
    final newTask = Task(
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _selectedDate!,
      priority: _selectedPriority,
    );

    // Add the new task to our list and update the UI
    setState(() {
      _tasks.add(newTask);
    });

    // Clear the form fields for the next task
    _titleController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedDate = null;
      _selectedPriority = 'Medium';
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task added successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Helper to get priority color
  //Color _getPriorityColor(String priority) {
  //   switch (priority) {
  //     case 'High':
  //      return Colors.red.shade300;
  //    case 'Medium':
  //      return Colors.orange.shade300;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Task Title'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a title.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No due date selected'
                              : 'Due: ${DateFormat.yMd().format(_selectedDate!)}',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: _presentDatePicker,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitTask,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Add Task'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const Text(
              'Your Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text('No tasks yet. Add one above!'))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Checkbox(
                              value: task.isCompleted,
                              onChanged: (bool? value) {
                                setState(() {
                                  task.isCompleted = value!;
                                });
                              },
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.yMd().format(task.dueDate),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                //color: _getPriorityColor(task.priority),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                task.priority,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
