class Doctor {
  final String name;
  final String specialty;
  final int yearsOfExperience;
  final int satisfactionRate;
  final int patientStories;
  final String nextAvailable;
  final String imagePath;
  final bool isFavorite;

  Doctor({
    required this.name,
    required this.specialty,
    required this.yearsOfExperience,
    required this.satisfactionRate,
    required this.patientStories,
    required this.nextAvailable,
    required this.imagePath,
    this.isFavorite = false,
  });

  // Copy with method for updating favorite status
  Doctor copyWith({
    String? name,
    String? specialty,
    int? yearsOfExperience,
    int? satisfactionRate,
    int? patientStories,
    String? nextAvailable,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Doctor(
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      satisfactionRate: satisfactionRate ?? this.satisfactionRate,
      patientStories: patientStories ?? this.patientStories,
      nextAvailable: nextAvailable ?? this.nextAvailable,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

// Sample data for doctors
class DoctorData {
  static List<Doctor> getDoctors() {
    return [
      Doctor(
        name: "Dr. Shruti Kedia",
        specialty: "Tooths Dentist",
        yearsOfExperience: 7,
        satisfactionRate: 87,
        patientStories: 69,
        nextAvailable: "10:00 AM tomorrow",
        imagePath: "assets/images/1000425837.jpg",
        isFavorite: true,
      ),
      Doctor(
        name: "Dr. Watamaniuk",
        specialty: "Tooths Dentist",
        yearsOfExperience: 9,
        satisfactionRate: 74,
        patientStories: 78,
        nextAvailable: "12:00 AM tomorrow",
        imagePath: "assets/images/1000425836.jpg",
        isFavorite: false,
      ),
      Doctor(
        name: "Dr. Crownover",
        specialty: "Tooths Dentist",
        yearsOfExperience: 5,
        satisfactionRate: 59,
        patientStories: 86,
        nextAvailable: "11:00 AM tomorrow",
        imagePath: "assets/images/1000425834.jpg",
        isFavorite: true,
      ),
      Doctor(
        name: "Dr. Balestra",
        specialty: "Tooths Dentist",
        yearsOfExperience: 6,
        satisfactionRate: 82,
        patientStories: 60,
        nextAvailable: "09:00 AM tomorrow",
        imagePath: "assets/images/1000425835.jpg",
        isFavorite: false,
      ),
    ];
  }
}

