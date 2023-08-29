'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "f3113fe205df1413a6aa5b87118ef1de",
"assets/assets/fonts/agustina.otf": "7b9833076716a8d14eec0cf885a3153c",
"assets/assets/fonts/andina.ttf": "2349c4ffb7293b5f88e8538ec577a8d4",
"assets/assets/fonts/googlesansebold.ttf": "4457817ac2b9993c65e81aa05828fe9c",
"assets/assets/fonts/googlesansmedium.ttf": "8d57e4014b18edef070d285746485115",
"assets/assets/fonts/googlesansregular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/assets/fonts/montserrat.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/assets/images/android.png": "765adf924dae4d5e67bfb640bcd05c48",
"assets/assets/images/c1.png": "76152440ea88006ba6cbc4b7b28680f9",
"assets/assets/images/c2.jpg": "ee70dbeec6792ebaca57fa9899d39c74",
"assets/assets/images/c3.jpg": "0529de2b4f0982064ba7768560495880",
"assets/assets/images/c4.jpg": "75408ec587ba1a7cc4d93d4d85b4f9cd",
"assets/assets/images/deaf-sign.png": "e11ee25cbf91926e99012d15bc5705f6",
"assets/assets/images/deaf-sign1.png": "27647685211a12fe693e3f188f9c11da",
"assets/assets/images/deaf.png": "e38fec8ebc9df0bbfe66a9535a5fd818",
"assets/assets/images/deaf1.png": "73e31bfaa181958852c220c57081ebad",
"assets/assets/images/eddiehub.png": "02015c2c25dcc83de511b35fc6026e6f",
"assets/assets/images/flutter.png": "0b5a2f8d3f4d173805affaf9f84f6c87",
"assets/assets/images/hi.gif": "cad5918d86b6a7e83f1fb4acead70e4c",
"assets/assets/images/open.png": "4a5996597d32b06d91183f0860c29aab",
"assets/assets/images/p3.png": "51291caeb80b6388dc67fa4edfe5f3bb",
"assets/assets/images/port.png": "e86407209aedca6d119b33708f8930c8",
"assets/assets/images/port2.png": "34fd13c3aff1f52e4a5ebf786ef4e8db",
"assets/assets/images/Programmer.png": "87f2b0153f021771d64fe1ec20076855",
"assets/assets/images/satyam.png": "e28f71a5a1ed09abc6e7b983a98120eb",
"assets/assets/images/TaskTrove-logo.png": "bb5c2e96fa963b917351b6970b21314b",
"assets/assets/images/TaskTrove.png": "a48657a416450ac1132b6eeabb6e6e24",
"assets/assets/images/Wallet-Watcher-logo.png": "adaf27e4ca656eebc91f4d284051a0cb",
"assets/assets/images/Wallet-Watcher.png": "6de6ffc07b968a92826ad2bca100a90d",
"assets/assets/images/weather-logo.png": "024711fe648540c25f58e95663fa6425",
"assets/assets/images/weather.png": "4c0d33ea9b420651b252889e288a5e6e",
"assets/FontManifest.json": "50389afa4e0404af28f102c32df25430",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "69811abaf3202a661dd4882ad1215bcb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"favicon.png": "1e18e53f0e1f219cbdd0cc65927a762c",
"icons/Icon-192.png": "c8d2a7392701b25c66cddd17bbd6ef79",
"icons/Icon-512.png": "836547646e881a8e04b9a97745165d42",
"index.html": "a4cef36cb2b38e9305220569daf0bc95",
"/": "a4cef36cb2b38e9305220569daf0bc95",
"loader.css": "158b89105d79aba0a6f532217dcf59b3",
"main.dart.js": "e980b7b113fee29ac20e9742a35a46c7",
"manifest.json": "31e536c0597009b2cabff97fe0bef13a",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
