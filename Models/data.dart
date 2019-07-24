class Data {
  int id;
  String waktu;
  String kota;
  String statusKegiatan;
  String statusKapal;
  String statusTiket;
  Kapal kapal;
  AgenPelayaran agenPelayaran;
  String updatedAt;

  Data(
      {this.id,
        this.waktu,
        this.kota,
        this.statusKegiatan,
        this.statusKapal,
        this.statusTiket,
        this.kapal,
        this.agenPelayaran,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    waktu = json['waktu'];
    kota = json['kota'];
    statusKegiatan = json['status_kegiatan'];
    statusKapal = json['status_kapal'];
    statusTiket = json['status_tiket'];
    kapal = json['kapal']=  Kapal.fromJson(json['kapal']);
    agenPelayaran = json['agen_pelayaran'] =  AgenPelayaran.fromJson(json['agen_pelayaran']);
    updatedAt=json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['waktu'] = this.waktu;
    data['kota'] = this.kota;
    data['status_kegiatan'] = this.statusKegiatan;
    data['status_kapal'] = this.statusKapal;
    data['status_tiket'] = this.statusTiket;
    data['kapal'] = this.kapal.toJson();
    data['agen_pelayaran'] = this.agenPelayaran.toJson();
    return data;
  }
}

class Kapal {
  int id;
  String kode;
  String nama;

  Kapal({this.id, this.kode, this.nama});

  Kapal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    return data;
  }
}

class AgenPelayaran {
  int id;
  String nama;
  String logo;
  String loket;
  String gambar;

  AgenPelayaran({this.id, this.nama, this.logo, this.loket});

  AgenPelayaran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    logo = json['logo'];
    loket = json['loket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['logo'] = this.logo;
    data['loket'] = this.loket;
    return data;
  }
}