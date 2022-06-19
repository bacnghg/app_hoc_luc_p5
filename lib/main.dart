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

  void xepLoai(diemTB) {
    if (diemTB! >= 9) {
      hocLuc = "Giỏi";
    } else if (diemTB! < 9 && diemTB! >= 7) {
      hocLuc = "Khá";
    } else if (diemTB! < 7 && diemTB! >= 5) {
      hocLuc = "Trung bình";
    } else {
      hocLuc = "Yếu";
    }
  }

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
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
          child: Column(children: [
            // TextField: Điểm toán
            inputWidget(
                labelText: "Điểm Toán",
                hintText: "Nhập điểm toán",
                controller: diemToanController),
            // TextField: Điểm Văn
            inputWidget(
                labelText: "Điểm Văn",
                hintText: "Nhập điểm Văn",
                controller: diemVanController),
            // TextFiel: Điểm anh
            inputWidget(
                labelText: "Điểm Anh",
                hintText: "Nhập điểm Anh",
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

                  xepLoai(diemTBDB);
                });
              },
              child: Text("Kiểm tra Điểm Trung Bình"),
            ),
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
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ));
}
