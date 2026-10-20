import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// ---------- Data Model ----------
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Abenoja, Jimmy D.',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'abenoja.jimmy@csucc.edu.ph',
  ),
  Student(
    name: 'Masicampo, Laarni May M.',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'masicampo.laarni@csucc.edu.ph',
  ),
  Student(
    name: 'Llanto, Khen L.',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'llanto.khen@csucc.edu.ph',
  ),
  Student(
    name: 'Shella Tanan',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'shella.tanan@csucc.edu.ph',
  ),
  Student(
    name: 'Mia Dela Cruz',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'mia.delacruz@csucc.edu.ph',
  ),
];

// ---------- App Root ----------
// Stateless: the app configuration never changes at runtime.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Customization 1: custom theme seed color (teal).
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// ---------- Screen ----------
// Stateless: the list of students is fixed; nothing on screen changes.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 8),
          ...students.map((s) => StudentCard(student: s)),
        ],
      ),
    );
  }
}

// ---------- Section Header ----------
// Stateless: displays a fixed title passed via constructor.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // Customization 2: bold, colored heading text style.
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        const Divider(thickness: 1),
      ],
    );
  }
}

// ---------- Info Row ----------
// Stateless: shows an icon + text; both are final fields.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.grey[800]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ---------- Student Card ----------
// Stateless: renders one Student passed in; data never changes.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      // Customization 3: rounded card corners.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              // Customization 4: avatar uses primary color.
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              child: Text(
                student.name[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    // Customization 5: bold name text style.
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    student.course,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  const SizedBox(height: 4),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}