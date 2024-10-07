import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> orders = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        centerTitle: true,
      ),
      body: orders.isEmpty
          ? const Center(child: Text('No Data Available'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Order ID: ${order.orderId}'),
                        const SizedBox(height: 16),
                        Text('Order Date: ${order.createdAt}'),
                        const SizedBox(height: 16),
                        Text('Customer Name: ${order.customerName}'),
                        const SizedBox(height: 16),
                        Text('Shipping Address: ${order.customerAddress}'),
                        const SizedBox(height: 16),
                        Text('Customer Email: ${order.customerEmail}'),
                        const SizedBox(height: 16),
                        Text('Customer Phone: ${order.customerPhone}'),
                        const SizedBox(height: 16),
                        Text('Total Amount: ${order.totalPrice}'),
                        const SizedBox(height: 16),
                        Text('Payment Status: ${order.paymentMethod}'),
                        const SizedBox(height: 16),
                        Text('Order Status: ${order.status}'),
                        const SizedBox(height: 16),
                        Text('Order Items: ${order.booksModel}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
