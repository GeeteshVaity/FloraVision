class FlowerInfo {
  final String simplifiedName;
  final String funFact;

  const FlowerInfo({
    required this.simplifiedName,
    required this.funFact,
  });
}

class FlowerData {
  static const Map<String, FlowerInfo> flowers = {
    'pink primrose': FlowerInfo(
      simplifiedName: 'Primrose',
      funFact: 'Symbolizes young love and eternal grace.',
    ),
    'hard-leaved pocket orchid': FlowerInfo(
      simplifiedName: 'Pocket Orchid',
      funFact: 'Named for its pouch-like petal that traps insects for pollination.',
    ),
    'canterbury bells': FlowerInfo(
      simplifiedName: 'Canterbury Bells',
      funFact: 'These bell-shaped flowers were once associated with St. Thomas Becket.',
    ),
    'sweet pea': FlowerInfo(
      simplifiedName: 'Sweet Pea',
      funFact: 'Famous for its intense fragrance, it\'s a staple in cottage gardens.',
    ),
    'english marigold': FlowerInfo(
      simplifiedName: 'English Marigold',
      funFact: 'Often called "Pot Marigold," its petals are edible and used in salads.',
    ),
    'tiger lily': FlowerInfo(
      simplifiedName: 'Tiger Lily',
      funFact: 'Known for its spotted orange petals that resemble a tiger\'s coat.',
    ),
    'moon orchid': FlowerInfo(
      simplifiedName: 'Moon Orchid',
      funFact: 'One of Indonesia\'s national flowers, it can bloom for months.',
    ),
    'bird of paradise': FlowerInfo(
      simplifiedName: 'Bird of Paradise',
      funFact: 'Its unique shape resembles a colorful crane in flight.',
    ),
    'monkshood': FlowerInfo(
      simplifiedName: 'Monkshood',
      funFact: 'While beautiful, this plant is highly toxic and was once used on arrow tips.',
    ),
    'globe thistle': FlowerInfo(
      simplifiedName: 'Globe Thistle',
      funFact: 'Attracts bees and butterflies with its perfectly spherical blue blooms.',
    ),
    'snapdragon': FlowerInfo(
      simplifiedName: 'Snapdragon',
      funFact: 'Its petals "snap" shut when squeezed, mimicking a dragon\'s mouth.',
    ),
    'colt\'s foot': FlowerInfo(
      simplifiedName: 'Colt\'s Foot',
      funFact: 'Named because its leaves are shaped like the hoof of a young horse.',
    ),
    'king protea': FlowerInfo(
      simplifiedName: 'King Protea',
      funFact: 'The national flower of South Africa, it can survive harsh wildfires.',
    ),
    'spear thistle': FlowerInfo(
      simplifiedName: 'Spear Thistle',
      funFact: 'The national emblem of Scotland, known for its prickly defense.',
    ),
    'yellow iris': FlowerInfo(
      simplifiedName: 'Yellow Iris',
      funFact: 'Traditionally used to help purify water in wetlands.',
    ),
    'globe-flower': FlowerInfo(
      simplifiedName: 'Globe-flower',
      funFact: 'Its petals curve inward, creating a protected "globe" for pollinators.',
    ),
    'purple coneflower': FlowerInfo(
      simplifiedName: 'Echinacea',
      funFact: 'Also known as Echinacea, it\'s widely used in traditional medicine.',
    ),
    'peruvian lily': FlowerInfo(
      simplifiedName: 'Peruvian Lily',
      funFact: 'Each petal often features unique streaks or freckles.',
    ),
    'balloon flower': FlowerInfo(
      simplifiedName: 'Balloon Flower',
      funFact: 'Its buds swell up like balloons before bursting open into stars.',
    ),
    'giant white arum lily': FlowerInfo(
      simplifiedName: 'Calla Lily',
      funFact: 'Not a true lily, but famous for its elegant, sleek white spathe.',
    ),
    'fire lily': FlowerInfo(
      simplifiedName: 'Fire Lily',
      funFact: 'These flowers often bloom shortly after a bushfire has passed.',
    ),
    'pincushion flower': FlowerInfo(
      simplifiedName: 'Pincushion Flower',
      funFact: 'The center of the flower looks like a pincushion filled with needles.',
    ),
    'fritillary': FlowerInfo(
      simplifiedName: 'Fritillary',
      funFact: 'Some species feature a rare, natural checkerboard pattern on their petals.',
    ),
    'red ginger': FlowerInfo(
      simplifiedName: 'Red Ginger',
      funFact: 'The "flower" is actually a collection of bright red leaves called bracts.',
    ),
    'grape hyacinth': FlowerInfo(
      simplifiedName: 'Grape Hyacinth',
      funFact: 'These tiny clustered blooms look like miniature bunches of grapes.',
    ),
    'corn poppy': FlowerInfo(
      simplifiedName: 'Corn Poppy',
      funFact: 'A symbol of remembrance, these flowers often grow in disturbed soil.',
    ),
    'prince of wales feathers': FlowerInfo(
      simplifiedName: 'Celosia',
      funFact: 'Its velvety flower heads look like plumes of exotic feathers.',
    ),
    'stemless gentian': FlowerInfo(
      simplifiedName: 'Gentian',
      funFact: 'Known for its rare, deep trumpet-blue color.',
    ),
    'artichoke': FlowerInfo(
      simplifiedName: 'Artichoke',
      funFact: 'The part we eat is actually the immature flower bud of a thistle.',
    ),
    'sweet william': FlowerInfo(
      simplifiedName: 'Sweet William',
      funFact: 'Legend says it was named after William the Conqueror.',
    ),
    'carnation': FlowerInfo(
      simplifiedName: 'Carnation',
      funFact: 'One of the oldest cultivated flowers, dating back over 2,000 years.',
    ),
    'garden phlox': FlowerInfo(
      simplifiedName: 'Phlox',
      funFact: 'Its name comes from the Greek word for "flame."',
    ),
    'love in the mist': FlowerInfo(
      simplifiedName: 'Love in the Mist',
      funFact: 'The delicate flowers are surrounded by a misty web of fine foliage.',
    ),
    'mexican aster': FlowerInfo(
      simplifiedName: 'Cosmos',
      funFact: 'Its name "Cosmos" signifies order and harmony in the universe.',
    ),
    'alpine sea holly': FlowerInfo(
      simplifiedName: 'Sea Holly',
      funFact: 'Its metallic blue sheen helps it reflect harsh mountain sunlight.',
    ),
    'ruby-lipped cattleya': FlowerInfo(
      simplifiedName: 'Cattleya Orchid',
      funFact: 'Often called the "Queen of Orchids" for its large, showy blooms.',
    ),
    'cape flower': FlowerInfo(
      simplifiedName: 'Cape Flower',
      funFact: 'Hails from the diverse floral kingdom of South Africa.',
    ),
    'great masterwort': FlowerInfo(
      simplifiedName: 'Masterwort',
      funFact: 'The name comes from "aster," meaning star, referring to its shape.',
    ),
    'siam tulip': FlowerInfo(
      simplifiedName: 'Siam Tulip',
      funFact: 'Despite the name, it\'s actually a member of the ginger family.',
    ),
    'lenten rose': FlowerInfo(
      simplifiedName: 'Hellebore',
      funFact: 'Blooms in late winter or early spring, often through the snow.',
    ),
    'barbeton daisy': FlowerInfo(
      simplifiedName: 'Gerbera Daisy',
      funFact: 'The fifth most popular cut flower in the world.',
    ),
    'daffodil': FlowerInfo(
      simplifiedName: 'Daffodil',
      funFact: 'Their arrival is one of the first signs that spring has started.',
    ),
    'sword lily': FlowerInfo(
      simplifiedName: 'Gladiolus',
      funFact: 'Named for their sword-shaped leaves (Gladius in Latin).',
    ),
    'poinsettia': FlowerInfo(
      simplifiedName: 'Poinsettia',
      funFact: 'Its "petals" are actually leaves that change color via photoperiodism.',
    ),
    'bolero deep blue': FlowerInfo(
      simplifiedName: 'Bolero',
      funFact: 'A variety of Eustoma known for its deep, romantic blue hues.',
    ),
    'wallflower': FlowerInfo(
      simplifiedName: 'Wallflower',
      funFact: 'So named because it often grows in the cracks of old stone walls.',
    ),
    'marigold': FlowerInfo(
      simplifiedName: 'Marigold',
      funFact: 'Used in many cultures to celebrate and honor the sun.',
    ),
    'buttercup': FlowerInfo(
      simplifiedName: 'Buttercup',
      funFact: 'Folklore says if you hold one under your chin and see yellow, you like butter.',
    ),
    'oxeye daisy': FlowerInfo(
      simplifiedName: 'Oxeye Daisy',
      funFact: 'Its name comes from its resemblance to the eye of an ox.',
    ),
    'common dandelion': FlowerInfo(
      simplifiedName: 'Dandelion',
      funFact: 'Every part of this plant is edible, from the roots to the flowers.',
    ),
    'petunia': FlowerInfo(
      simplifiedName: 'Petunia',
      funFact: 'They are closely related to tobacco and tomatoes.',
    ),
    'wild pansy': FlowerInfo(
      simplifiedName: 'Wild Pansy',
      funFact: 'Also known as "Heart\'s Ease," it was used in early love potions.',
    ),
    'primula': FlowerInfo(
      simplifiedName: 'Primula',
      funFact: 'One of the first flowers to bloom when the ground warms up.',
    ),
    'sunflower': FlowerInfo(
      simplifiedName: 'Sunflower',
      funFact: 'Young sunflowers track the sun\'s movement across the sky.',
    ),
    'pelargonium': FlowerInfo(
      simplifiedName: 'Pelargonium',
      funFact: 'Often confused with geraniums, they have a distinct floral scent.',
    ),
    'bishop of llandaff': FlowerInfo(
      simplifiedName: 'Dahlia',
      funFact: 'A famous dark-foliaged dahlia with striking red blooms.',
    ),
    'gaura': FlowerInfo(
      simplifiedName: 'Gaura',
      funFact: 'Also called "Whirling Butterflies" because of how they move in the wind.',
    ),
    'geranium': FlowerInfo(
      simplifiedName: 'Geranium',
      funFact: 'Known for their hardy nature and vibrant, clusters of flowers.',
    ),
    'orange dahlia': FlowerInfo(
      simplifiedName: 'Orange Dahlia',
      funFact: 'Dahlias were originally grown as a food crop by the Aztecs.',
    ),
    'pink-yellow dahlia?': FlowerInfo(
      simplifiedName: 'Bicolor Dahlia',
      funFact: 'Dahlias come in almost every color except blue.',
    ),
    'cautleya spicata': FlowerInfo(
      simplifiedName: 'Cautleya',
      funFact: 'A hardy ginger relative that adds a tropical look to gardens.',
    ),
    'japanese anemone': FlowerInfo(
      simplifiedName: 'Japanese Anemone',
      funFact: 'These graceful flowers dance on tall, wiry stems in autumn.',
    ),
    'black-eyed susan': FlowerInfo(
      simplifiedName: 'Black-eyed Susan',
      funFact: 'A member of the sunflower family, it\'s a staple of North American prairies.',
    ),
    'silverbush': FlowerInfo(
      simplifiedName: 'Silverbush',
      funFact: 'Its silvery leaves help the plant conserve water in hot climates.',
    ),
    'californian poppy': FlowerInfo(
      simplifiedName: 'California Poppy',
      funFact: 'Its petals close at night and during cloudy weather.',
    ),
    'osteospermum': FlowerInfo(
      simplifiedName: 'African Daisy',
      funFact: 'These daisies come in unique shades like copper and purple.',
    ),
    'spring crocus': FlowerInfo(
      simplifiedName: 'Crocus',
      funFact: 'The source of the spice saffron is a specific type of crocus.',
    ),
    'bearded iris': FlowerInfo(
      simplifiedName: 'Bearded Iris',
      funFact: 'Named for the "beard" of fuzzy hairs on its lower petals.',
    ),
    'windflower': FlowerInfo(
      simplifiedName: 'Anemone',
      funFact: 'Legend says they open only when the wind blows.',
    ),
    'tree poppy': FlowerInfo(
      simplifiedName: 'Tree Poppy',
      funFact: 'A rare shrub that produces bright yellow, poppy-like flowers.',
    ),
    'gazania': FlowerInfo(
      simplifiedName: 'Treasure Flower',
      funFact: 'The flowers close tight on cloudy days and at night.',
    ),
    'azalea': FlowerInfo(
      simplifiedName: 'Azalea',
      funFact: 'Known as the "Royalty of the Garden" for their spectacular blooms.',
    ),
    'water lily': FlowerInfo(
      simplifiedName: 'Water Lily',
      funFact: 'They help keep pond water clean and provide shade for fish.',
    ),
    'rose': FlowerInfo(
      simplifiedName: 'Rose',
      funFact: 'Each color has a meaning; red for love, yellow for friendship.',
    ),
    'thorn apple': FlowerInfo(
      simplifiedName: 'Datura',
      funFact: 'Its flowers only open at night and emit a sweet fragrance.',
    ),
    'morning glory': FlowerInfo(
      simplifiedName: 'Morning Glory',
      funFact: 'Their flowers unfurl in the morning and die by the evening.',
    ),
    'passion flower': FlowerInfo(
      simplifiedName: 'Passion Flower',
      funFact: 'Its complex structure was used by missionaries to explain their faith.',
    ),
    'lotus': FlowerInfo(
      simplifiedName: 'Lotus',
      funFact: 'The flower emerges clean from muddy waters, symbolizing purity.',
    ),
    'toad lily': FlowerInfo(
      simplifiedName: 'Toad Lily',
      funFact: 'Named for the spotted petals that resemble a toad\'s skin.',
    ),
    'anthurium': FlowerInfo(
      simplifiedName: 'Anthurium',
      funFact: 'Also known as the "Flamingo Flower" for its bright red spathe.',
    ),
    'frangipani': FlowerInfo(
      simplifiedName: 'Plumeria',
      funFact: 'Their scent is most intense at night to attract sphinx moths.',
    ),
    'clematis': FlowerInfo(
      simplifiedName: 'Clematis',
      funFact: 'Often called the "Queen of Climbers" for its ability to scale walls.',
    ),
    'hibiscus': FlowerInfo(
      simplifiedName: 'Hibiscus',
      funFact: 'Some species are used to make a tart, vitamin-rich tea.',
    ),
    'columbine': FlowerInfo(
      simplifiedName: 'Columbine',
      funFact: 'The name comes from the Latin word for "dove."',
    ),
    'desert-rose': FlowerInfo(
      simplifiedName: 'Desert Rose',
      funFact: 'A succulent that stores water in its thick, swollen trunk.',
    ),
    'tree mallow': FlowerInfo(
      simplifiedName: 'Tree Mallow',
      funFact: 'A fast-growing shrub that thrives in coastal environments.',
    ),
    'magnolia': FlowerInfo(
      simplifiedName: 'Magnolia',
      funFact: 'These flowers are so old they were around before bees existed.',
    ),
    'cyclamen': FlowerInfo(
      simplifiedName: 'Cyclamen',
      funFact: 'The petals grow upwards, giving them a unique "inside-out" look.',
    ),
    'watercress': FlowerInfo(
      simplifiedName: 'Watercress',
      funFact: 'Not just a garnish, it produces small white flowers in the wild.',
    ),
    'canna lily': FlowerInfo(
      simplifiedName: 'Canna Lily',
      funFact: 'Their seeds are so hard they were once used as shotgun pellets.',
    ),
    'hippeastrum': FlowerInfo(
      simplifiedName: 'Amaryllis',
      funFact: 'Often forced to bloom indoors during the winter holidays.',
    ),
    'bee balm': FlowerInfo(
      simplifiedName: 'Bee Balm',
      funFact: 'Its leaves can be used to make Oswego tea.',
    ),
    'ball moss': FlowerInfo(
      simplifiedName: 'Ball Moss',
      funFact: 'Not actually a moss, but a "true air plant" related to pineapples.',
    ),
    'foxglove': FlowerInfo(
      simplifiedName: 'Foxglove',
      funFact: 'A source of digitalis, used in medicine to treat heart conditions.',
    ),
    'bougainvillea': FlowerInfo(
      simplifiedName: 'Bougainvillea',
      funFact: 'The "petals" are actually brightly colored leaves called bracts.',
    ),
    'camellia': FlowerInfo(
      simplifiedName: 'Camellia',
      funFact: 'Known as the "Rose of Winter," they bloom when most others rest.',
    ),
    'mallow': FlowerInfo(
      simplifiedName: 'Mallow',
      funFact: 'The original marshmallow treat was made from the roots of this plant.',
    ),
    'mexican petunia': FlowerInfo(
      simplifiedName: 'Mexican Petunia',
      funFact: 'A hardy plant that can thrive in both wet and dry conditions.',
    ),
    'bromelia': FlowerInfo(
      simplifiedName: 'Bromeliad',
      funFact: 'These plants often trap water in their leaves to create mini-ecosystems.',
    ),
    'blanket flower': FlowerInfo(
      simplifiedName: 'Blanket Flower',
      funFact: 'Named for its resemblance to the brightly colored blankets of Native Americans.',
    ),
    'trumpet creeper': FlowerInfo(
      simplifiedName: 'Trumpet Vine',
      funFact: 'A favorite of hummingbirds due to its tubular shape.',
    ),
    'blackberry lily': FlowerInfo(
      simplifiedName: 'Leopard Lily',
      funFact: 'The seed pods split open to reveal seeds that look like blackberries.',
    ),
  };
}
