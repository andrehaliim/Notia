import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notia/themes/theme_provider.dart';
import 'package:notia/ui/create_note.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notia', style: Theme
            .of(context)
            .textTheme
            .titleLarge),
        titleSpacing: MediaQuery
            .of(context)
            .size
            .width / 20,
        actions: [
          IconButton(
            onPressed: () {
              final provider = Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(!provider.isDarkMode);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                themeProvider.isDarkMode ? Icons.sunny : Icons.nightlight,
                size: 20,
                key: ValueKey<bool>(themeProvider.isDarkMode),
              ),
            ),
          ),
        ],
      ),
      body: NoteListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote()));
        },
        child: Icon(Iconsax.note_text_bold, size: 30,),
      ),
    );
  }
}

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = ['Work', 'Home', 'Personal', 'Ideas', 'Urgent'];

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Builder(
          builder: (builderContext) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(builderContext)
                                  .colorScheme
                                  .secondary,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              tags[index % tags.length],
                              style: Theme
                                  .of(builderContext)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                  color: Theme
                                      .of(builderContext)
                                      .colorScheme
                                      .primary,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Jan 14, 2025',
                            style: Theme
                                .of(builderContext)
                                .textTheme
                                .bodySmall,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Note Title ${index + 1}',
                      style: Theme
                          .of(builderContext)
                          .textTheme
                          .titleLarge,
                    ),
                    Text(
                      'This is the description for note number ${index +
                          1}. This is the description for note number ${index + 1}.',
                      style: Theme
                          .of(builderContext)
                          .textTheme
                          .bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
