var swiper = new Swiper(".slide-container", {
  slidesPerView: 5,
  spaceBetween: 20,
  sliderPerGroup: 5,
  loop: true,
  centerSlide: "true",
  fade: "true",
  grabCursor: "true",
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
    dynamicBullets: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    520: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 3,
    },
    1000: {
      slidesPerView: 4,
    },
    1200: {
      slidesPerView: 5,
    },
  },
});



let products = [
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro1.png',
      curr_price: '1.300.000 VND'
  },
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro2.png',
      curr_price: '1.300.000 VND'
  },
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro3.png',
      curr_price: '1.300.000 VND'
  },
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro4.png',
      curr_price: '1.300.000 VND'
  },
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro5.png',
      curr_price: '300.000 VND'
  },
  {
      name: 'Xe Đạp Touring LIV Alight 3 DD',
      image1: './fe/images/pro6.png',
      curr_price: '1.300.000 VND'
  },
  {
    name: 'Xe Đạp Touring LIV Alight 3 DD',
    image1: './fe/images/pro7.png',
    curr_price: '1.300.000 VND'
  },
  {
    name: 'Xe Đạp Touring LIV Alight 3 DD',
    image1: './fe/images/pro7.png',
    curr_price: '1.300.000 VND'
  },

]

let product_list = document.querySelector('#products')

renderProducts = (products) => {
  products.forEach(e => {
      let prod = `
      <div class="col-lg-3 col-md-6 col-sm-12 mt-4">
                            <div class="box">
                                <div class="product-content">
                                    <a href=""><img src="${e.image1}" alt="" class="product-img"></a>

                                    <div class="product-data">
                                        <span class="product-band">Dung Chinh</span>
                                        <h2 class="product-title">${e.name}</h2>
                                        <p class="product-price">${e.curr_price}</p>
                                        <div class="productbtn-box d-flex">
                                          <a href="#" class="product-btn">Chi tiết</a>
                                          <a href="#" class="product-buy">Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
  `

  product_list.insertAdjacentHTML("beforeend", prod)
  })
}

renderProducts(products)
renderProducts(products)
