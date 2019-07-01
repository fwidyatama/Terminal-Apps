import 'dart:async';
import 'package:http/http.dart' as http;
const baseUrl = "http://10.2.232.35/api/jadwal";

class fetchAPI {
  static Future getUsers() {
    var url = baseUrl;
    return http.get(url);
  }
}

class Jadwal {
  int id;
  String asal;
  String tujuan;
  String keberangkatan;
  String kedatangan;
  String status;

  Jadwal(int id, String asal, String tujuan, String keberangkatan, String kedatangan, String status) {
    this.id = id;
    this.asal = asal;
    this.tujuan = tujuan;
    this.keberangkatan = keberangkatan;
    this.kedatangan = kedatangan;
    this.status = status;
  }

  Jadwal.fromJson(Map json)
      : id = json['id'],
      asal = json['asal'],
      tujuan = json['tujuan'],
      keberangkatan = json['keberangkatan'],
      kedatangan = json['kedatangan'],
      status = json['status'];

  Map toJson() {
    return {'id': id, 'asal': asal, 'tujuan': tujuan, 'keberangkatan': keberangkatan, 'kedatangan': kedatangan, 'status': status};
  }
}