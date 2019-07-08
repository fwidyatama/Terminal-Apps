
class Jadwal {
 final int id;
 final String asal;
 final String tujuan;
 final String keberangkatan;
 final String kedatangan;
 final String status;

  Jadwal({this.id, this.asal, this.tujuan, this.keberangkatan, this.kedatangan,this.status});

  factory Jadwal.fromJSON(Map<String, dynamic> json){
    return Jadwal(
      id: json['id'],
      asal: json['asal'],
      tujuan: json['tujuan'],
      keberangkatan: json['keberangkatan'],
      kedatangan: json['kedatangan'],
      status: json['status'],
    );
  }
}
