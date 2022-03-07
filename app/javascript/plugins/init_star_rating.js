import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'fontawesome-stars'
  });
};

export { initStarRating };
