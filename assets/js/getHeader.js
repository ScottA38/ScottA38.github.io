function xmlRequest(url)
{
  let xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function () {
    console.log(this.responseXML);
  }
  xmlhttp.open("GET", url);
  xmlhttp.responseType = "json";
  xmlhttp.send();
}

// xmlhttp.onload = function () {
//   let head = this.responseXML.head;
//   let ogAttrs = {
//     "og:title": null,
//     "og:type": null,
//     "og:image": null,
//     "og:url": null
//   }
//   let metas = head.getElementsbyTagName('meta');
//   for(let i = 0; i < metas.length; i++)
//   {
//     if(metas[i].hasAttribute)
//   }
// }
