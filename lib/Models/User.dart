class User {
 final int id;
 final String nama;
 final String username;
 final String role;
 final String foto;

  User({this.id, this.nama, this.username, this.role, this.foto});

  factory User.fromJSON(Map<String, dynamic> json){
    return User(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      role: json['role'],
      foto: json['foto'],
    );
  }
}