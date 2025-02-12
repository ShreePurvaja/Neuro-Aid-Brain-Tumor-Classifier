import 'package:flutter/material.dart';
import 'package:image_classification_app/components/commom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class SurvivorStoriesPage extends StatelessWidget {
  const SurvivorStoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {
        'name': 'Caroline Flynn',
        'story': 'For 18 years of my life, I lived in good health – I had never even broken a bone. So when I was diagnosed with a brain tumor during my freshman year of college, my world was turned upside down.',
        'image': 'assets/survivor1.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/caroline'
      },
      {
        'name': 'Debbie Gilbert-Gardner ',
        'story': 'When realtor Debbie Gilbert-Gardner experienced a headache that lasted for three weeks, she turned to Henry Ford Health to help her find some answers. The neurological team at Henry Ford discovered that she had the most aggressive type of brain cancer, glioblastoma multiforme.',
        'image': 'assets/survivor2.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/debbie'
      },
      {
        'name': 'Ken Gipfert',
        'story': 'In 2019 Ken Gipfert was diagnosed with stage 4 cancer that metastasized from his lung to his brain. After undergoing surgery to remove the brain tumor and one-third of his lung, his brain tumor recurred three other times. With the help of Henry Ford’s advanced technology, GammaTiles, and innovative experts, Dr. Salim Siddiqui, Ken Gipfert is now remarkably stable after five years of being diagnosed.',
        'image': 'assets/survivor3.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/ken'
      },
      {
        'name': 'Traci Van Gorden',
        'story': 'After nurse practitioner Traci Van Gorden had a small seizure, she went to Henry Ford. Expert neurosurgeons successfully removed a large deep-brain tumor, preserving her life and motor-function and vision.',
        'image': 'assets/survivor4.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/traci'
      },
      {
        'name': 'Janae Nelson',
        'story': 'Janae Nelson, a 29-year-old speech and language pathologist, had a lot going for her. She was planning her wedding and a honeymoon to Scotland and Ireland when COVID hit. Her recovery was slow, and some symptoms were odd. Instead of a trip to Europe, all roads would lead her to Henry Ford and the neurosurgery team that would save her life. After an awake craniotomy, she has hope for her future.',
        'image': 'assets/survivor5.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/janae'
      },
      {
        'name': 'Stephen Bonetti',
        'story': 'At age 55 in 2002, melanoma was removed from Stephens knee. The Melanoma grew back as a lump and invaded several lymph nodes along Stephen’s thigh. These were removed in 2010 to prevent the spread of cancer. Life was good for many years -but on a July evening in 2014 after playing golf, he suddenly couldn’t talk. An ambulance sped him to a nearby hospital where an MRI showed a brain tumor.',
        'image': 'assets/survivor6.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/stephen'
      },
      {
        'name': 'Kate White ',
        'story': 'Kate White had suffered from stress-related headaches her whole life, but the persistent pain she had been feeling for more than two-weeks was signaling a larger problem. The pain became worse and the next thing she remembers is waking up at Henry Ford Hospital with no memory of how she had gotten there – diagnosed with a glioblastoma.',
        'image': 'assets/survivor7.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/kate'
      },
      {
        'name': 'Tiffany Crowe',
        'story': 'Tiffany Crowe came to the Henry Ford Hermelin Brain Tumor Center after her brain tumor came back. Our surgeon used a new approach which allowed him to target the tumor using MRI — without harming healthy cells and affecting her motor skills.',
        'image': 'assets/survivor8.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/tiffany'
      },
      {
        'name': 'Sasha and Danielle',
        'story': 'Most glioblastomas occur in men over the age of 60, so when 20-year-old Danielle Gillespie discovered she had one, she and her doctors were surprised. Even more surprising? Just six weeks earlier, 28-year-old Sasha Archer had come to Henry Ford with a glioblastoma too.',
        'image': 'assets/survivors9.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/danielle-and-sasha'
      },
      {
        'name': 'Head to the Hill Advocacy Day',
        'story': 'Five patients from the Henry Ford Hermelin Brain Tumor Center and Dr. James Snyder, neurology specialist, met in Washington, D.C., as part of the annual Head to the Hill advocacy day to persuade elected officials to delegate more funding to brain cancer research.',
        'image': 'assets/survivors10.jpg',
        'url':'https://www.henryford.com/services/brain-tumors/patient-stories/head-to-the-hill'
      },
    ];

    Future<void> launchURL(String url) async {
      final Uri uri = Uri.parse(url); // Parse the URL into a URI
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: const CommonAppBarWithDrawer(appBarTitle: 'WALL OF STORIES', titleColor:  Color.fromARGB(255, 52, 4, 59)),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return GestureDetector(
              onTap: (){
                  final url = story['url'];
                if (url != null && url.isNotEmpty) {
                  launchURL(url);
                }
              },
              child: Card(
                color:  const Color.fromARGB(255, 52, 4, 59),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(story['image'] ?? 'assets/placeholder.jpg'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              story['name'] ?? 'Anonymous',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        story['story'] ?? '',
                        style: const TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
