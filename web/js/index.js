async function checkSignIn() {

    const response = await fetch("CheckSignIn");

    if (response.ok) {

        const json = await response.json();

        const response_dto = json.response_dto;

        if (response_dto.success) {
            // signed in

            const user = response_dto.content;

            let st_quick_link = document.getElementById("st-quick-link");

            let st_quick_link_li_1 = document.getElementById("st-quick-link-li-1");
            st_quick_link_li_1.remove();

            let new_li_a_tag1 = document.createElement("a");
            new_li_a_tag1.href = "SignOut";
            new_li_a_tag1.innerHTML = "Signout";

            st_quick_link.appendChild(new_li_a_tag1);

        } else {
            //  not signed in
            console.log("not signed in");
        }

        //display last 3 products
        const productList = json.products;

        let i = 1;
        productList.forEach(product => {
            document.getElementById("homepage-product-title-" + i).innerHTML = product.title;
            document.getElementById("homepage-product-a-" + i).href = "single-product-view.html?pid=" + product.id;
            document.getElementById("homepage-img-" + i).src = "product_images/" + product.id + "/image1.png";
            document.getElementById("homepage-product-price-" + i).innerHTML = "Rs." + new Intl.NumberFormat(
                    "en-US",
                    {
                        minimumFractionDigits: 2
                    }
            ).format((product.price));
            document.getElementById("home-add-to-cart-" + i).addEventListener("click", (e) => {
                addToCart(product.id, 1);
                e.preventDefault();
            });
            document.getElementById("home-add-to-wish-" + i).addEventListener("click", (e) => {
                addToWishList(product.id);
                e.preventDefault();
            });
            i++;
        });
    }
}

$('.slider-content-activation-one').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: false,
    focusOnSelect: false,
    speed: 500,
    fade: true,
    autoplay: false,
    asNavFor: '.slider-thumb-activation-one'
});

$('.slider-thumb-activation-one').slick({
    infinite: true,
    slidesToShow: 2,
    slidesToScroll: 1,
    arrows: false,
    dots: true,
    focusOnSelect: false,
    speed: 1000,
    autoplay: true,
    asNavFor: '.slider-content-activation-one',
    prevArrow: '<button class="slide-arrow prev-arrow"><i class="fal fa-long-arrow-left"></i></button>',
    nextArrow: '<button class="slide-arrow next-arrow"><i class="fal fa-long-arrow-right"></i></button>',
    responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 1
            }
        }
    ]

});
async function addToCart(pid, qty) {

    const response = await fetch(
            "AddToCart?pid=" + pid + "&qty=" + qty
            );
    if (response.ok) {

        const json = await response.json();
        if (json.success) {
            Swal.fire({
                position: "center",
                icon: "success",
                title: json.content,
                showConfirmButton: false,
                timer: 1500
            });
        } else {
            Swal.fire({
                title: "Something went Wrong",
                text: json.content,
                icon: "error"
            });
        }
    } else {
        Swal.fire({
            title: "Please try again Later ",
            text: json.content,
            icon: "error"
        });
    }
}

    async function addToWishList(pid) {

        const response = await fetch(
                "addToWishList?pid=" + pid
                );
        if (response.ok) {

            const json = await response.json();
            if (json.success) {
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: json.content,
                    showConfirmButton: false,
                    timer: 1500
                });
            } else {
                Swal.fire({
                    title: "Something went Wrong",
                    text: json.content,
                    icon: "error"
                });
            }
        } else {
            Swal.fire({
                title: "Please try again Later ",
                text: json.content,
                icon: "error"
            });
        }

    }


