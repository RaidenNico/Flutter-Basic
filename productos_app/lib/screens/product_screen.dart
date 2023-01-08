import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
        Stack(children: [
          ProductImage(url: productService.selectedProduct?.picture),
          Positioned(
              top: 60,
              left: 20,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_new,
                    size: 40, color: Colors.white),
              )),
          Positioned(
              top: 60,
              right: 20,
              child: IconButton(
                onPressed: () async {
                  final picker = ImagePicker();
                  // ignore: deprecated_member_use
                  final PickedFile? pickedFile = await picker.getImage(
                      source: ImageSource.camera, imageQuality: 100);

                  if (pickedFile == null) {
                    // ignore: avoid_print
                    print("No selecciono nada");
                    return;
                  }
                  // ignore: avoid_print
                  print("Tenemos imagen${(pickedFile.path)}");
                  productService.updateSelectedProductImage(pickedFile.path);
                },
                icon: const Icon(Icons.camera_alt_outlined,
                    size: 40, color: Colors.white),
              ))
        ]),
        _Product_Form(),
        const SizedBox(height: 100),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: productService.isSaving
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.save_outlined),
        onPressed: productService.isSaving
            ? null
            : () async {
                if (!productForm.isValidForm()) return;

                final String? imageUrl = await productService.uploadImage();

                if (imageUrl != null) productForm.product?.picture = imageUrl;

                await productService.saveOrCreateProduct(productForm.product!);
              },
      ),
    );
  }
}

// ignore: camel_case_types
class _Product_Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Form(
            key: productForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: product?.name,
                  onChanged: (value) => product?.name = value,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    // ignore: prefer_is_empty
                    if (value == null || value.length < 1)
                      // ignore: curly_braces_in_flow_control_structures
                      return "El nombre es obligatorio";
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: "Nombre del producto", labelText: "Nombre"),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: "${product?.price}",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product?.price = 0;
                    } else {
                      product?.price = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: "\$150", labelText: "Precio"),
                ),
                const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  value: product!.availabel,
                  title: const Text("Disponible"),
                  activeColor: Colors.indigo,
                  onChanged: productForm.updateAvailability,
                ),
                const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]);
}
