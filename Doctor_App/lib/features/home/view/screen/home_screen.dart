import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import '../widgets/custom_widget_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> _doctors = [];
  List<Doctor> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _doctors = DoctorData.getDoctors();
    _filteredDoctors = _doctors;
    _searchController.text = 'Dentist'; // Set default search text
  }

  void _filterDoctors(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDoctors = _doctors;
      } else {
        _filteredDoctors = _doctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(query.toLowerCase()) ||
                doctor.specialty.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      final doctorIndex = _doctors.indexWhere(
          (doctor) => doctor.name == _filteredDoctors[index].name);
      if (doctorIndex != -1) {
        _doctors[doctorIndex] = _doctors[doctorIndex]
            .copyWith(isFavorite: !_doctors[doctorIndex].isFavorite);
        _filteredDoctors[index] = _doctors[doctorIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2E3A59), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Find Doctors',
          style: TextStyle(
            color: Color(0xFF2E3A59),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterDoctors,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E3A59),
                ),
                decoration: InputDecoration(
                  hintText: 'Dentist',
                  hintStyle: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF8A8A8A),
                    size: 22,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Color(0xFF8A8A8A), size: 20),
                          onPressed: () {
                            _searchController.clear();
                            _filterDoctors('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Doctors List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredDoctors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomWidgetCard(
                      doctor: _filteredDoctors[index],
                      onFavoriteToggle: () => _toggleFavorite(index),
                      onBookNow: () {
                        // Handle book now action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Booking appointment with ${_filteredDoctors[index].name}'),
                            backgroundColor: const Color(0xFF00C896),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

