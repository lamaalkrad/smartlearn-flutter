import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة تحكم الأدمن'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // كروت الإحصائيات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                StatCard(title: 'الطلاب', count: 120),
                StatCard(title: 'الأساتذة', count: 15),
                StatCard(title: 'كورسات معلقة', count: 4),
              ],
            ),
            const SizedBox(height: 20),

            // قائمة الكورسات
            const Text("كورسات بحاجة للمراجعة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CourseItem(courseName: "دورة Flutter", instructorName: "أ. أحمد"),
            CourseItem(courseName: "دورة Laravel", instructorName: "د. رنا"),
            const SizedBox(height: 20),

            // قائمة الدروس
            const Text("الدروس داخل كورس معين",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            LessonItem(title: "مقدمة", onDelete: () {}),
            LessonItem(title: "ربط الواجهة مع API", onDelete: () {}),
            const SizedBox(height: 20),

            // قائمة المستخدمين
            const Text("المستخدمون",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            UserItem(name: "الأستاذ محمود", role: "أستاذ", onBan: () {}),
            UserItem(name: "الطالبة سارة", role: "طالبة", onBan: () {}),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final int count;

  const StatCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('$count',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String courseName;
  final String instructorName;

  const CourseItem(
      {super.key, required this.courseName, required this.instructorName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(courseName),
        subtitle: Text("بواسطة: $instructorName"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;

  const LessonItem({super.key, required this.title, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String name;
  final String role;
  final VoidCallback onBan;

  const UserItem(
      {super.key, required this.name, required this.role, required this.onBan});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(role),
        trailing: IconButton(
            icon: const Icon(Icons.block, color: Colors.red), onPressed: onBan),
      ),
    );
  }
}
