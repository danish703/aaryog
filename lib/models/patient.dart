class Patient {
  final int id;
  final String firstName;
  final String lastName;
  final String address;
  final String dateOfBirth;

  Patient(
      {this.id, this.firstName, this.lastName, this.address, this.dateOfBirth});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'dob': dateOfBirth
    };
  }
}
