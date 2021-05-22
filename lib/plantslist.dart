import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;
  List allDescriptions = [
    'The ×Aranda Singa Gold is a hybrid created from two orchids, Arachnis hookeriana and Vanda Bangkhuntian Gold. This is just one of the 2,000 hybrids that can be spotted at the National Orchid Garden!',
    'Bougainvillea (/ˌbuːɡənˈvɪliə/ BOO-gən-VIL-ee-ə, US also /ˌboʊɡ-/ BOH-) is a genus of thorny ornamental vines, bushes, and trees belonging to the four o\' clock family, Nyctaginaceae. It is native to eastern South America, found from Brazil, west to Peru, and south to southern Argentina. Different authors accept from 4 to 18 species in the genus. The inflorescence consists of large colourful sepal-like bracts which surround three simple waxy flowers.See more at https://en.wikipedia.org/wiki/Bougainvillea ',
    'Clitoria ternatea, commonly known as Asian pigeonwings,[1] bluebellvine, blue pea, butterfly pea, cordofan pea and Darwin pea,[2] is a plant species belonging to the family Fabaceae.In India, it is revered as a holy flower, used in daily puja rituals. The flowers of this vine were imagined to have the shape of human female genitals, hence the Latin name of the genus "Clitoria", from "clitoris". The species name is thought to derive from the island of Ternate in the Indonesian archipelago, from where Linnaeus\'s specimens originated.',
    'Dianella is a genus of about forty species of flowering plants in the monocot family Asphodelaceae and are commonly known as flax lilies.[2] Plants in this genus are tufted herbs with more or less linear leaves and bisexual flowers with three sepals more or less similar to three petals and a superior ovary, the fruit a berry. They occur in Africa, South-east Asia, the Pacific Islands, New Zealand and Australia.Several species of this genus, or the whole genus, are sometimes referred to by the common name blue flax lily, particularly in Australia.',
    'Dendrobium is a genus of mostly epiphytic and lithophytic orchids in the family Orchidaceae. It is a very large genus, containing more than 1,800 species that are found in diverse habitats throughout much of south, east and southeast Asia, including China, Japan, India, the Philippines, Indonesia, Australia, New Guinea, Vietnam and many of the islands of the Pacific. Orchids in this genus have roots that creep over the surface of trees or rocks, rarely having their roots in soil. Up to six leaves develop in a tuft at the tip of a shoot and from one to a large number of flowers are arranged along an unbranched flowering stem. Several attempts have been made to separate Dendrobium into smaller genera, but most have not been accepted by the World Checklist of Selected Plant Families.',
    'Heliconia, derived from the Greek word Ἑλικώνιος (helikṓnios)[citation needed], is a genus of flowering plants in the monotypic family Heliconiaceae. Most of the ca 194 known species[3] are native to the tropical Americas, but a few are indigenous to certain islands of the western Pacific and Maluku.[2] Many species of Heliconia are found in the tropical forests of these regions. Most species are listed as either vulnerable or data deficient by the IUCN Red List of threatened species.[4] Several species are widely cultivated as ornamentals, and a few are naturalized in Florida, Gambia, and Thailand.[5] Common names for the genus include lobster-claws, toucan beak, wild plantain, or false bird-of-paradise. The last term refers to their close similarity to the bird-of-paradise flowers (Strelitzia). Collectively, these plants are also simply referred to as "heliconias".',
    'Licuala spp. are fan palms, with the leaves mostly circular in outline, sometimes undivided but more usually divided into wedge-shaped segments. Licuala acutifida is the source of cane for the walking stick nicknamed the Penang-lawyer by colonials, probably from the Malay phrase pinang liyar for a wild areca, although the term may also refer to the use of these canes as deadly knobkerries to assassinate litigious enemies.[6] Several species of Licuala have been transferred into a new genus Lanonia',
    'Lipstick plant is a beautiful flowering indoor plant prized for its shiny foliage and interesting flowers. It gets its name because the flower buds peek out of dark-colored tubes, looking like a miniature tube of lipstick.This tropical houseplant puts on a lovely display in front of a bright window and is an excellent choice for adding a splash of color to brightly lit kitchens, bathrooms, and dining rooms. ',
    'Orchids are easily distinguished from other plants, as they share some very evident derived characteristics or synapomorphies. Among these are: bilateral symmetry of the flower (zygomorphism), many resupinate flowers, a nearly always highly modified petal (labellum), fused stamens and carpels, and extremely small seeds.',
    'Dillena suffruticosa is described to be a 6–10 meters long shrub, with alternate leaf pattern, simple, penni-veined, petiole winged along the whole stalk, blade-like 12-40x6-12 cm leaves, and a eudicot plant. The flowers are large, 10–13 cm wide, they are yellow in color and scentless. They are found on long stalks and face downwards and the plant doesn\'t produce nectar. The flower blooms daily at around 3am and is fully bloomed one hour before sunrise.[6] Other sources say (Corners) bees appear to be the pollinators that gather their pollen, as well as by small beetles and flies that scramble over the flowers, the flower moves in the appropriate position to prepare for fruit growth (pointing up when the flower starts to produce fruits, the fruits take up to 5 weeks to develop.[2] The fruit is pink and is a star-shaped capsule with purple seeds that have a fleshy bright red aril. The fruits are eaten by birds and even monkeys.',
    'Arenga pinnata (syn. Arenga saccharifera) is an economically important feather palm native to tropical Asia, from eastern India east to Malaysia, Indonesia, and the Philippines in the east.[1] Common names include sugar palm, areng palm (also aren palm or arengga palm), black sugar palm, and kaong palm, among other names.[2][3]It is a medium-sized palm, growing to 20 m tall, with the trunk remaining covered by the rough old leaf bases. The leaves are 6–12 m long and 1.5 m broad, pinnate, with the pinnae in 1–6 rows, 40–70 cm long and 5 cm broad. The fruit is subglobose, 7 cm diameter, green maturing black.[4]It is not a threatened species, though it is locally rare in some parts of its range. It serves as an important part of the diet of several endangered species, including cloud rats of the genus Phloeomys.',
    'Drosera, which is commonly known as the sundews, is one of the largest genera of carnivorous plants, with at least 194 species.[1] These members of the family Droseraceae lure, capture, and digest insects using stalked mucilaginous glands covering their leaf surfaces. The insects are used to supplement the poor mineral nutrition of the soil in which the plants grow. Various species, which vary greatly in size and form, are native to every continent except Antarctica.',
    'Ravenala is a genus of flowering plants with a single species, Ravenala madagascariensis, commonly known as the traveller\'s tree, traveller\'s palm or East-West palm, from Madagascar. It is not a true palm (family Arecaceae) but a member of a monocotyledonous flowering plant family, Strelitziaceae. The genus is closely related to the southern African genus Strelitzia and the South American genus Phenakospermum. Some older classifications include these genera in the banana family (Musaceae). Although it is usually considered to be a single species, four different forms have been distinguished.',
    'Artemisia absinthium (wormwood, grand wormwood, absinthe, absinthium, absinthe wormwood,[4] mugwort, wermout, wermud, wormit, wormod[5]) is a moderately poisonous species of Artemisia native to temperate regions of Eurasia[6] and Northern Africa and widely naturalized in Canada and the northern United States.[7] It is grown as an ornamental plant and is used as an ingredient in the spirit absinthe as well as some other alcoholic beverages.',
    'Achillea millefolium, commonly known as yarrow (/ˈjæroʊ/) or common yarrow, is a flowering plant in the family Asteraceae. It is native to temperate regions of the Northern Hemisphere in Asia and Europe and North America.[2] It has been introduced as a feed for livestock in New Zealand[3] and Australia, where it is a common weed of both wet and dry areas, such as roadsides, meadows, fields and coastal places.'
  ];

  String description;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Aranda.jpg',
                  'Aranda Singa Gold'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/bou.jpg',
                  'Bougainvillea'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/bp.jpeg',
                  'Butterfly Pea'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/cd.jpg',
                  'Common Dianella'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Denfrobium.jpeg',
                  'Denfrobium'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Heliconia.jpeg',
                  'Heliconia'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Licuala.jpeg',
                  'Licuala'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/lp.jpg',
                  'Lipstick Plant'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Orchid.jpg',
                  'Orchid'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/sl.jpg',
                  'Simpoh Lak'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/sp.jpeg',
                  'Sugar Palm'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/sd.jpeg',
                  'Sun Dew'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/tp.jpeg',
                  'Traveller\'s palm'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/Wormwood.jpeg',
                  'Wormwood'),
              SizedBox(width: 15.0),
              getPlantCard(
                  '/Users/chenlingcui/Desktop/serious/plant_ui_522/assets/images/ya.jpg',
                  'Yarrow'),
              SizedBox(width: 15.0),
            ],
          )),
      Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          )),
      Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(description,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12.0,
              )))
    ]);
  }

  getPlantCard(
    String imgPath,
    String plantName,
  ) {
    return Stack(
      children: <Widget>[
        Container(
            height: 325.0,
            width: 225.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF399D63)),
              height: 250.0,
              width: 250.0,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(children: <Widget>[
                        SizedBox(height: 10.0),
                        //Text('IDK'),
                      ])
                    ],
                  ),
                  Image(
                    image: AssetImage(imgPath),
                    height: 165.0,
                    //width: 60,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            plantName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF8AC7A4),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63)),
                        child: Icon(Icons.wb_sunny,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                      SizedBox(width: 20.0),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF8AC7A4),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63)),
                        child: Icon(Icons.hot_tub,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                      SizedBox(width: 15.0),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF8AC7A4),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63)),
                        child: Icon(Icons.branding_watermark,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                      SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(color: Color(0xFF399D63)),
                          child: Icon(Icons.help_outline,
                              color: Colors.white.withOpacity(0.4), size: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Padding(
            padding: EdgeInsets.only(left: 90.0, top: 300.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black),
              child: Center(
                  child: Icon(Icons.arrow_circle_down, color: Colors.white)),
            ))
      ],
    );
  }
}
