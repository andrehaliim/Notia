import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagController = TextEditingController();
  final descriptionFocusNode = FocusNode();
  bool isVisible = false;
  bool isVisibleTag = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(descriptionFocusNode);
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    tagController.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final panelHeight = MediaQuery.of(context).size.height * 0.33;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new)),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.withAlpha(50),
            width: 1.0,
          ),
        ),
        title: TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'Title',
            border: InputBorder.none
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            onSelected: (value) {
              if (value == 'search') {
              } else if (value == 'add_tag') {
                setState(() {
                  isVisibleTag = !isVisibleTag;
                });
              } else if (value == 'delete') {}
            },
            itemBuilder: (BuildContext context) {
              final screenWidth = MediaQuery.of(context).size.width;

              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'search',
                  child: SizedBox(
                    width: screenWidth / 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Search', style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'add_tag',
                  child: SizedBox(
                    width: screenWidth / 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Add Tag', style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: SizedBox(
                    width: screenWidth / 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Delete Note',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              focusNode: descriptionFocusNode,
              controller: descriptionController,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(border: InputBorder.none),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          Visibility(
            visible: isVisibleTag,
            child: Container(
              margin: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tags',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Spacer(),
                      Text(
                        'Save',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      hintText: 'Create new tag',
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: Icon(Iconsax.hashtag_outline, color: Theme.of(context).colorScheme.primary, size: 20,),
                      suffixIcon: GestureDetector(
                          onTap: (){

                          },
                          child: Icon(Icons.add_circle, color: Theme.of(context).colorScheme.primary, size: 20,)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            left: 16,
            bottom: isVisible ? 16 : -panelHeight,
            child: Container(
              height: panelHeight / 2,
              width: MediaQuery.of(context).size.width * 0.74,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AiToolsWidget(title: 'Format', icon: Iconsax.textalign_left_bold),
                        SizedBox(width: 10),
                        AiToolsWidget(title: 'Summarize', icon: Iconsax.magicpen_bold),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Row(
                      children: [
                        AiToolsWidget(title: 'Grammar', icon: Iconsax.tick_circle_bold),
                        SizedBox(width: 10),
                        AiToolsWidget(title: 'Translate', icon: Iconsax.translate_bold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              child: Icon(!isVisible ? Iconsax.magicpen_bold : Icons.close),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AiToolsWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const AiToolsWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 14),
            SizedBox(width: 5),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
