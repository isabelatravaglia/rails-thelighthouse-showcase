// Instantiate the Bootstrap carousel
const initCarousel = () => {
    
    // document.querySelector('.multi-item-carousel').carousel({
    //     interval: false
    // });
    

    // for every slide in carousel, copy the next slide's item in the slide.
    // Do the same for the next, next item.
    const carItems = document.querySelectorAll('.multi-item-carousel .item');
    // debugger;
    carItems.forEach((item, i) => {
        console.log('%d: %s', i, item);
        let next = item.nextElementSibling;
        debugger;
        if (!next) {
            // next = item.nextElementSibling;
            next = carItems[0];
        }
        // debugger;
        let nextChildren = next.children[0];
        item.insertAdjacentElement("beforeend", nextChildren);
        debugger;
        
        // next.children[0].clone().appendTo(item);

        // if (next.nextElementSibling.innerHTML.length > 0 || next.nextElementSibling != null) {
        //     let nextChildren = next.children[0];
        //     debugger;
        //     item.insertAdjacentElement("beforeend", nextChildren);
        //     // next.nextElementSibling.children[0].clone().appendTo(item);
        // } else {
        //     let itemNextSibChild = item.nextElementSibling.children[0];
        //     item.insertAdjacentElement("beforeend", itemNextSibChild);
        //     // item.nextElementSibling.children[0].clone().appendTo(item);
        // }
    });

}
  export { initCarousel };