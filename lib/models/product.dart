class Product {
   int id;
   String name;
   String category;
   String description;
   double price;
   String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: 'Chanel COCO',
    category: 'Perfume',
    description: 'COCO MADEMOISELLE',
    price: 165.00,
    imageUrl:
        'https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_620/coco-mademoiselle-eau-de-parfum-intense-spray-3-4fl-oz--packshot-default-116660-9539148283934.jpg',
  ),
  Product(
    id: 2,
    name: 'Chanel N5',
    category: 'Perfume',
    description: 'N°5',
    price: 165.00,
    imageUrl:
        'https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_620/n-5-eau-de-parfum-spray-3-4fl-oz--packshot-default-125530-9539148742686.jpg',
  ),
  Product(
    id: 3,
    name: 'Chanel body N°5',
    category: 'Perfume',
    description: 'Body lotion N°5',
    price: 64.00,
    imageUrl:
        'https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_620/n-5-the-body-lotion-6-8fl-oz--packshot-default-105748-8835353247774.jpg',
  ),
  Product(
    id: 4,
    name: 'Chanel Gabrielle',
    category: 'Perfume',
    description: 'Gabrielle Chanel Essence',
    price: 105.00,
    imageUrl:
        'https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_620/gabrielle-chanel-essence-eau-de-parfum-spray-3-4fl-oz--packshot-default-120630-9539148120094.jpg',
  ),
  Product(
    id: 5,
    name: 'LA MOUSSE',
    category: 'SkinProduct',
    description: 'Anti-Pollution Cleansing Cream-to-Foam',
    price: 55.00,
    imageUrl:
        'https://www.chanel.com/images//t_one//w_0.63,h_0.63,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_620/la-mousse-anti-pollution-cleansing-cream-to-foam-5fl-oz--packshot-default-141450-8845081378846.jpg',
  ),
  Product(
      id: 6,
      name: 'The ordinary serum',
      category: 'SkinProduct',
      description: 'blemish-prone skin that smooths and brightens.',
      price: 8.00,
      imageUrl:
          'https://eclatbody.com/cdn/shop/products/the-ordinary-argireline-10-face-serum-834979.webp?v=1671501743'),
  Product(
      id: 7,
      name: 'The ordinary Squalane',
      category: 'SkinProduct',
      description: 'A moisturizing all-in-one cleanser',
      price: 11.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgM4d9CMSjM5FGJcdqOITYbYbb5P2tKojkpg&s'),
  Product(
    id: 8,
    name: 'The ordinary Glucoside',
    category: 'SkinProduct',
    description: 'foaming cleanser.',
    price: 15.00,
    imageUrl:
    'https://cdn11.bigcommerce.com/s-63354/images/stencil/1280x1280/products/6837/16779/The_Ordinary_-_Glucoside_Foaming_Cleanser_150ml_live_2__11740.1687171417.jpg?c=2&imbypass=on',
  ),
  Product(
    id: 9,
    name: 'Ruby Rose Mask',
    category: 'SkinProduct',
    description: 'Hydrating & Purifying Tissue Mask',
    price: 3.00,
    imageUrl:
    'https://mykady.com/cdn/shop/products/rubyroseniaciamidmask.webp?v=1735209378'
  ),
  Product(
    id: 10,
    name: 'Carolina Herrera',
    category: 'Perfume',
    description: 'Good Girl SUPERSTAR',
    price: 120.00,
    imageUrl:
        'data:image/jpeg;base64,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',
  ),
  
   Product(
    id: 11,
    name: 'La Roche cleanser',
    category: 'SkinProduct',
    description: 'Facial cleanser,normal & dry skin',
    price: 16.99,
    imageUrl:
        'data:image/webp;base64,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',
  ),
  Product(
    id: 12,
    name: 'Victoria Secrets COCO',
    category: 'Perfume',
    description: 'coconuts frangrancy',
    price: 14.00,
    imageUrl:
        'data:image/jpeg;base64,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',
  ),
  Product(
    id: 13,
    name: 'Victoria Secrets bodysplash',
    category: 'Perfume',
    description: 'brume perfume',
    price: 16.00,
    imageUrl: 'https://m.media-amazon.com/images/I/718MDB7Bu9L._SX425_.jpg',
  ),
  Product(
    id: 14,
    name: 'Victoria Secrets Vanilla',
    category: 'Perfume',
    description: 'Vanilla body spray for woman',
    price: 15.00,
    imageUrl:
'https://m.media-amazon.com/images/I/51GyscNBryL._SL1000_.jpg' 
 ),
  Product(
    id: 15,
    name: 'Carolina Herrera 212',
    category: 'Perfume',
    description: 'eua de perfum',
    price: 96.00,
    imageUrl: 'https://m.media-amazon.com/images/I/410IF1VoRIL.jpg',
  ),
  Product(
    id: 16,
    name: 'Revlon primer',
    category: 'SkinProduct',
    description: 'primer pre-makeup',
    price: 16.00,
    imageUrl:
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/a10482ee-12b9-4791-9462-034f0ea1c9cc.__CR0,0,1920,1920_PT0_SX300_V1___.jpg',
  ),
  // Add the rest of the products here...
];
