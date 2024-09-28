import 'package:evcp/controller/page_controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

Future<List<Map<String, dynamic>>> filterUsers(List<dynamic> args) async {
  List<Map<String, dynamic>> users = args[0];
  String keyword = args[1];
  String field = args[2];
  switch (field) {
    case 'Email':
      field = 'email';
      break;
    case 'PhoneNumber':
      field = 'phone_number';
      break;
    default:
      field = 'name';
      break;
  }
  if (keyword.isEmpty) {
    return users;
  }

  List<Map<String, dynamic>> filteredUsers;
  if (field == 'phone_number') {
    filteredUsers = users.where((user) {
      var value = user[field];
      return value != null && value.contains(keyword);
    }).toList();
  } else {
    filteredUsers = users.where((user) {
      var value = user[field];
      return value != null &&
          value.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  return filteredUsers;
}

class CRMCustomer extends StatefulWidget {
  const CRMCustomer({super.key});

  @override
  State<CRMCustomer> createState() => _CRMCustomerState();
}

class _CRMCustomerState extends State<CRMCustomer> {
  List<Map<String, dynamic>> foundUsers = [];
  bool toggleSearch = false;
  int userSno = 0;
  TextEditingController searchController = TextEditingController();
  String? selectedValue = 'PhoneNumber';
  List<String> dropdownItems = ['Name', 'Email', 'PhoneNumber'];

  final int perPage = 10;
  int currentPage = 0;
  List<Map<String, dynamic>> displayedUsers = [];

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fetchUserData().then((users) {
      setState(() {
        foundUsers = users;
        fetchDisplayedUsers();
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchUserData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data['docId'] = doc.id; // Storing the document ID
      return data;
    }).toList();
  }

  void fetchDisplayedUsers() {
    final List<Map<String, dynamic>> allUsers = foundUsers;

    int startIndex = currentPage * perPage;
    int endIndex = startIndex + perPage;
    if (endIndex > allUsers.length) {
      endIndex = allUsers.length;
    }

    setState(() {
      displayedUsers = allUsers.sublist(startIndex, endIndex);
    });
  }

  void _runFilter(String enteredKeyword, String field) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      List<Map<String, dynamic>> results = [];
      if (enteredKeyword.isEmpty) {
        results = await fetchUserData();
      } else {
        results = await compute<List<dynamic>, List<Map<String, dynamic>>>(
          filterUsers,
          [foundUsers, enteredKeyword, field],
        );
      }

      setState(() {
        foundUsers = results;
        currentPage = 0;
      });

      fetchDisplayedUsers();
    });
  }

  Future<void> _editUser(String docId, Map<String, dynamic> newData) async {
    // Update user data in Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .update(newData);

    // Refresh the data
    fetchUserData().then((users) {
      setState(() {
        foundUsers = users;
        fetchDisplayedUsers();
      });
    });
  }

  Future<void> _deleteUser(String docId) async {
    // Delete user data from Firestore
    await FirebaseFirestore.instance.collection('users').doc(docId).delete();

    // Refresh the data
    fetchUserData().then((users) {
      setState(() {
        foundUsers = users;
        fetchDisplayedUsers();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Container();
            } else if (constraints.maxWidth < 1000) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1046A8),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    // height: w > 1100 ? 120 : 250,
                    // width: 1200,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customer',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10, width: 30),
                        w > 1100
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Search by ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 250.0,
                                        color: Colors.white,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedValue,
                                          items:
                                              dropdownItems.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        selectedValue == 'PhoneNumber'
                                            ? 'Phone Number :'
                                            : selectedValue == 'Email'
                                                ? 'Email :'
                                                : selectedValue == 'Name'
                                                    ? 'Name :'
                                                    : '',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: searchController,
                                          onChanged: (value) =>
                                              _runFilter(value, selectedValue!),
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _runFilter(searchController.text,
                                            selectedValue!);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Search',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Search by ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 250.0,
                                        color: Colors.white,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedValue,
                                          items:
                                              dropdownItems.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        selectedValue == 'PhoneNumber'
                                            ? 'Phone Number :'
                                            : selectedValue == 'Email'
                                                ? 'Email :'
                                                : selectedValue == 'Name'
                                                    ? 'Name :'
                                                    : '',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: searchController,
                                          onChanged: (value) =>
                                              _runFilter(value, selectedValue!),
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _runFilter(searchController.text,
                                          selectedValue!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: PaginatedDataTable(
                        header: const Text('Customer Information'),
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Phone Number')),
                          DataColumn(label: Text('Membership')),
                          DataColumn(label: Text('Actions')),
                        ],
                        source: _DataTableSource(
                          data: displayedUsers,
                          editUser: _editUser,
                          deleteUser: _deleteUser,
                        ),
                        rowsPerPage: perPage,
                        availableRowsPerPage: [5, 10, 20],
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index ~/ perPage;
                            fetchDisplayedUsers();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1046A8),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    // height: w > 1100 ? 120 : 250,
                    // width: 1200,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customer',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10, width: 30),
                        w > 600
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Search by ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 250.0,
                                        color: Colors.white,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedValue,
                                          items:
                                              dropdownItems.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        selectedValue == 'PhoneNumber'
                                            ? 'Phone Number :'
                                            : selectedValue == 'Email'
                                                ? 'Email :'
                                                : selectedValue == 'Name'
                                                    ? 'Name :'
                                                    : '',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: searchController,
                                          onChanged: (value) =>
                                              _runFilter(value, selectedValue!),
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _runFilter(searchController.text,
                                            selectedValue!);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Search',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :
                             Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Search by ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 250.0,
                                        color: Colors.white,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedValue,
                                          items:
                                              dropdownItems.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        selectedValue == 'PhoneNumber'
                                            ? 'Phone Number :'
                                            : selectedValue == 'Email'
                                                ? 'Email :'
                                                : selectedValue == 'Name'
                                                    ? 'Name :'
                                                    : '',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: searchController,
                                          onChanged: (value) =>
                                              _runFilter(value, selectedValue!),
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _runFilter(searchController.text,
                                          selectedValue!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: PaginatedDataTable(
                        header: const Text('Customer Information'),
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Phone Number')),
                          DataColumn(label: Text('Membership')),
                          DataColumn(label: Text('Actions')),
                        ],
                        source: _DataTableSource(
                          data: displayedUsers,
                          editUser: _editUser,
                          deleteUser: _deleteUser,
                        ),
                        rowsPerPage: perPage,
                        availableRowsPerPage: [5, 10, 20],
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index ~/ perPage;
                            fetchDisplayedUsers();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}

class _DataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> data;
  final Function(String, Map<String, dynamic>) editUser;
  final Function(String) deleteUser;

  _DataTableSource({
    required this.data,
    required this.editUser,
    required this.deleteUser,
  });

  @override
  DataRow getRow(int index) {
    final user = data[index];

    return DataRow(
      cells: [
        DataCell(Text(user['name'] ?? '')),
        DataCell(Text(user['email'] ?? '')),
        DataCell(Text(user['phone_number'] ?? '')),
        DataCell(Text(user['active_membership'] ?? '')), // Membership column
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Edit user
                  editUser(user['docId'], user);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Delete user
                  deleteUser(user['docId']);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
