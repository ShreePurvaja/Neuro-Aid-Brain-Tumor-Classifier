import 'package:flutter/material.dart';
import 'package:image_classification_app/components/commom_appbar.dart';

import 'package:image_classification_app/styles/styles.dart';


class BrainTumorFAQPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      'question': 'What is a brain tumor?',
      'answer': 'A brain tumor is an abnormal cell growth in the brain or spinal cord, either benign (noncancerous) or malignant (cancerous). Symptoms vary based on the tumor\'s size and location, and may include headaches, seizures, vision problems, and changes in behavior. Treatment options include surgery, radiation, and chemotherapy.'
    },
    {
      'question': 'What are the symptoms of a brain tumor?',
      'answer': 'Frequent headaches, especially if persistent or worsening, are a common concern. Seizures, even without a prior history, can be a sign. Vision changes, such as blurred vision, double vision, or peripheral vision loss, may occur. Shifts in personality, mood, or behavior can also be indicators.'
    },
    {
      'question': 'How is a brain tumor diagnosed?',
      'answer': 'Diagnosis typically begins with a neurological exam to assess reflexes, strength, and vision. Imaging tests like MRI or CT scans provide detailed pictures of the brain. A biopsy, where a small sample of the tumor is examined under a microscope, is sometimes necessary to determine the tumor type and grade.'
    },
    {
      'question': 'What are the types of brain tumor?',
      'answer': 'The major three types of brain tumors are:\n\n'
        '1. **Gliomas**: Tumors originating from glial cells, including astrocytomas, oligodendrogliomas, and glioblastomas; these range from low-grade to highly aggressive types.\n\n'
        '2. **Meningiomas**: Tumors arising from the meninges (the brain\'s protective layers), typically benign but occasionally malignant or problematic due to location.\n\n'
        '3. **Pituitary Tumors**: Growths in the pituitary gland, affecting hormone regulation and potentially causing symptoms like vision changes and hormonal imbalances.'
    },
    {
      'question': 'What are the treatment options for gliomas?',
      'answer': 'Glioma treatment depends on the tumor\'s type and grade. Surgery is often the first step to remove as much of the tumor as possible. Radiation therapy and chemotherapy are used to target remaining cancer cells. Advanced gliomas, like glioblastomas, may also be treated with targeted therapies or experimental approaches in clinical trials.'
    },
    {
      'question': 'How are meningiomas treated?',
      'answer': 'For small, asymptomatic meningiomas, doctors may recommend watchful waiting with regular imaging. Symptomatic or large tumors are typically treated with surgery to remove the growth, followed by radiation therapy if complete removal isn’t possible or if the tumor recurs.'
    },
    {
      'question': 'What are the treatment options for pituitary tumors?',
      'answer': 'Pituitary tumors are often treated with surgery, usually through a minimally invasive transsphenoidal approach. Medications can be prescribed to correct hormone imbalances or shrink the tumor. Radiation therapy is considered when surgery is not feasible or the tumor recurs.'
    },
    {
      'question': 'What is the prognosis for brain tumors?',
      'answer': 'Prognosis depends on factors like tumor type, grade, location, and response to treatment. Benign tumors often have excellent outcomes with treatment, while aggressive tumors like glioblastomas have poorer prognoses. Early diagnosis and advancements in treatment have improved survival rates.'
    },
    {
      'question': 'What are the risks of brain tumor surgery?',
      'answer': 'Risks include infection, bleeding, neurological deficits, or other complications depending on the complexity of the surgery.'
    },
    {
      'question': 'What are the methods of brain tumor removal?',
      'answer': 'The major methods of brain tumor removal are:\n\n'
        '1. **Surgical Resection (Craniotomy)**: Involves removing part of the skull to access and remove the tumor, typically the most direct and effective approach for accessible tumors.\n\n'
        '2. **Stereotactic Radiosurgery**: A non-invasive technique using focused radiation beams (e.g., Gamma Knife or CyberKnife) to target and destroy the tumor without removing tissue physically.\n\n'
        '3. **Endoscopic Surgery**: A minimally invasive approach using small incisions or natural openings (like the nose for pituitary tumors) to remove tumors, minimizing recovery time and risks.'
    },
    {
      'question': 'Is a brain tumor always fatal?',
      'answer': 'No, not all brain tumors are fatal. Survival rates depend on the type, size, location, and how early it is detected and treated.'
    },
    {
      'question': 'What lifestyle changes help during treatment?',
      'answer': 'Maintaining a healthy lifestyle during treatment can improve quality of life. This includes eating a balanced diet, staying hydrated, managing stress through meditation or counseling, and staying physically active with light exercises. Support groups can also provide emotional strength.'
    },
  ];

   BrainTumorFAQPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWithDrawer(appBarTitle: 'Brain Tumor FAQs',titleColor: Color.fromARGB(255, 80, 198, 230)),
      drawer:const  CommonDrawer(),
    
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return Card(
            color:const Color.fromARGB(255, 52, 4, 59),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ExpansionTile(
              title: Text(
                faqData[index]['question']!,
                style: const TextStyle(fontWeight: FontWeight.bold,color: kColorEggshell),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    faqData[index]['answer']!,
                    softWrap: true,
                    style: const TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
