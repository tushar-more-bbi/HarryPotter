// class Categories {
//    String? house;
//    bool? student;
//    bool? staff;
//    String? species;
//    bool? stillAlive;

//   Categories(
//       { this.house,
//        this.student,
//        this.staff,
//        this.species,
//        this.stillAlive});

//   Categories.fromJson(Map<String,dynamic> json){
//     house = json['house'];
//     student = json['student'];
//     staff = json['staff'];
//     species = json['species'];
//     stillAlive =json['stillalive'];

//   }
// }
//class Wizard used to handle our data i.e been used to read from JSON file.
class Wizard {
  String? house;
  String? name;
  String? image;
  String? species;
  String? ancestry;
  String? gender;
  String? description;
  String? actor;
  String? dateOfBirth;
 //Constructor
  Wizard({
    this.house,
    this.name,
    this.image,
    this.species,
    this.ancestry,
    this.gender,
    this.description,
    this.actor,
    this.dateOfBirth,
  });
  //method that assign values to respective datatype variables
  Wizard.fromJson(Map<String, dynamic> json) {
    house = json['house'];
    name = json['name'];
    image = json['image'];
    species = json['species'];
    ancestry = json['ancestry'];
    gender = json['gender'];
    description = json['description'];
    actor = json['actor'];
    dateOfBirth = json['dateOfBirth'];
  }
}
