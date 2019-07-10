class User {
  final String nama;
  final String nip;
  final String username;
  final String role;
  final String foto;
  final String token;

  User({this.nama, this.nip, this.username, this.role, this.foto, this.token});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        nama: json['nama'],
        nip: json['NIP'],
        username: json['username'],
        role: json['access_role'],
        foto: json['foto'],
        token: json['token']);
  }
}
