import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final tagController = TextEditingController();
  List<String> myTags = ['Work', 'Personal'];
  String? selectedTag;

  @override
  void dispose() {
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content height
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Tags', style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context), // Close dialog
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tagController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Create new tag',
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: Icon(Iconsax.hashtag_outline, color: Theme.of(context).colorScheme.primary, size: 20),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (tagController.text.isNotEmpty) {
                      setState(() {
                        myTags.add(tagController.text);
                        tagController.clear();
                      });
                    }
                  },
                  child: Icon(Icons.add_circle, color: Theme.of(context).colorScheme.primary, size: 24),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: myTags
                      .map(
                        (tag) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTag = tag;
                            });
                          },
                          child: Chip(
                            label: Text(tag),
                            backgroundColor: selectedTag == tag
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.white,
                            deleteIconColor: Theme.of(context).colorScheme.primary,
                            onDeleted: () {
                              setState(() {
                                myTags.remove(tag);
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
