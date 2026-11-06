
import 'package:flutter/material.dart';

import '../app.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

enum ReportState {
  empty,
  loading,
  success,
  error,
}

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _category = 'Task Issue';
  ReportState _state = ReportState.empty;
  String _message = 'No reports have been submitted yet.';

  Future<void> _submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _state = ReportState.loading;
      _message = 'Submitting your report...';
    });

    // Simulated response while no REST API is connected.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (_titleController.text.trim().toLowerCase() == 'error') {
      setState(() {
        _state = ReportState.error;
        _message = 'Something went wrong. Please try again.';
      });
      return;
    }

    setState(() {
      _state = ReportState.success;
      _message = 'Your report was submitted successfully!';
    });
  }

  void _clearForm() {
    _titleController.clear();
    _descriptionController.clear();

    setState(() {
      _category = 'Task Issue';
      _state = ReportState.empty;
      _message = 'No reports have been submitted yet.';
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget _buildStateMessage() {
    IconData icon;
    Color color;

    switch (_state) {
      case ReportState.loading:
        icon = Icons.hourglass_top;
        color = neonCyan;
        break;
      case ReportState.success:
        icon = Icons.check_circle_outline;
        color = Colors.greenAccent;
        break;
      case ReportState.error:
        icon = Icons.error_outline;
        color = Colors.redAccent;
        break;
      case ReportState.empty:
        icon = Icons.inbox_outlined;
        color = Colors.white70;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: neonSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          if (_state == ReportState.loading)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Icon(icon, color: color, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _message,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = _state == ReportState.loading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Report'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Report a Task',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Submit a report about a task or an issue in FocusFlow.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),

                  AppTextField(
                    label: 'Report Title',
                    hint: 'Enter your report title',
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a report title.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    initialValue: _category,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Task Issue',
                        child: Text('Task Issue'),
                      ),
                      DropdownMenuItem(
                        value: 'Bug Report',
                        child: Text('Bug Report'),
                      ),
                      DropdownMenuItem(
                        value: 'Feature Request',
                        child: Text('Feature Request'),
                      ),
                    ],
                    onChanged: isLoading
                        ? null
                        : (value) {
                            if (value != null) {
                              setState(() => _category = value);
                            }
                          },
                  ),

                  const SizedBox(height: 16),

                  AppTextField(
                    label: 'Description',
                    hint: 'Describe your report',
                    controller: _descriptionController,
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a description.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  AppButton(
                    text: 'Submit Report',
                    icon: Icons.send,
                    isLoading: isLoading,
                    onPressed: _submitReport,
                  ),

                  const SizedBox(height: 16),

                  if (_state == ReportState.error)
                    TextButton(
                      onPressed: _submitReport,
                      child: const Text('Retry'),
                    ),

                  if (_state == ReportState.success)
                    TextButton(
                      onPressed: _clearForm,
                      child: const Text('Create Another Report'),
                    ),

                  const SizedBox(height: 20),
                  _buildStateMessage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
