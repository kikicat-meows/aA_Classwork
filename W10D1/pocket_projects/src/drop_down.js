
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let doglinks = [];
  dogs.forEach((dog)=> {
    let anchor = document.createElement('a');
    let k = Object.keys(dog)[0];
    anchor.innerHTML = k;
    anchor.href = dog[k];
    let tag = document.createElement('li');
    tag.className = 'dog-link';
    tag.append(a);
    doglinks.push(tag);
  });
  return doglinks;
}

function attachDogLinks(){
  let doglinks = dogLinkCreator();
  doglinks.forEach((dogLink) =>{
     +
  });
}