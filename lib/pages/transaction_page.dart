import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalexam/bloc/bloc/item_bloc.dart';
import 'package:finalexam/models/item.dart';

class TransactionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start loading the items when the widget is built
    context.read<ItemBloc>().add(LoadItems());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 209, 209, 209), // Set the background color to grey
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.navigation, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MONDAY',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '17 Nov',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '\$2,983',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: ListView.builder(
                      itemCount: state.item.length,
                      itemBuilder: (context, index) {
                        return TransactionListItem(item: state.item[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ItemOperationFailure) {
            return const Center(child: Text('Failed to load items'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final Item item;

  TransactionListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    IconData iconData = getIconFromString(item.pictureUrl);

    return ListTile(
      // ignore: unrelated_type_equality_checks
      leading: iconData != Icons.error
          ? Icon(iconData, color: Colors.blue)
          : Image.network(
              item.pictureUrl,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
      title: Text(
        item.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600, // Set the font weight to semi-bold
          fontSize: 16, // Set the text size to 16
        ),
      ),
      subtitle: Text(_formatDate(item.dateCreated)),
      trailing: Text(
        '${item.price.split(' ')[0]} \$${item.price.split(' ')[1]}',
        style: TextStyle(
          color: item.price.startsWith('-') ? Colors.red : Colors.green,
          fontSize: 16, // Set the text size to 20
          fontWeight: FontWeight.w900, // Set the font weight to semi-bold
        ),
      ),
    );
  }

  String _formatDate(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateTime now = DateTime.now();
    if (DateTime(now.year, now.month, now.day) ==
        DateTime(date.year, date.month, date.day)) {
      return 'Today';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  IconData getIconFromString(String iconString) {
    switch (iconString) {
      case 'Icons.local_grocery_store':
        return Icons.local_grocery_store;
      case 'Icons.shopping_cart':
        return Icons.shopping_cart;
      case 'Icons.directions_bus':
        return Icons.directions_bus;

      default:
        return Icons.error; // Fallback icon if you don't have a match
    }
  }
}



// Text(
//         item.price,
//         style: TextStyle(
//           color: item.price.startsWith('-') ? Colors.red : Colors.green,
//         ),




























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:finalexam/bloc/bloc/item_bloc.dart';
// import 'package:finalexam/models/item.dart';

// class TransactionListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Start loading the items when the widget is built
//     context.read<ItemBloc>().add(LoadItems());

//     return Scaffold(
//       appBar: AppBar(title: const Text('Transactions')),
//       body: BlocBuilder<ItemBloc, ItemState>(
//         builder: (context, state) {
//           if (state is ItemLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is ItemLoaded) {
//             return ListView.builder(
//               itemCount: state.item.length,
//               itemBuilder: (context, index) {
//                 return TransactionListItem(item: state.item[index]);
//               },
//             );
//           } else if (state is ItemOperationFailure) {
//             return const Center(child: Text('Failed to load items'));
//           } else {
//             return const Center(child: Text('Unknown state'));
//           }
//         },
//       ),
//     );
//   }
// }

// class TransactionListItem extends StatelessWidget {
//   final Item item;

//   TransactionListItem({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     IconData iconData = getIconFromString(item.pictureUrl);

//     return ListTile(
//       leading: Icon(iconData, color: Colors.blue),
//       title: Text(item.name),
//       subtitle:
//           Text(DateFormat('dd MMM yyyy').format(item.dateCreated.toDate())),
//       trailing: Text(
//         item.price,
//         style: TextStyle(
//             color: item.price.startsWith('-') ? Colors.red : Colors.green),
//       ),
//     );
//   }

//   IconData getIconFromString(String iconString) {
//     switch (iconString) {
//       case 'Icons.local_grocery_store':
//         return Icons.local_grocery_store;
//       // Add more cases for each icon string you have
//       default:
//         return Icons.error; // Fallback icon if you don't have a match
//     }
//   }
// }















