'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "595fe6cca9414d3b054d3c88354dfe34",
"assets/AssetManifest.bin.json": "8a36ed144fb02b457b1a9aa3109cad11",
"assets/AssetManifest.json": "04dd38fd2074770dd32815b796b19ab5",
"assets/assets/images/%25231%2520Digital%2520Marketing%2520Company%2520In%2520Surat.jpg": "5a0729b9b78d9f3a5dc7bdfb2a1e5176",
"assets/assets/images/Aesthetic%2520Wallpapers.jpg": "824934b6e256d898681a635d31a8b02c",
"assets/assets/images/b428b70f-d6c2-42c9-9085-eca37d2ae975.jpg": "bc23beca3740d538dc2032c97b89db88",
"assets/assets/images/Background.jpg": "6d6d6a76f75f76aaeae9787c052517a9",
"assets/assets/images/birdies.jpg": "fbc8c04360d5a0336154add9da7c4e3d",
"assets/assets/images/Delivery-amico.png": "2db0c7aacbf53ebb518a6d02e13f491d",
"assets/assets/images/Delivery-pana.png": "c85f7fcddccc270d4473a3bddc867871",
"assets/assets/images/delivery-removebg-preview.png": "c5a5e4142322a38473a3a16aadb88b7a",
"assets/assets/images/Digital%2520lifestyle-amico.png": "7f11057075af28a6012b5fc4c3f76660",
"assets/assets/images/Digital%2520tools-amico.png": "5d1f8a48f1722dc8ed72631566154a96",
"assets/assets/images/Flex%2520V2%2520-%2520Campaign%2520%255BCrestron%2520Electronics,%2520Inc_%255D.jpg": "46e2f73c58401e211c8db84bcfdb82c8",
"assets/assets/images/Group%2520Chat-bro.png": "8e998cbb208c77338ea9a71d430862e7",
"assets/assets/images/Home%2520Appliance%2520Banner%2520Post%2520Design%2520(1).jpg": "0962cef91c1ac7bac86d9fe46185b017",
"assets/assets/images/Home%2520Appliance%2520Banner%2520Post%2520Design.jpg": "f5ae7f979eebdde5ee830404755684db",
"assets/assets/images/lady-removebg-preview.png": "2e41407016ea7641bcb259fe0cb7c39a",
"assets/assets/images/Looking%2520for%2520an%2520ideal%2520gift_%2520Grab%2520amazing%2520Bakrid%2520special%2520Discounts%2520on%2520Electronics,%2520Mobiles,%2520Household%2520&%2520more_%2520Shop%2520Now%2520@%2520http___goo.gl_yZfAaS": "640a817a62f55ba1076c6216a9974852",
"assets/assets/images/Low%2520code%2520development-amico.png": "040913fac9a80df5fefe1325a25741e4",
"assets/assets/images/MacBook%2520Air%252013%2520(2018-2019)%2520Skins%2520-%2520Custom%2520_%2520Body%2520+%2520Keyboard%2520Surround.jpg": "75080d31e6448f0ed41108d6e9966c85",
"assets/assets/images/Mobile%2520development-amico.png": "b34094d2465a279c39fb0c8accc6e0f8",
"assets/assets/images/Mouse%2520Designs%2520that%2520will%2520elevate%2520every%2520gadget%2520lover%25E2%2580%2599s%2520desktop_%2520Part%25202%2520_%2520Yanko%2520Design.jpg": "460b003936a9f1033b0bbcb4f01c23a8",
"assets/assets/images/Muslim%2520graduation-pana.svg": "405fd35ebe229056da83e995357d284e",
"assets/assets/images/Premium%2520Vector%2520_%2520Laptop%2520or%2520gadget%2520for%2520sale%2520social%2520media%2520instagram%2520post%2520banner%2520template.jpg": "56870fdd57cc665bead7334a9554a1c0",
"assets/assets/images/profile.jpg": "c43a4c5c90e7b9b3ec49d3189c820a59",
"assets/assets/images/Refer%2520a%2520friend-pana.png": "984a5ba924a7e8104149b6b5eb0f4b96",
"assets/assets/images/Service%252024_7-bro.png": "37986252849abc91d69413f95a633e26",
"assets/assets/images/takeaway.png": "69667b0737ed815cbeda56dfbf853631",
"assets/assets/images/The%2520Average%2520Life%2520Span%2520of%2520the%2520Appliances%2520in%2520Your%2520Home.jpg": "de290137d72ced7f48ecd491f5314f3c",
"assets/assets/images/Website%2520designer-bro.png": "c1ec5330c1885464a321092265cfb860",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d328a514805c33f4bb1416edf96cf1a7",
"assets/lib/screens/authentication/data.json": "b92786f1ed97a5c765fbc0baaed618b1",
"assets/NOTICES": "6b81ed534f5575c0cdc41c4cb96736f8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/dash_chat_2/assets/placeholder.png": "ce1fece6c831b69b75c6c25a60b5b0f3",
"assets/packages/dash_chat_2/assets/profile_placeholder.png": "77f5794e2eb49f7989b8f85e92cfa4e0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "6996e4560d407f5098036c6e45d15601",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "02c314b4e9374ffeea67257513c1be0e",
"/": "02c314b4e9374ffeea67257513c1be0e",
"main.dart.js": "1b6b4d894c4a6e4cf1bb7dff12cc2e07",
"manifest.json": "29fd6dc6963d09b4fe74db6a58153603",
"version.json": "b189ec33f2a781e1a49a095c5cf1befc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
