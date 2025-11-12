import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LatihanKondisi(),
  ));
}

class LatihanKondisi extends StatefulWidget {
  @override
  State<LatihanKondisi> createState() => _LatihanKondisiState();
}

class _LatihanKondisiState extends State<LatihanKondisi> {
  TextEditingController conKodeBarang = TextEditingController();
  TextEditingController conJumlahBarang = TextEditingController();
  TextEditingController conCaraBeli = TextEditingController();

  String nama_barang = "";
  double harga_barang = 0, total_harga = 0, diskon = 0, total_bayar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Latihan Kondisi")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          runSpacing: 18,
          children: [
            TextField(
              controller: conKodeBarang,
              decoration: const InputDecoration(
                label: Text("Kode Barang"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conJumlahBarang,
              decoration: const InputDecoration(
                label: Text("Jumlah Barang"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conCaraBeli,
              decoration: const InputDecoration(
                label: Text("Cara Beli"),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    // Tombol PROSES
                    onPressed: () {
                      setState(() {
                        switch (conKodeBarang.text.toUpperCase()) {
                          case "AC":
                            nama_barang = "Air Conditioner";
                            harga_barang = 2500000;
                            break;
                          case "HP":
                            nama_barang = "Handphone";
                            harga_barang = 3000000;
                            break;
                          case "STV":
                            nama_barang = "Smart Television";
                            harga_barang = 4500000;
                            break;
                          default:
                            nama_barang = "-";
                            harga_barang = 0;
                        }

                        total_harga =
                            harga_barang * double.parse(conJumlahBarang.text);

                        if (conCaraBeli.text.toUpperCase() == "T") {
                          // Rumus mencari diskon berdasarkan cara beli
                          diskon = 10 / 100 * total_harga;
                        } else {
                          diskon = 0;
                        }

                        // Rumus total bayar
                        total_bayar = total_harga - diskon;
                      });
                    },
                    child: const Text("PROSES"),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    // Tombol KOSONGKAN
                    onPressed: () {
                      setState(() {
                        conKodeBarang.text = "";
                        conJumlahBarang.text = "";
                        conCaraBeli.text = "";
                        nama_barang = "-";
                        harga_barang = 0;
                        total_harga = 0;
                        diskon = 0;
                        total_bayar = 0;
                      });
                    },
                    child: const Text("KOSONGKAN"),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Barang: $nama_barang"),
                Text("Harga Barang: $harga_barang"),
                Text("Total Harga: $total_harga"),
                Text("Diskon: $diskon"),
                Text("Total Bayar: $total_bayar"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
