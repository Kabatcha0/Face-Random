import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool?> get({required String path, required context}) async {
  return await GallerySaver.saveImage(path, albumName: "FaceRandom")
      .then((value) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Done",
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    )));
  }).catchError((e) {
    return null;
  });
}

class Cache {
  static SharedPreferences? share;
  static Future<SharedPreferences> init() async {
    return share = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is bool) return await share!.setBool(key, value);
    if (value is String) return await share!.setString(key, value);
    if (value is int) {
      return await share!.setInt(key, value);
    } else {
      return await share!.setDouble(key, value);
    }
  }

  static bool? getData({required String key}) {
    return share!.getBool(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await share!.remove(key);
  }
}
