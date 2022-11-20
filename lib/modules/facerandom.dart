import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:facegenerate/cubit/cubit.dart';
import 'package:facegenerate/cubit/states.dart';
import 'package:facegenerate/sahred/local/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceRandom extends StatelessWidget {
  FaceRandom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FaceRandomCubit, FaceRandomStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FaceRandomCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.change();
                  },
                  icon: cubit.toggleMode
                      ? const Icon(Icons.sunny)
                      : const Icon(Icons.dark_mode))
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is FaceRandomLoadingState)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(
                        color: Colors.grey,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  if (state is FaceRandomLoadingState)
                    const SizedBox(
                      height: 5,
                    ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ConditionalBuilder(
                        condition: cubit.model != null,
                        fallback: (context) => Image.network(
                          "https://blenderartists.org/uploads/default/original/4X/f/7/a/f7a0a3a97695c83f4780973eb73b8f20ecc29df9.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        builder: (context) => Image.network(
                          cubit.model!.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)),
                          height: 55,
                          child: MaterialButton(
                            onPressed: () {
                              cubit.male();
                            },
                            child: const Icon(Icons.male),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)),
                          height: 55,
                          child: MaterialButton(
                            onPressed: () {
                              cubit.random();
                            },
                            child: const Icon(Icons.person),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)),
                          height: 55,
                          child: MaterialButton(
                            onPressed: () {
                              cubit.female();
                            },
                            child: const Icon(Icons.female),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (cubit.toogleGender != "")
                    Text(
                      cubit.toogleGender == "female" ? "Female" : "Male",
                      style: TextStyle(
                          color: cubit.toggleMode
                              ? Colors.black
                              : Colors.grey[300],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(
                    height: 25,
                  ),
                  RangeSlider(
                    values: RangeValues(cubit.min, cubit.max),
                    onChanged: (v) {
                      cubit.slider(mini: v.start, maxi: v.end);
                    },
                    max: 100,
                    min: 0,
                    activeColor: Colors.grey[300],
                    inactiveColor: Colors.red,
                  ),
                  Row(
                    children: [
                      Text(
                        cubit.minText.text != "" ? cubit.minText.text : "0",
                        style: TextStyle(
                            color:
                                cubit.toggleMode ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        cubit.maxText.text != "" ? cubit.maxText.text : "100",
                        style: TextStyle(
                            color:
                                cubit.toggleMode ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        cubit.getData(
                            gender: cubit.toogleGender,
                            min: cubit.min,
                            max: cubit.max);
                      },
                      child: const Text(
                        "Generate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        get(path: cubit.model!.image, context: context);
                      },
                      child: const Text(
                        "Dawnload",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
