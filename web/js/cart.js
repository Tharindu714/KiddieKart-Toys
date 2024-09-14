async function loadCartItems() {

    const response = await fetch("LoadCartItems");


    if (response.ok) {
        const json = await response.json();

        if (json.length === 0) {
            popup.info({
                message: "No items available in your cart"
            });
        } else {

            let cartItemContainer = document.getElementById("cartItemContainer");
            let cartItemRow = document.getElementById("cartItemRow");
            cartItemContainer.innerHTML = "";

            let totalQty = 0;
            let total = 0;

            json.forEach(item => {

                let itemSubtotal = item.product.price * item.qty;
                total += itemSubtotal;

                totalQty += item.qty;

                let cartItemRowClone = cartItemRow.cloneNode(true);
                cartItemRowClone.querySelector("#cartItemA").href = "single-product-view.html?id=" + item.product.id;
                cartItemRowClone.querySelector("#cartItemImage").src = "product_images/" + item.product.id + "/image1.png";
                cartItemRowClone.querySelector("#cartItemTitle").innerHTML = item.product.title;
                cartItemRowClone.querySelector("#cartItemPrice").innerHTML = new Intl.NumberFormat(
                        "en-US",
                        {
                            minimumFractionDigits: 2
                        }
                ).format(item.product.price);

                cartItemRowClone.querySelector("#cartItemQty").value = item.qty;
                cartItemRowClone.querySelector("#cartItemSubtotal").innerHTML = new Intl.NumberFormat(
                        "en-US",
                        {
                            minimumFractionDigits: 2
                        }
                ).format((itemSubtotal));
                cartItemContainer.appendChild(cartItemRowClone);
            });

            document.getElementById("cartTotalQty").innerHTML = totalQty;

            document.getElementById("cartTotal").innerHTML = new Intl.NumberFormat(
                    "en-US",
                    {
                        minimumFractionDigits: 2
                    }
            ).format((total));
        }

    } else {
        Swal.fire({
            title: "Something went Wrong",
            text: json.content,
            icon: "error"
        });
    }

}


