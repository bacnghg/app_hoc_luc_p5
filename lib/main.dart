import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController diemToanController = TextEditingController();
  TextEditingController diemVanController = TextEditingController();
  TextEditingController diemAnhController = TextEditingController();
  int diemToan = 0;
  int diemVan = 0;
  int diemAnh = 0;
  String hocLuc = "Chưa xác định";
  double diemTBDB = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(children: [
            // TextField: Điểm toán
            inputWidget(
                labelText: "Điểm Toán",
                hintText: "Nhập điểm toán",
                controller: diemToanController),
            // TextField: Điểm Văn
            inputWidget(
                labelText: "Điểm Toán",
                hintText: "Nhập điểm toán",
                controller: diemVanController),
            // TextFiel: Điểm anh
            inputWidget(
                labelText: "Điểm Toán",
                hintText: "Nhập điểm toán",
                controller: diemAnhController),
            // Button show:
            // Tính điểm trung bình, showw, đánh giá
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    diemToan = int.parse(diemToanController.text);
                    diemVan = int.parse(diemVanController.text);
                    diemAnh = int.parse(diemAnhController.text);
                    diemTBDB = ((diemToan + diemAnh + diemVan) / 3);

                    if (diemTBDB >= 9.0) {
                      hocLuc = "Giỏi";
                    } else if (diemTBDB < 9.0 && diemTBDB >= 7.0) {
                      hocLuc = "Khá";
                    } else if (diemTBDB < 7.0 && diemTBDB >= 5.0) {
                      hocLuc = "Trung bình";
                    } else {
                      hocLuc = "Yếu";
                    }
                  });
                },
                child: Text("Tính tuổi")),
            const SizedBox(
              height: 30,
            ),
            // Card: show
            Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                      child: Text(
                          "Điểm Trung Bình: ${diemTBDB}. \nHọc sinh xếp loại học lực: ${hocLuc} ")),
                )))
          ]),
        ),
      ),
    );
  }
}

// Tạo 1 widget bằng hàm
Widget inputWidget(
    {required String labelText,
    required String hintText,
    required controller}) {
  return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ));
}

// void xepLoai(diemTBDB) {
//   if (diemTBDB! >= 9) {
//     hocLuc = "Giỏi";
//   } else if (diemTBDB! < 9 && diemTBDB! >= 7) {
//     hocLuc = "Khá";
//   } else if (diemTBDB! < 7 && diemTBDB! >= 5) {
//     hocLuc = "Trung bình";
//   } else {
//     hocLuc = "Yếu";
//   }
// }
