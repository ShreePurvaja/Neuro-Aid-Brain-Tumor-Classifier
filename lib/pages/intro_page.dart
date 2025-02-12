import 'package:flutter/material.dart';
import 'package:image_classification_app/Mri_widgets/mri_recogniser.dart';
import 'package:image_classification_app/components/commom_appbar.dart';

import 'package:image_classification_app/pages/faqs_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWithDrawer(
          appBarTitle: 'Neuro-Aid Care',
          titleColor: Color.fromARGB(255, 52, 4, 59)),
      drawer: const CommonDrawer(),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/brain_tumor_image.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  bottom: 46,
                  left: 69,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get started with the",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                       SizedBox(height:2),
                      Text(
                        "BRAIN TUMOR GUIDE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Early Detection Section
                  const Text(
                    "Early Detection Saves Lives",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Brain tumors are abnormal growths of cells in the brain or surrounding tissues. Early detection is critical as it significantly improves treatment outcomes and survival rates. Recognizing early warning signs and seeking prompt medical attention can lead to timely diagnosis and effective intervention.",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BrainTumorFAQPage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 52, 4, 59),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Learn more",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Why It Matters Section
                  const Text(
                    "WHY IT MATTERS",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Why? Because the earlier signs of brain tumors are detected and treated, the better the chances of recovery and improved quality of life.\n",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "Regular check-ups with your doctor or neurologist can help detect brain tumors at an early stage. Advanced imaging techniques like MRI and CT scans are often recommended to confirm diagnosis.\n",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "But you can do more to protect yourself by staying alert to potential warning signs like persistent headaches, vision problems, or seizures.\n",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "Recognizing symptoms early is the best way to act quickly and seek medical advice. The sooner you notice changes, the sooner you’ll be able to get the necessary treatment.\n",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "And if there’s one thing we know about brain tumors, it’s that early detection and treatment significantly improve survival rates and outcomes.",
                    style: TextStyle(fontSize: 17)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MRIRecogniser();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 52, 4, 59),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Check-Yourself",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
