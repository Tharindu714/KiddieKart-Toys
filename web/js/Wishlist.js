async function loadWishItems() {

    const response = await fetch(
            "LoadWishItems"
            );

    if (response.ok) {

        const json = await response.json();

        if (json.length == 0) {
            Swal.fire({
                title: "Your Wishlist is Empty",
                text: json.content,
                icon: "error"
            });

        } else {

            console.log(json);

            let container = document.getElementById("wish-item-container");
            let row = document.getElementById("wish-item-row");
            container.innerHTML = "";

            json.forEach(item => {

                let RowClone = row.cloneNode(true);
                RowClone.querySelector("#wish-item-a").href = "single-product-view.html?pid=" + item.product.id;
                RowClone.querySelector("#wish-item-img").src = "product_images/" + item.product.id + "/image1.png";
                RowClone.querySelector("#wish-item-title").innerHTML = item.product.title;
                RowClone.querySelector("#wish-item-price").innerHTML = "Rs." + new Intl.NumberFormat(
                        "en-US",
                        {
                            minimumFractionDigits: 2
                        }
                ).format(item.product.price);
                container.appendChild(RowClone);

            });
        }

    } else {
        Swal.fire({
            title: "Unable to process your Request",
            text: json.content,
            icon: "error"
        });
    }

}


