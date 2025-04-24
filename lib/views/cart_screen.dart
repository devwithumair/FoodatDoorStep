import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/cart_viewmodel.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () =>
            controller.cartItems.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...controller.cartItems.map((item) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: Image.asset(item.image, width: 50),
                          title: Text(item.name),
                          subtitle: Text(
                            'Price: \$${item.price.toStringAsFixed(2)}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed:
                                    () => controller.decreaseQuantity(item.id),
                              ),
                              Text(item.quantity.toString()),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed:
                                    () => controller.increaseQuantity(item.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const Divider(),
                    Text(
                      'Total: \$${controller.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
      ),
    );
  }
}
