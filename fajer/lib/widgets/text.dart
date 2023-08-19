class AppText {
  static final artext = {
    'std_name': 'كامل عبد الرزاق الرفاعي',
    'admin': 'إدارة مدرسة الفجر الخاصة',
    '7s1': 'اللغة العربية (القواعد)',
    '7s2': 'الرياضيات (الجبر و الهندسة)',
    '7s3': 'الفيزياء و الكيمياء',
    's1': 'اللغة العربية (القواعد)',
    's2': 'الرياضيات (الجبر و الهندسة)',
    's3': 'الفيزياء و الكيمياء',
    's4': 'العلوم العامة',
    's1m': '234/240',
    's2m': '240/240',
    's3m': '70/80',
    's4m': '78/80',
    'note1': 'ملاحظة : الانتباه الى\nالاعراب و الاملاء\nو قاعدة العدد 1',
    'note2': 'ملاحظة : الانتباه الى\nالاعراب و الاملاء\nو قاعدة العدد 2',
    'note3': 'ملاحظة : الانتباه الى\nالاعراب و الاملاء\nو قاعدة العدد 3',
    'note4': 'ملاحظة : الانتباه الى\nالاعراب و الاملاء\nو قاعدة العدد 4',
  };
}
//SingleChildScrollView(
//          child: StreamBuilder<QuerySnapshot>(
//              stream: FirebaseFirestore.instance
//                  .collection('complaints')
//                  .orderBy('Time', descending: true)
//                  .snapshots(),
//              builder: (context, snapshot) {
//                if (snapshot.hasError) {
//                  return const Error_login();
//                }
//                if (snapshot.connectionState == ConnectionState.waiting) {
//                  return const Loading();
//                }
//                var docs = snapshot.data!.docs;
//                return ListView.builder(
//                  controller: _controller,
//                  physics: const AlwaysScrollableScrollPhysics(),
//                  shrinkWrap: true,
//                  scrollDirection: Axis.vertical,
//                  itemCount: docs.length,
//                  itemBuilder: (context, index) {
//                    return ListTile(
//                      onTap: () {},
//                      subtitle: Text(
//                        docs[index]['body'],
//                        textAlign: TextAlign.right,
//                      ),
//                      leading: const Icon(
//                        Icons.error,
//                        color: Colors.red,
//                      ),
//                      title: Text(
//                        docs[index]['title'],
//                        textAlign: TextAlign.right,
//                      ),
//                    );
//                  },
//                );
//              }),
//        ),