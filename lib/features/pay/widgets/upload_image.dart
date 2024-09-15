import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../blocs/pick_image_bloc.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickImageBloc, PickImageState>(
      builder: (context, state) {
        return Column(
          children: [
            OutlinedButton(
              onPressed: () async {
                final pickedImage = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 100,
                );

                if (pickedImage != null) {
                  if (context.mounted) {
                    context.read<PickImageBloc>()
                      ..add(
                        PickImageEvent.imageTaken(
                          imageFile: XFile(pickedImage.path),
                        ),
                      )
                      ..photoTaken = XFile(pickedImage.path);
                  }
                }
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Pilih Gambar',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            state.maybeWhen(
              picked: (image) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.file(
                    image,
                    height: 200,
                    width: 180,
                  ),
                );
              },
              orElse: () => const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
