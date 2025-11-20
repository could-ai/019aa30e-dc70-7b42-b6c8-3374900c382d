import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق البيئة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // استخدام اللون الأخضر كسمة أساسية للتطبيق ليعكس الطابع البيئي
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Roboto', 
      ),
      // تحديد الصفحة الرئيسية
      home: const EnvironmentHomePage(),
    );
  }
}

class EnvironmentHomePage extends StatelessWidget {
  const EnvironmentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حماية البيئة',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Container(
        // خلفية متدرجة هادئة
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[50]!, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'اختر خدمة للمساهمة في بيئة أفضل',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'معاً نحو مستقبل أخضر ومستدام',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // شبكة الأزرار
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // زرين في كل صف
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1, // نسبة العرض للطول للزر
                  children: const [
                    // الزر 1: إعادة التدوير
                    EcoButton(
                      icon: Icons.recycling,
                      label: 'إعادة التدوير',
                      color: Colors.teal,
                    ),
                    // الزر 2: زراعة الأشجار
                    EcoButton(
                      icon: Icons.forest,
                      label: 'زراعة الأشجار',
                      color: Colors.green,
                    ),
                    // الزر 3: توفير المياه
                    EcoButton(
                      icon: Icons.water_drop,
                      label: 'توفير المياه',
                      color: Colors.blue,
                    ),
                    // الزر 4: الطاقة النظيفة
                    EcoButton(
                      icon: Icons.solar_power,
                      label: 'طاقة نظيفة',
                      color: Colors.orange,
                    ),
                    // الزر 5: الحياة البرية
                    EcoButton(
                      icon: Icons.pets,
                      label: 'الحياة البرية',
                      color: Colors.brown,
                    ),
                    // الزر 6: المشاركة المجتمعية
                    EcoButton(
                      icon: Icons.volunteer_activism,
                      label: 'تطوع معنا',
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ويدجت مخصص للأزرار لتجنب تكرار الكود
class EcoButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const EcoButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          // إجراء عند الضغط (مجرد رسالة توضيحية حالياً)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم اختيار: $label'),
              backgroundColor: color,
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 36, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
