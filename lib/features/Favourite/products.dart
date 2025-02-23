import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final String image;
  final String starImage;
  final String brand;
  final String name;
  final String color;
  final String size;
  final double price;
  final double? discount;
  final bool sold  ;

  const Products({
    super.key,
    required this.image,
    required this.starImage,
    required this.brand,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.discount,
    required this.sold,
  });

  @override
  Widget build(BuildContext context) {
    // حساب السعر بعد الخصم
    final double discountedPrice =
    (discount != null && discount! > 0) ? price * (1 - discount! / 100) : price;

    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // صورة المنتج
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/$image.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 205, // تحديد ارتفاع ثابت لتجنب overflow
                ),
              ),
              if (sold)
                Positioned(
                  bottom: 1,
                  left: -1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.withOpacity(0.6), // لون داكن مع شفافية
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    child: const Text(
                      'Sorry, this item is currently\nsold out',
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Colors.black, // لون أبيض لتحسين الوضوح

                      ),
                    ),
                  ),
                ),
              // عرض الخصم إذا كان موجودًا
              if (discount != null && discount! > 0)
                Positioned(
                  top: 10,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.only(top:7,bottom: 4,right: 6,left: 7 ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      '${discount!.toInt()}% ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              // أيقونة الإزالة
              Positioned(
                right: 10,
                top: 7,
                child:
                InkWell(
                  onTap: (){print('Remove product');},
                    child: const Icon(Icons.close, color: Colors.grey)
                ),
              ),
              // أيقونة حقيبة التسوق
              if (!sold)
                Positioned(
                  bottom: -15,  // تحريك الأيقونة للأسفل لتظهر فوق الصورة جزئياً
                  right: 1,    // ضبط المسافة من اليمين
                  child: Container(
                    width: 45, // تكبير الدائرة قليلاً لتكون أوضح
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.red, // لون الخلفية الأحمر
                      shape: BoxShape.circle, // جعل الشكل دائرياً
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // ظل أقوى ليظهر بشكل أوضح
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 3), // الظل يكون لأسفل قليلاً
                        ),
                      ],
                    ),
                    child: const Icon(Icons.shopping_bag, color: Colors.white, size: 26), // أيقونة أكبر
                  ),
                ),


            ],
          ),
          const SizedBox(height: 4),
      Image.asset(
        'assets/images/$starImage.png',
        height: 20,),
          const SizedBox(height: 4),
          // العلامة التجارية
          Text(
            brand,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 2),
          // اسم المنتج
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // اللون والحجم
          Row(
            children: [
              const Text(
                'Color: ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                color,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'Size: ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                size,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // السعر
          Row(
            children: [
              // السعر بعد الخصم
              Text(
                '\$${discountedPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),

              ),
              // السعر الأصلي إذا كان هناك خصم
              if (discount != null && discount! > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
