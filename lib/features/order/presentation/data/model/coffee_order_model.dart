class CoffeeOrderModel {
  String? deliveryAddress;
  String? fullAddress;
  String? coffeeName;
  String? coffeeType;
  String? price;
  String? originalDeliveryFee;
  String? discountedDeliveryFee;
  String? paymentMethod;
  String? totalAmount;

  CoffeeOrderModel({
    this.deliveryAddress,
    this.fullAddress,
    this.coffeeName,
    this.coffeeType,
    this.price,
    this.originalDeliveryFee,
    this.discountedDeliveryFee,
    this.paymentMethod,
    this.totalAmount,
  }) {
    deliveryAddress = deliveryAddress ?? 'Jl. Kpg Sutoyo';
    fullAddress =
        fullAddress ?? 'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.';
    coffeeName = coffeeName ?? 'Caffe Mocha';
    coffeeType = coffeeType ?? 'Deep Foam';
    price = price ?? '4.53';
    originalDeliveryFee = originalDeliveryFee ?? '2.0';
    discountedDeliveryFee = discountedDeliveryFee ?? '1.0';
    paymentMethod = paymentMethod ?? 'Cash/Wallet';
    totalAmount = totalAmount ?? '5.53';
  }
}
