import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';

const initSwiper = () => {
  var swiper = new Swiper('.swiper-container', {
    slidesPerView: 2,
    spaceBetween: 30,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
  });
}

export {initSwiper}
