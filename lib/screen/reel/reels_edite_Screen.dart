// ignore_for_file: unused_import, must_be_immutable, file_names, non_constant_identifier_names, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/data/firebase_service/firestor.dart';
import 'package:greencircuit/data/firebase_service/storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ReelsEditeScreen extends StatefulWidget {
  File videoFile;
  ReelsEditeScreen(this.videoFile, {super.key});

  @override
  State<ReelsEditeScreen> createState() => _ReelsEditeScreenState();
}

class _ReelsEditeScreenState extends State<ReelsEditeScreen> {
  final caption = TextEditingController();
  late VideoPlayerController controller;
  bool Loading = false;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.setVolume(1.0);
        controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        title: const Text(
          'Subir Reels',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Loading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: SizedBox(
                          width: 270.w,
                          height: 420.h,
                          child: controller.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                )
                              : const CircularProgressIndicator()),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 60,
                      width: 280.w,
                      child: TextField(
                        controller: caption,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: 'Escribe una descripción...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            'Guardar borrador',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              Loading = true;
                            });
                            String Reels_Url = await StorageMethod()
                                .uploadImageToStorage(
                                    'Reels', widget.videoFile);
                            await Firebase_Firestor().CreatReels(
                              video: Reels_Url,
                              caption: caption.text,
                            );
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 160, 119, 179),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              'Compartir',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
